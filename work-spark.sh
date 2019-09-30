#!/bin/bash

## The script submits work to the Spark cluster
##
##
## Simo Goshev
## Aug 14, 2019

spark-submit --master $SPARK_MASTER \
             $MY_SPARK_JOBSCRIPT \ 
             $MY_SPARK_DATASET 2>&1 | tee $MY_SPARK_LOGFILE



