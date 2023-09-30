#!/bin/bash

# load env file
set -a; source .env; set +a

imageName="prefect-docker"

# set FLOW_VERSION as env variable to override the image's version
imageVersion="${FLOW_VERSION:-"latest"}"


docker build \
    -t "$imageName:$imageVersion" \
    -f "./Dockerfile.prefect-docker" \
    --build-arg prefectVersion=doc$PREFECT_VERSION \
    --build-arg pythonVersion=$PREFECT_PYTHON_VERSION \
    .
