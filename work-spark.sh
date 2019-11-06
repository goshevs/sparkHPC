#!/bin/bash

## The script submits work to the Spark cluster
##
##
## Simo Goshev
## Aug 14, 2019


## Print connection string to file
conString="ssh -L 8082:$SPARK_MASTER_NODE:8082 -L 4040:$SPARK_MASTER_NODE:4040"
conString="$conString -R 8082:localhost:8082 -R 4040:localhost:4040 sirius"
echo "$conString" > $SPARK_CONF_DIR/connect.ui


## Submit the job to the cluster and keep a log file
spark-submit --master $SPARK_MASTER \
             $MY_SPARK_JOBSCRIPT "$MY_SPARK_DATASET" "$MDB_MASTER_NODE" "$MDB_NODES" "$MDB_USER_CREDENTIALS" "$MDB_BACKEND_CREDENTIALS" "$MDB_DATABASE_NAME" 2>&1 | tee $MY_SPARK_LOGFILE



