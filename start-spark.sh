#!/bin/bash

## The script fires up the Spark cluster
##
##
## Simo Goshev
## Aug 10, 2019


nodes=($( cat $PBS_NODEFILE | uniq ))
nnodes=${#nodes[@]}
last=$(( $nnodes - 1 ))

if [ $nnodes -lt 2 ]; then
    >&2 echo "WARN: You are running one node only"
fi

rm -f $SPARK_CONF_DIR/slaves
for i in ${nodes[@]}; do
    echo "$i" >> $SPARK_CONF_DIR/slaves
done

echo "$PBS_JOBID" > $SPARK_CONF_DIR/jobid


## Start the master
${SPARK_HOME}/sbin/start-master.sh
export SPARK_MASTER="spark://${nodes[0]}:$SPARK_MASTER_PORT"

## Start the workers
CLASS="org.apache.spark.deploy.worker.Worker"
shutDownSpark="ps -U $USER | grep spark | awk '{print $1}'| xargs kill -9"

for w in $( seq 0 $last ); do
    if [ "$SPARK_WORKER_INSTANCES" = "" ]; then
        WORKER_NUM=1
       	ssh ${nodes[$w]} "$shutDownSpark; ${SPARK_HOME}/sbin/spark-daemon.sh --config $SPARK_CONF_DIR start $CLASS $WORKER_NUM $SPARK_MASTER"
    else
	for ((i=0; i<$SPARK_WORKER_INSTANCES; i++)); do
	    WORKER_NUM=$(( 1 + $i ))
	    ssh ${nodes[$w]} "$shutDownSpark; ${SPARK_HOME}/sbin/spark-daemon.sh --config $SPARK_CONF_DIR start $CLASS $WORKER_NUM $SPARK_MASTER"
	done
    fi
done


echo "${nodes[0]}" > $SPARK_CONF_DIR/master
echo "SPARK cluster fired up. Master node is ${nodes[0]}"
