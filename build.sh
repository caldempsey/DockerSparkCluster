#!/bin/bash

set -e

# Acquire environment variables for building images.
source .env
# Build images 
docker build -t spark-base:${SPARK_VERSION} ./compose/spark/base --build-arg SPARK_VERSION=${SPARK_VERSION}
docker build -t spark-master:${SPARK_VERSION} ./compose/spark/master --build-arg FROM_IMAGE=spark-base:${SPARK_VERSION}
docker build -t spark-worker:${SPARK_VERSION} ./compose/spark/worker --build-arg FROM_IMAGE=spark-base:${SPARK_VERSION}
docker build -t spark-submit:${SPARK_VERSION} ./compose/spark/submit --build-arg FROM_IMAGE=spark-base:${SPARK_VERSION}
# https://docs.docker.com/compose/reference/up/
docker-compose up