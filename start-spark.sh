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
sparkmaster="spark://${nodes[0]}:7077"

## Start the workers
CLASS="org.apache.spark.deploy.worker.Worker"

for w in $( seq 0 $last ); do
    if [ "$SPARK_WORKER_INSTANCES" = "" ]; then
        WORKER_NUM=1
       	ssh ${nodes[$w]} "${SPARK_HOME}/sbin/spark-daemon.sh --config $SPARK_CONF_DIR start $CLASS $WORKER_NUM ${sparkmaster}"
    else
	for ((i=0; i<$SPARK_WORKER_INSTANCES; i++)); do
	    WORKER_NUM=$(( 1 + $i ))
	    ssh ${nodes[$w]} "${SPARK_HOME}/sbin/spark-daemon.sh --config $SPARK_CONF_DIR start $CLASS $WORKER_NUM ${sparkmaster}"
	done
    fi
done


echo "${nodes[0]}" > $SPARK_CONF_DIR/master
echo "SPARK cluster fired up. Master node is ${nodes[0]}"
