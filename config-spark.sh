#!/bin/bash

## The script loads modules and writes files to ensure that
## Spark is configured appropriately for the problem at hand
##
##
##
##
## Simo Goshev
## Oct 06, 2019


## Write spark-env.sh
echo "export SPARK_HOME=$SPARK_HOME" > $SPARK_CONF_DIR/spark-env.sh
echo "export SPARK_CONF_DIR=$SPARK_CONF_DIR" >> $SPARK_CONF_DIR/spark-env.sh
echo "export SPARK_WORKER_DIR=$SPARK_SCRATCH_DIR/work" >> $SPARK_CONF_DIR/spark-env.sh
echo "export SPARK_LOG_DIR=$SPARK_SCRATCH_DIR/logs" >> $SPARK_CONF_DIR/spark-env.sh
echo "export JAVA_HOME=$JAVA_HOME" >> $SPARK_CONF_DIR/spark-env.sh
echo "export LOCAL_DIRS=$SPARK_SCRATCH_DIR/$PBS_JOBID" >> $SPARK_CONF_DIR/spark-env.sh
echo "export SPARK_LOCAL_DIRS=$SPARK_SCRATCH_DIR" >> $SPARK_CONF_DIR/spark-env.sh
echo "export SPARK_WORKER_INSTANCES=1" >> $SPARK_CONF_DIR/spark-env.sh
echo "export SPARK_WORKER_CORES=25" >> $SPARK_CONF_DIR/spark-env.sh
echo "export SPARK_WORKER_MEMORY=120g" >>  $SPARK_CONF_DIR/spark-env.sh
echo "export SPARK_DAEMON_MEMORY=5g" >> $SPARK_CONF_DIR/spark-env.sh
echo "export SPARKR_BACKEND_CONNECTION_TIMEOUT=1000000000" >> $SPARK_CONF_DIR/spark-env.sh

## Write spark-defaults.conf
echo "spark.executor.instances  5" > $SPARK_CONF_DIR/spark-defaults.conf
echo "spark.executor.cores  5" >> $SPARK_CONF_DIR/spark-defaults.conf
echo "spark.executor.memory  23g" >> $SPARK_CONF_DIR/spark-defaults.conf
echo "spark.driver.memory 5g" >> $SPARK_CONF_DIR/spark-defaults.conf
echo "spark.driver.extraJavaOptions  -Djava.io.tmpdir=$SPARK_SCRATCH_DIR" >> $SPARK_CONF_DIR/spark-defaults.conf
echo "spark.executor.extraJavaOptions  -Djava.io.tmpdir=$SPARK_SCRATCH_DIR" >> $SPARK_CONF_DIR/spark-defaults.conf
echo "spark.hadoop.dfs.replication  2" >> $SPARK_CONF_DIR/spark-defaults.conf
echo "spark.files.maxPartitionBytes  10000000000" >> $SPARK_CONF_DIR/spark-defaults.conf
echo "spark.buffer.pageSize 2m" >> $SPARK_CONF_DIR/spark-defaults.conf
echo "spark.sql.shuffle.partitions 1000" >> $SPARK_CONF_DIR/spark-defaults.conf
echo "spark.driver.maxResultSize 4g" >> $SPARK_CONF_DIR/spark-defaults.conf
echo "spark.executor.memoryOverhead 5g " >> $SPARK_CONF_DIR/spark-defaults.conf
echo "spark.reducer.maxReqsInFlight 1" >> $SPARK_CONF_DIR/spark-defaults.conf
echo "spark.shuffle.io.retryWait 1200s" >> $SPARK_CONF_DIR/spark-defaults.conf  
echo "spark.shuffle.io.maxRetries 10" >> $SPARK_CONF_DIR/spark-defaults.conf
echo "spark.network.timeout 1800000s" >> $SPARK_CONF_DIR/spark-defaults.conf
echo "spark.sql.broadcastTimeout 1800000s" >> $SPARK_CONF_DIR/spark-defaults.conf
echo "spark.r.backendConnectionTimeout 1800000" >> $SPARK_CONF_DIR/spark-defaults.conf
