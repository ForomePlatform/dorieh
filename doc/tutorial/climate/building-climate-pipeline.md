# Tutorial: Building a Bronze–Silver–Gold Climate Pipeline with Dorieh

```{contents}
---
local:
---
```

```{seealso}
[Example: aggregating a climate variable](../../Example-climate-workflow.md)
```
            
## Introduction: 

This tutorial walks you through building a small, but complete, 
Dorieh‑based data processing workflow. It attempts to model a realistic 
process of incrementally adding features to a workflow, keeping the 
workflow runnable at every step but with the ultimate goal of producing 
a production-ready dataset.

The eventual pipeline:

* Downloads gridded daily climate data.
* Aggregates it over ZIP Code Tabulation Areas (ZCTAs).
* Loads the result into PostgreSQL.
* Builds Bronze, Silver, and Gold layers using the Dorieh data‑modeling DSL.
* Generates documentation and data lineage diagrams.

The same design patterns apply directly to health and claims data 
pipelines; here we use open climate data so anyone can reproduce the 
example.   

The concepts in this tutorial are used in the "Data Provenance for 
Secondary Use of Health Data through Dataflow Programming" book 
in the chapter named “Sample Application: Building ML‑Ready Datasets”.


## Prerequisites

You will need:

* A Unix‑like environment (Linux or macOS).
* Python 3.9+.
* A CWL runner, e.g.:
  * toil-cwl-runner (used in examples), 
  * or cwltool.
* PostgreSQL or Docker to use the provided container image
* graphviz (for lineage diagrams) and pandoc (optional, for HTML docs).

