#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/../../.."

SPECIAL_OUTPUT="src/addins/special/output"
BRANCH="addins-special"

if [[ "$(git rev-parse --abbrev-ref HEAD)" == "$BRANCH" ]]; then
    echo "Already on $BRANCH branch."
    exit 0
fi

git fetch origin "$BRANCH" --depth=1

mkdir -p "$SPECIAL_OUTPUT"

git restore --source="origin/$BRANCH" --worktree -- "$SPECIAL_OUTPUT/"
echo "Special add-ins synced from origin/$BRANCH."
