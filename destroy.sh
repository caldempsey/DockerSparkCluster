#!/bin/bash

set -e

# https://docs.docker.com/compose/reference/down/
docker-compose down
# https://docs.docker.com/compose/reference/rm/
docker-compose rm -f -s -v
