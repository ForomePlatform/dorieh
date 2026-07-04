# Running the sample Medicare processing workflow (with PostgreSQL)

<!-- toc -->


The Medicare example demonstrates a full Dorieh data processing pipeline 
against a **synthetic** dataset. 

## 1. Prerequisites

Before starting, make sure you have:

1. Followed the PostgreSQL setup in 
   [Using Dorieh with PostgreSQL Backend](../README.md) 
   (PostgreSQL running,   `database.ini` available).
2. Installed Toil and tested it as in [Examples of using Dorieh](../../README.md)
3. Cloned the `dorieh` repository under `$WORKDIR`.

Then go to the Medicare example directory:

```bash
cd $WORKDIR/dorieh/examples/with-postgres/medicare
```


## 2. Download synthetic sample data from Zenodo

The synthetic Medicare‑like database from Zenodo:

- Mimics raw fixed‑width files
- Reproduces the structure of the ResDAC File Transfer Summary (FTS) layouts
- Contains **no real PHI/PII**, so it’s safe for testing and demonstrations

Download and unpack it:

```bash
mkdir -p data
pushd data

curl -fLo medicare-synthetic-database.zip \
  'https://zenodo.org/records/18915558/files/medicare-synthetic-database-v1.zip?download=1'

unzip medicare-synthetic-database.zip

popd
```


### 3. Run the Medicare processing pipeline

Activate your Toil environment:

```bash
source $TOIL_VENV/bin/activate
```

Run the Medicare workflow:

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

After completion:

- Processed data will be stored in your PostgreSQL backend.
- Additional outputs may be written to the `outputs/` directory, depending on the workflow definition.


## 4. (Optional) Explore the Medicare data in Superset

You can visually explore the processed Medicare data using a pre‑built 
**Superset** dashboard.      

### 4.1 Stop the simple PostgreSQL container (if running)

If you previously started the simple PostgreSQL setup 
as described in [Using Dorieh with PostgreSQL Backend](../README.md), do:

```bash
cd $WORKDIR/dorieh/docker/pg-hll/
docker compose down
```

You will now start a more complete stack: PostgreSQL orchestrated together with Superset.

### 4.2 Start PostgreSQL + Superset via Docker Compose

From the same directory:

```bash
cd $WORKDIR/dorieh/docker/pg-hll/
docker compose -f docker-compose-superset.yml up --build
# Or, to run detached:
# docker compose -f docker-compose-superset.yml up -d
```

This brings up:

- PostgreSQL
- Superset web UI
- Superset worker services


### 4.3 Initial Superset login and admin setup

Once the services are up, open:

- `http://localhost:8088/` in your browser.

On a successful first‑time initialization, you should be able to log in with:

- **Username:** `admin`  
- **Password:** `admin`  

(These defaults are defined in 
[docker-compose-superset.yml](../../../docker/pg-hll/docker-compose-superset.yml)
.)

If initialization did not complete and you cannot log in, create the admin user manually:

```bash
cd $WORKDIR/dorieh/docker/pg-hll/
docker compose exec superset superset fab create-admin \
  --username admin \
  --firstname Admin \
  --lastname User \
  --email admin@example.com \
  --password admin
```

Then log in at `http://localhost:8088/` with the admin credentials.


### 4.4 Configure the Dorieh database connection in Superset

In the Superset web UI:

1. In the top right corner, open **Settings → Database Connections**  
   (below  *Security*, under *Data*, above *Manage*).
2. Click the **+ DATABASE** button.
3. Choose **PostgreSQL**.
4. When the configuration dialog opens, scroll to the bottom and click  
   **“Connect this database with a SQL Alchemy URL string instead”**.
5. Enter:

   - **DISPLAY NAME:** `DORIEH`  
   - **SQLALCHEMY URI:** `postgresql+psycopg2://dorieh:dorieh_secret@postgres:5432/dorieh`

6. Click **TEST CONNECTION**.  
   If the test succeeds, click **CONNECT** in the bottom right corner of 
   teh dialogue.


### 4.5 Import the pre‑built Medicare quality‑control dashboard

The dashboard is committed as a native Superset bundle under
`examples/with-postgres/medicare/superset/medicare_quality_dashboard/`. Import
it with the `import_dashboard` command (installed with Dorieh), which resolves
your `DORIEH` connection by name, re‑points the bundle onto it on the fly, and
imports it via Superset's REST API (the native importer the UI uses — the legacy
`superset import-dashboards` CLI silently drops the charts from native bundles):

```bash
import_dashboard \
  $WORKDIR/dorieh/examples/with-postgres/medicare/superset/medicare_quality_dashboard \
  --base-url http://localhost:8088/ --username admin
```

You'll be prompted for the admin password (`admin` by default). `import_dashboard`
uses only the Python standard library — no extra packages beyond Dorieh. (If you
are running from a source checkout without installing Dorieh, the equivalent is
`python3 -m dorieh.platform.superset.import_dashboard …`.)

Notes:

- It binds to the connection named `DORIEH` that you created in § 4.4 (override
  with `--connection-name`). Because each Superset instance assigns its own
  connection UUID, the command looks the UUID up by name at import time rather
  than relying on a value baked into the bundle — so the same committed bundle
  imports on any machine.
- Re‑running updates the same dashboard in place instead of creating a
  duplicate (object uuids are preserved, so the import is idempotent — it never
  multiplies charts or datasets).
- To stand up a *second* dashboard on a different connection (e.g. a `DORIEH2`
  comparison while developing), add `--copy`: `--copy --connection-name DORIEH2
  --dashboard-name "…"`. `--copy` regenerates the object uuids so the dev copy
  coexists with — rather than overwrites — the canonical one. (Without `--copy`
  it would update the same objects, just repointed to the other connection.)
- The companion `export_dashboard <dashboard-id>` command exports a dashboard
  back to a native bundle (e.g. to refresh this committed one).


### 4.6 Explore the dashboard

In the Superset UI:

1. Click on the **Dashboards** tab.
2. You should see a dashboard named **“Medicare Demo Quality Dashboard”**.
3. Open it and explore the available charts and filters to examine data quality and other aspects of the synthetic Medicare data processed by Dorieh.



