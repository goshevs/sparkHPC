#!/bin/bash

## The script defines the spark environment. 
##
##
## Simo Goshev
## Oct 18, 2019



## Here include modules that you wish to load

module load R
module load python
module load hadoop
module load blas/open64/64/3.6.0


## Project root directory
## ---> Designated directory under the DMP
export PROJECT_ROOT_DIR=


################################################################
## Define environment variables needed by spark

## Directory for configuration files
export SPARK_CONF_DIR=

## Directory where spark will write temporary files
## ---> Designated directory under the DMP
export SPARK_SCRATCH_DIR=

## Spark master port
export SPARK_MASTER_PORT=7077

## This is the location of the Apache Spark installation
export SPARK_HOME=

## Hadoop and Java homes
export HADOOP_HOME=
export JAVA_HOME=


###############################################################
## Define project and job parameters

## This is the location of the cluster setup scripts
export SPARK_SCRIPTS_DIR=

## This is the location and name of the script you will be running
export MY_SPARK_JOBSCRIPT=

## This is the location and name of the dataset you are using
export MY_SPARK_DATASET=

## This is the location and name of your spark log file
export MY_SPARK_LOGFILE=


###############################################################
## Define environment variables for spark-mariadb integration (OPTIONAL)

# MariaDB configuration directory
export MDB_CONF_DIR=

# MariaDB Java connector & other jars
export SPARK_CLASS_PATH=

# MariaDB (frontend) node file
export MDB_MASTER_NODE=

# MariaDB all nodes file (all nodes of the distributed DB)
export MDB_NODES=

# User credentails file
export MDB_USER_CREDENTIALS=

# Backend DB credentials file
export MDB_BACKEND_CREDENTIALS=

# Database name file
export MDB_DATABASE_NAME=