Dorieh must be installed as described in the 
[Example](../../Example-climate-workflow.md#prepare-to-run-a-workflow).

For convenience, the full list of commands is also provided below:

```bash
# Create a virtual environment and activate it.
python3 -m venv $path
source $path/bin/activate

# Install Toil and its dependencies.
pip install "toil[cwl,aws]"

# Install Dorieh and its dependencies.
pip install dorieh
```

## Design overview
We briefly outline the pipeline design before touching any code.

### Inputs

* Climate variable: daily maximum temperature (tmmx) from a gridded 
dataset (e.g., GRIDMET / TerraClimate via Google Earth Engine / NKN).

```{Important}
As we will be progressing with the building of the workflow we 
will see that we also need an additional input: shapefile with 
ZIP Code Tabulation Areas (ZCTAs).
```

### Outputs
* **File output**: a compressed CSV with columns: date, zcta, and tmmx 
(Kelvin).
* **Database outputs**:
  * Bronze table: bronze_temperature(date, zcta, tmmx).
  * Silver view: silver_temperature with:
     * temperature_in_C, temperature_in_F
     * us_state, city
  * Gold materialized view: gold_temperature_by_state with:
     *mean temperature and temperature span per state/day.

### Architecture
We will:

* Use **CWL** to orchestrate:
  * climate download → shape download → spatial aggregation → DB init 
   → ingestion → Silver/Gold creation.
* Use the **Dorieh data‑modeling DSL (YAML)** to define:
  * Bronze/Silver/Gold schema and transformations.
* Use Dorieh utilities to generate:
  * Workflow documentation (from CWL).
  * Data dictionaries and lineage diagrams (from YAML).


## Directory layout

Create a working directory for this tutorial, for example:

```bash
cd tmp
mkdir -p dorieh/tutorials/climate
cd dorieh/tutorials/climate
```
We will place:

* example1.cwl – the CWL workflow.
* example1_model.yml – the domain definition for Bronze/Silver/Gold.
* (Optionally) a local database.ini if you need to adjust it for your 
   environment.
                                        
## Step 1. Create a minimal CWL workflow skeleton

We will start with a minimal CWL workflow definition containing the 
main steps—data acquisition, shape file retrieval, and aggregation. 
At this stage, placeholders can be used for inputs and outputs; 
these will be filled in as more details on the required tool 
parameters are gathered.    

Dorieh provides a library of prebuilt CWL tool definitions, 
streamlining common steps such as downloading remote files and 
running aggregations. Corresponding tools are:

* [download.cwl](../../pipeline/download.md)
* [aggregate.cwl](../../pipeline/aggregate_daily.md)



The initial workflow skeleton can look like:

```{literalinclude} steps/step1/example1.cwl```

This skeleton is not yet runnable. It defines three steps but no 
inputs, outputs, or wiring.                

## Step 2. Iteratively Defining Steps and Parameters

At this implementation step we need to:

* For each workflow step, consult the underlying tool’s 
  documentation or CWL file to determine:
  * Required input parameters
  * Output files and directory structure
* Incrementally add inputs (e.g., band, year, geography), outputs, 
  and wiring between steps (using CWL’s in and out sections).

Dorieh’s cwl_collect_outputs utility helps automating extraction of 
output specifications and minimizing errors. 

To illustrate the process, we will first look at the download step.
The tool we are using is 
[Dorieh download.cwl](../../pipeline/download.md)

We see that it takes 3 input parameters: 

* proxy settings, 
* year, for which we will be performing data aggregation 
* meteorological band or variable that we would like to aggregate. 

If you are using a system with direct access to the Internet, you 
probably do not need a proxy. However, we need to take care of 
‘year’ and ‘band’.    

After adding these two input parameters to the ‘ inputs ’ section and 
‘download’ step, the workflow file will look like:  

```{literalinclude} steps/step2/example1-1.cwl```

Though we have now defined the inputs for the first step, the 
workflow is still not runnable because we have not yet defined the 
outputs. As mentioned, Dorieh’s cwl_collect_outputs utility assists 
with this task. You can run: 
                             
```bash
python -m dorieh.platform.util.cwl_collect_outputs download https://raw.githubusercontent.com/ForomePlatform/dorieh/refs/heads/main/src/cwl/download.cwl
```

The command should produce the following output:

```text
    out:
      - log
      - data
      - errors
## Generated by dorieh.platform.util.cwl_collect_outputs from download.cwl:
  download_log:
    type: File?
    outputSource: download/log
  download_data:
    type: File?
    outputSource: download/data
  download_errors:
    type: File
    outputSource: download/errors
```

From the standard output of this command, copy the “out” section to 
the step and the rest to the “outputs” section. You can exclude the 
outputs you want to ignore. The resulting workflow file should look 
like:    

```{literalinclude} steps/step2/example1-2.cwl```

Now we will repeat the process for the `aggregate` step. Looking at the 
tool we are using 
[aggregate.cwl](../../pipeline/aggregate_daily.md).
we notice that besides the input parameters we already discussed, it
also requires Shapefiles. Dorieh provides another CWL tool to 
download the shapefiles for US geographies (ZCTAs and counties) from 
the US Census website: [get_shapes.cwl](../../pipeline/get_shapes.md).  

Therefore, we need to add a third step to the 
existing two:

```yaml
  get_shapes:
    run: https://raw.githubusercontent.com/NSAPH-Data-Platform/dorieh/main/src/cwl/get_shapes.cwl
```
                        
Which will bring us to the following workflow definition:

```{literalinclude} steps/step2/example1-3.cwl```

After repeating the process described above for the remaining two steps 
(`get_shapes` and `aggregate`) we finally have a runnable workflow 
definition:

```{literalinclude} steps/step2/example1-4.cwl```

At this point, the workflow can aggregate a full year of data, but 
that is slow for development. Next we add a “toy slice” mode. 

If you prefer to test the current workflow and do not afraid to wait 
hours for its completion, you can run it with the following command:

```shell
toil-cwl-runner --retryCount 3 --cleanWorkDir never --outdir outputs example1.cwl --workDir . --band tmmx --year 2019 --geography zcta

```

## Step 3 – Parameterize for a single day (“toy” run)

To speed up development and debugging, we can parameterize the 
workflow so that it can run on “toy” datasets—for example, filtering 
a single day (e.g., 2019-01-15) instead of an entire year. Running 
your pipeline on a minimal dataset ensures quick feedback, uncovers 
errors early, and avoids wasting compute resources.     

Such parametrization often requires additional input transformations 
(e.g., extracting year from a date); hence, we need to insert 
transformation steps, chaining outputs via CWL’s valueFrom mechanism.       

In our case, to allow the workflow to run on a toy dataset, we will 
first replace the input parameter `year` with `date`. Our downstream 
steps, however, require a year, e.g., to download the right shape 
file. Hence, we will add an additional step to extract the year from 
the date:        
                
```yaml
  extract_year:
    run: https://raw.githubusercontent.com/NSAPH-Data-Platform/dorieh/main/src/cwl/parse_date.cwl
    in:
      date: date
    out:
      - year
```

With this step in place, the workflow is now:

```{literalinclude} steps/step3/example1.cwl```

It can be run with the following command:

```shell
toil-cwl-runner --retryCount 3 --cleanWorkDir never --outdir outputs example1.cwl --workDir . --band tmmx --date 2019-01-15 --geography zcta
```

