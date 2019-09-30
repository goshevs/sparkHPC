#!/bin/bash

## The script defines the spark environment. 
## !!! HAS TO BE CUSTOMIZED BY THE USER !!!
##
##
## Simo Goshev
## Aug 10, 2019



## Here include modules that you wish to load
## e.g.: 
module load python


################################################################
## Define environment variables needed by spark

## Directory for configuration files
export SPARK_CONF_DIR=

## Directory where spark will write temporary files
## !!! IF WORKING WITH SENSITIVE DATA, POINT TO A DESIGNATED DIRECTORY !!!
## !!! CONSULT WITH THE SIGNEE OF THE DUA/DMP !!!
export SPARK_SCRATCH_DIR=

## Spark master port
export SPARK_MASTER_PORT=

## This is the location of the Apache Spark installation
export SPARK_HOME=



###############################################################
## Define job parameters

## This is the location of the cluster setup scripts
export SPARK_SCRIPTS_DIR=

## This is the location and name of the script you will be running
export MY_SPARK_JOBSCRIPT=

## This is the name of the dataset you are using
export MY_SPARK_DATASET=

## This is the location where you want your spark log file to be created
## !!! IF WORKING WITH SENSITIVE DATA, POINT TO A DESIGNATED DIRECTORY !!!
## !!! CONSULT WITH THE SIGNEE OF THE DUA/DMP !!!
export MY_SPARK_LOGFILE=
