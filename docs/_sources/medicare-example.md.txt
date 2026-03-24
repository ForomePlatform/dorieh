# Example: Medicare Processing Pipeline (with PostgreSQL)

```{contents}
---
local:
---
```

```{seealso}
[Medicare: Building a Data Warehouse from ResDac Files](Medicare.md)
[Using HLL for Approximate Count Distinct](UsingHLL.md)
[Using Dorieh with PostgreSQL Backend](https://github.com/ForomePlatform/dorieh/tree/main/examples/with-postgres)
```

This example demonstrates a full Dorieh data processing pipeline run against a
**publicly available synthetic** Medicare-like dataset.  Because the data are
synthetic and published openly on [Zenodo](https://zenodo.org/records/18915558),
no institutional data access agreement is required to follow this example.
It covers:

* Downloading synthetic sample data from Zenodo
* Running the Medicare CWL workflow with [Toil](https://toil.readthedocs.io/en/latest/)
  against a local PostgreSQL instance
* (Optional) Exploring the results in a pre-built
  [Apache Superset](https://superset.apache.org/) dashboard

The source files for this example live in
[`examples/with-postgres/medicare/`](https://github.com/ForomePlatform/dorieh/tree/main/examples/with-postgres/medicare).

---

## Prerequisites

Before starting, make sure you have:

1. **PostgreSQL running** and a `database.ini` ready — follow the steps in
   [Using Dorieh with PostgreSQL Backend](https://github.com/ForomePlatform/dorieh/tree/main/examples/with-postgres).
   If you want a quick non-production setup, use the bundled Docker Compose file:

   ```bash
   cd $WORKDIR/dorieh/docker/pg-hll/
   docker compose up -d
   ```

2. **Toil installed** and tested — see
   [Installing Dorieh and testing the installation](https://foromeplatform.github.io/dorieh/examples.html#installing-dorieh-and-testing-the-installation).

3. The **`dorieh` repository cloned** under `$WORKDIR`:

   ```bash
   git clone https://github.com/ForomePlatform/dorieh.git $WORKDIR/dorieh
   ```

Then move into the Medicare example directory:

```bash
cd $WORKDIR/dorieh/examples/with-postgres/medicare
```

---

## Step 1 — Download synthetic sample data

The synthetic Medicare-like dataset is hosted on
[Zenodo](https://zenodo.org/records/18915558) and is **publicly available** —
no data use agreement or institutional access is required.  It:

* Mimics the raw fixed-width files (`.dat`) delivered by ResDAC
* Reproduces the File Transfer Summary (FTS) layout metadata
* Contains **no real PHI / PII** — it is safe for testing, demonstrations,
  and sharing

Download and unpack it:

```bash
mkdir -p data
pushd data

curl -fLo medicare-synthetic-database.zip \
  'https://zenodo.org/records/18915558/files/medicare-synthetic-database-v1.zip?download=1'

unzip medicare-synthetic-database.zip

popd
```

The extracted directory tree follows the layout expected by the ingestion
pipeline — one sub-directory per year, each containing `.fts` metadata files
and the corresponding `.dat` data files.

---

## Step 2 — Run the Medicare processing pipeline

Activate your Toil virtual environment:

```bash
source $TOIL_VENV/bin/activate
```

Run the Medicare CWL workflow:

```bash
toil-cwl-runner \
  --jobStore j1 \
  --retryCount 1 \
  --cleanWorkDir never \
  --outdir outputs \
  --workDir . \
  https://raw.githubusercontent.com/ForomePlatform/dorieh/refs/heads/main/src/workflows/medicare.cwl \
  --input data/ \
  --database https://raw.githubusercontent.com/ForomePlatform/dorieh/refs/heads/main/examples/with-postgres/database.ini \
  --connection_name dorieh
```

After the workflow completes:

* Processed data is stored in your PostgreSQL backend under the `medicare`
  schema (beneficiaries, enrollments, admissions, and QC tables).
* Any additional output files are written to the `outputs/` directory.

For a detailed description of the pipeline steps, see
[Medicare: Building a Data Warehouse from ResDac Files](Medicare.md).

---

## Step 3 (Optional) — Explore results in Apache Superset

A pre-built **Medicare Quality Control** Superset dashboard is included with
the example.  The steps below show how to launch PostgreSQL together with
Superset using Docker Compose and import the dashboard.

### 3.1 — Stop the simple PostgreSQL container (if running)

If you started the basic `docker-compose.yml` stack earlier, bring it down
first:

```bash
cd $WORKDIR/dorieh/docker/pg-hll/
docker compose down
```

### 3.2 — Start PostgreSQL + Superset

From the same directory, start the extended stack:

```bash
cd $WORKDIR/dorieh/docker/pg-hll/
docker compose -f docker-compose-superset.yml up --build
# Or, to run detached:
# docker compose -f docker-compose-superset.yml up -d
```

This brings up:

* A PostgreSQL instance (with the HLL extension)
* The Superset web UI
* Superset background worker services

### 3.3 — Log in to Superset

Once the services are running, open `http://localhost:8088/` in your browser.

Default credentials (defined in `docker-compose-superset.yml`):

| Field    | Value   |
|----------|---------|
| Username | `admin` |
| Password | `admin` |

If initialization did not complete and you cannot log in, create the admin
user manually:

```bash
cd $WORKDIR/dorieh/docker/pg-hll/
docker compose exec superset superset fab create-admin \
  --username admin \
  --firstname Admin \
  --lastname User \
  --email admin@example.com \
  --password admin
```

### 3.4 — Add the Dorieh database connection

In the Superset UI:

1. Open **Settings → Database Connections** (under *Data*).
2. Click **+ DATABASE** and choose **PostgreSQL**.
3. At the bottom of the dialog click
   **"Connect this database with a SQL Alchemy URL string instead"**.
4. Fill in:
   * **Display Name:** `DORIEH`
   * **SQLAlchemy URI:** `postgresql+psycopg2://dorieh:dorieh_secret@postgres:5432/dorieh`
5. Click **TEST CONNECTION** — if it succeeds, click **CONNECT**.

### 3.5 — Import the Medicare QC dashboard

Back in your terminal, run the helper script:

```bash
cd $WORKDIR/dorieh/docker/pg-hll/
./import_superset_dashboard.sh
```

The script copies the dashboard definition into the Superset container and
imports it.  Internally it runs:

```bash
docker compose cp \
  ../../examples/with-postgres/medicare/superset/MedicareQCDashboard.json \
  superset:/tmp/MedicareQCDashboard.json
docker compose exec superset superset import_dashboards \
  --path /tmp/MedicareQCDashboard.json --username admin
docker compose -f docker-compose-superset.yml restart superset superset-worker
```

### 3.6 — Explore the dashboard

In the Superset UI:

1. Click the **Dashboards** tab.
2. Open **"Medicare QC (Clean)"**.
3. Use the available charts and filters to examine data quality across
   enrollments and admissions for the synthetic dataset.

The dashboard surfaces the QC metrics described in
[Creating QC Tables](Medicare.md#creating-qc-tables), including:

* Percent of beneficiaries with consistent date-of-birth / date-of-death
  records
* Percent of valid admission records (passed primary-key, foreign-key, and
  duplicate checks)
* Approximate distinct-beneficiary counts computed with
  [HLL sketches](UsingHLL.md)

---

## What the pipeline produces

After a successful run the following tables and views are available in the
`medicare` schema of your PostgreSQL database:

| Object                    | Type              | Description                                      |
|---------------------------|-------------------|--------------------------------------------------|
| `medicare.ps`             | View              | Federated patient summary across all raw years   |
| `medicare.beneficiaries`  | Table             | One row per unique beneficiary (deduplicated)    |
| `medicare.enrollments`    | Table             | Yearly enrollment records per beneficiary/state  |
| `medicare.admissions`     | Table             | Validated inpatient admission records            |
| `medicare_audit.admissions` | Table           | Records that failed validation (with reason)     |
| `medicare.qc_enrollments` | Materialized View | Aggregate QC dimensions for enrollments          |
| `medicare.qc_admissions`  | Materialized View | Aggregate QC dimensions for admissions           |
