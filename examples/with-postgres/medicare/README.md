# Running Sample Medicare Processing Workflow

See [](../../README.md) and [](../README.md) for prerequisites.


```shell
cd $workdir/dorieh/examples/with-postgres/medicare
source $pat_to_toil_virtual_env/bin/activate 

toil-cwl-runner --jobStore j1 --retryCount 1 --cleanWorkDir never --outdir outputs --workDir . https://raw.githubusercontent.com/ForomePlatform/dorieh/refs/heads/main/src/workflows/medicare.cwl --input data/ --database ../database.ini --connection_name dorieh
```