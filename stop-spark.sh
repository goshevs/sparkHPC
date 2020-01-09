#!/bin/bash

## The script tears down the spark cluster
##
##
## Simo Goshev
## Aug 11, 2019


nodes=($( cat $PBS_NODEFILE | sort | uniq ))
nnodes=${#nodes[@]}
last=$(( $nnodes - 1 ))

## Shut down master
${SPARK_HOME}/sbin/stop-master.sh

## Shut down workers
CLASS="org.apache.spark.deploy.worker.Worker"

for w in $( seq $SPARK_MASTER_ISOLATE $last ); do
    if [ "$SPARK_WORKER_INSTANCES" = "" ]; then
        WORKER_NUM=1
        ssh ${nodes[$w]} "${SPARK_HOME}/sbin/spark-daemon.sh --config $SPARK_CONF_DIR stop $CLASS $WORKER_NUM"
    else
        for ((i=0; i<$SPARK_WORKER_INSTANCES; i++)); do
            WORKER_NUM=$(( 1 + $i ))
            ssh ${nodes[$w]} "${SPARK_HOME}/sbin/spark-daemon.sh --config $SPARK_CONF_DIR stop $CLASS $WORKER_NUM"
        done
    fi
done

echo "SPARK cluster was gracefully torn down."
