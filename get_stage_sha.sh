#!/bin/bash

# Usage: ./get_stage_sha.sh <image_name> <stage_name>
IMAGE_NAME=$1
STAGE_NAME=$2

# Build the image with the specified stage
docker build -t ${IMAGE_NAME}:${STAGE_NAME} --target ${STAGE_NAME} .

# Get the SHA of the specified stage
SHA=$(docker image inspect --format='{{index .RootFS.Layers 0}}' ${IMAGE_NAME}:${STAGE_NAME})

echo "SHA of ${STAGE_NAME} stage: ${SHA}"