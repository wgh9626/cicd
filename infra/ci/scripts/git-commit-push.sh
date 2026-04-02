#!/usr/bin/env bash
set -euo pipefail

FILE="${1:-}"
MESSAGE="${2:-}"

if [[ -z "$FILE" || -z "$MESSAGE" ]]; then
  echo "usage: git-commit-push.sh <file> <message>"
  exit 1
fi

git add "$FILE"

if git diff --cached --quiet; then
  echo "no changes to commit"
  exit 0
fi

git commit -m "$MESSAGE"
git push
