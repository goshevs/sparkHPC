#!/bin/bash

## The script submits work to the Spark cluster
##
##
## Simo Goshev
## Aug 14, 2019


SPARK_MASTER=$(cat $SPARK_CONF_DIR/master)
spark-submit --master spark://$SPARK_MASTER:7077 \
             $MY_SPARK_JOBSCRIPT \ 
             $MY_SPARK_DATASET 2>&1 | tee $MY_SPARK_LOGFILE



