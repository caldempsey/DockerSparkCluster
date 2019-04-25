#!/bin/bash

set -e

chmod +x compose/spark/build-images.sh
./compose/spark/build-images.sh

# https://docs.docker.com/compose/reference/up/
docker-compose up