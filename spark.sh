#!/bin/bash

## The script configures the environment and defaults for 
## spark, launches the spark cluster, submits the work, 
## and finally tears down the cluster


## Get start time
#myStartTime=`date`


echo "Setting up environment and defaults"
source ./userInput.sh
source $SPARK_SCRIPTS_DIR/config-spark.sh
source $SPARK_CONF_DIR/spark-env.sh

##echo "Starting the spark cluster"
source $SPARK_SCRIPTS_DIR/start-spark.sh

##echo "Submitting the work"
source $SPARK_SCRIPTS_DIR/work-spark.sh

##echo "Tearing down the cluster"
source $SPARK_SCRIPTS_DIR/stop-spark.sh


## Get end time
#myEndTime=`date`

## Print times
#echo
#echo "Start time: $myStartTime"
#echo "End time:   $myEndTime"






