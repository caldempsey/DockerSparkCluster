#!/bin/bash

set -e

chmod +x compose/spark/build-images.sh
./compose/spark/build-images.sh

# https://docs.docker.com/compose/reference/down/
docker-compose down
# https://docs.docker.com/compose/reference/rm/
docker-compose rm -f -s -v 