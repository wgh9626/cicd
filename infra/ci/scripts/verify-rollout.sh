#!/usr/bin/env bash
set -euo pipefail

NAMESPACE="${1:-}"
DEPLOYMENT="${2:-}"

if [[ -z "$NAMESPACE" || -z "$DEPLOYMENT" ]]; then
  echo "usage: verify-rollout.sh <namespace> <deployment>"
  exit 1
fi

kubectl -n "$NAMESPACE" rollout status "deployment/${DEPLOYMENT}" --timeout=180s
echo "rollout verified: ${NAMESPACE}/${DEPLOYMENT}"
