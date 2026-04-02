#!/usr/bin/env bash
set -euo pipefail

FILE="${1:-}"
IMAGE="${2:-}"
CONTAINER_NAME="${3:-}"

if [[ -z "$FILE" || -z "$IMAGE" ]]; then
  echo "usage: update-image.sh <deployment.yaml> <full-image> [container_name]"
  exit 1
fi

if [[ ! -f "$FILE" ]]; then
  echo "deployment file not found: $FILE"
  exit 1
fi

if [[ -n "$CONTAINER_NAME" ]]; then
  yq -i '
    (.spec.template.spec.containers[] | select(.name == "'"${CONTAINER_NAME}"'") | .image) = "'"${IMAGE}"'"
  ' "$FILE"
else
  yq -i '
    .spec.template.spec.containers[0].image = "'"${IMAGE}"'"
  ' "$FILE"
fi

echo "updated image in $FILE => $IMAGE"
