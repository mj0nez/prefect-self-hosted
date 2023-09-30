#!/bin/bash

# load env file
set -a; source .env; set +a

imageName="my-docker-flow"

# set FLOW_VERSION as env variable to override the image's version
imageVersion="${FLOW_VERSION:-"latest"}"


docker build \
    -t "$imageName:$imageVersion" \
    -f "./Dockerfile.flow" \
    --build-arg prefectVersion=$PREFECT_VERSION \
    --build-arg pythonVersion=$PREFECT_PYTHON_VERSION \
    . 
