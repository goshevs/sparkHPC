#!/bin/bash

## The script defines the spark environment. 
## !!! HAS TO BE CUSTOMIZED BY THE USER !!!
##
##
## Simo Goshev
## Aug 10, 2019


################################################################
## Load  modules

module load python
module load R


################################################################
## Spark environment variables

## Directory for configuration files
export SPARK_CONF_DIR=

## Directory for spark temporary files
## !!! IF WORKING WITH SENSITIVE DATA, POINT TO A DESIGNATED DIRECTORY !!!
## !!! CONSULT WITH THE SIGNEE OF THE DUA/DMP !!!
export SPARK_SCRATCH_DIR=

## Spark master port
export SPARK_MASTER_PORT=7077

## Apache Spark installation directory
export SPARK_HOME=


###############################################################
## Job- and log-related variables

## Cluster setup scripts directory
export SPARK_SCRIPTS_DIR=

## Location and name of the work script to be executed
export MY_SPARK_JOBSCRIPT=

## OPTIONAL: Location and name of dataset (if argument to work script)
export MY_SPARK_DATASET=

## Location and name of spark log file
## !!! IF WORKING WITH SENSITIVE DATA, POINT TO A DESIGNATED DIRECTORY !!!
## !!! CONSULT WITH THE SIGNEE OF THE DUA/DMP !!!
export MY_SPARK_LOGFILE=
