#!/bin/bash

# Check if the stage name is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <stage_name>"
  exit 1
fi

STAGE_NAME=$1
DOCKERFILE="Dockerfile"

# Extract the specified stage
awk -v stage="$STAGE_NAME" '
  BEGIN { found=0 }
  $0 ~ "FROM .* AS " stage { found=1 }
  found && /^FROM/ && !($0 ~ "AS " stage) { exit }
  found { print }
' $DOCKERFILE