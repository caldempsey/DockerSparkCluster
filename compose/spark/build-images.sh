#!/bin/bash

set -e

source ./.env

docker build -t spark-base:${SPARK_VERSION} ./base --build-arg SPARK_VERSION=${SPARK_VERSION}
docker build -t spark-master:${SPARK_VERSION} ./master --build-arg FROM_IMAGE=spark-base:${SPARK_VERSION}
docker build -t spark-worker:${SPARK_VERSION} ./worker --build-arg FROM_IMAGE=spark-base:${SPARK_VERSION}
docker build -t spark-submit:${SPARK_VERSION} ./submit --build-arg FROM_IMAGE=spark-base:${SPARK_VERSION}
