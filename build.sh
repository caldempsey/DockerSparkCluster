#!/bin/bash

set -e

# Acquire environment variables for building images.
source .env
# Build images 
docker build -t spark-base:${SPARK_VERSION} ./compose/spark/base --build-arg SP$
docker build -t spark-master:${SPARK_VERSION} ./compose/spark/master --build-ar$
docker build -t spark-worker:${SPARK_VERSION} ./compose/spark/worker --build-ar$
docker build -t spark-submit:${SPARK_VERSION} ./compose/spark/submit --build-ar$

# https://docs.docker.com/compose/reference/up/
docker-compose up


