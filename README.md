# Scripts for running Apache Spark on HPC infrastructure


## Introduction

This repo offers a set of scripts that simplify running Apache Spark clusters 
on HPC infrastructure with a PBS job scheduler. 


## Installation and configuration

Download/clone the repo and customize the `userConfiguration.template.sh` and
`submit.template.pbs` files following the instructions provided in each file.
Save the edited `userConfiguration.template.sh` as `userConfiguration.sh` 
(and if desired save `submit.template.pbs` as `submit.pbs`). Then submit 
the PBS script to the job scheduler on your cluster.

If working with sensitive data, users may wish to ensure that all writes to disk (i.e. intermediate 
and final data, log and temp files, etc.) are made in a permissible directory
as defined in their DUA/DMP.

Users may wish to customize `config-spark.sh` to ensure that the Spark cluster
configuration is matched well to the resources allocated to the job and job's 
computational needs.


## Script `work-spark.sh`

Script `work-spark.sh` submits user's job to the spark cluster. Users have the option of 
passing the following variables as arguments to their work script `$MY_SPARK_JOBSCRIPT`: 

- `$MY_SPARK_DATASET`  
- `$MDB_MASTER_NODE`  
- `$MDB_NODES`  
- `$MDB_USER_CREDENTIALS`  
- `$MDB_BACKEND_CREDENTIALS`  
- `$MDB_DATABASE_NAME`


If specified, these variables, additional details for which are provided in 
`userConfiguration.template.sh`, are passed to the work script in the order in which 
they appear above.


## Integration with MariaDB

Integration with MariaDB is provided via variables in `userConfiguration.template.sh`
that begin with `MDB` and variable `SPARK_CLASS_PATH`. 

If users choose to pass all relevant db information to their work script as arguments, 
they should use:

- All `MDB_*` variables, in the case of running a distributed MariaDB instance  
- Variables `MDB_CONF_DIR`, `MDB_MASTER_NODE`, `MDB_USER_CREDENTIALS` and 
`MDB_DATABASE_NAME`, in the case of running a non-distributed MariaDB instance.

Variable `SPARK_CLASS_PATH` has to point to the location of the MariaDB Java Connector.

Repo [sparkDBUtilities](https://github.com/goshevs/sparkDBUtilities)
contains utilities that facilitate pushing Spark RDD's to MariaDB
distributed instances. These utilities can be called from within a work script 
written in either Python or R.

