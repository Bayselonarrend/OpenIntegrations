#!/usr/bin/env bash
set -euo pipefail

cd "$(git rev-parse --show-toplevel)"

ref="${1:-${ADDINS_BRANCH:-addins}}"
if [[ "$ref" != "addins" && ! "$ref" =~ ^addins-alpaca-[0-9]+$ ]]; then
    echo "Invalid add-ins branch: $ref" >&2
    exit 1
fi

head_branch="$(git rev-parse --abbrev-ref HEAD)"
if [[ "$head_branch" == "$ref" ]]; then
    echo "Already on $ref."
    exit 0
fi

if ! git fetch origin "$ref" --depth=1; then
    if [[ "$ref" == "addins" ]]; then
        exit 1
    fi
    echo "$ref is not on origin yet. Syncing addins."
    ref="addins"
    git fetch origin addins --depth=1
fi

git restore --source="origin/$ref" --worktree -- src/ru/OInt/addins/ src/en/OInt/addins/

while IFS= read -r f; do
    git restore --source="origin/$ref" --worktree -- "$f"
done < <(git ls-tree -r --name-only "origin/$ref" -- \
    src/ru/BSL/OpenIntegrations/src/CommonTemplates \
    src/en/BSL/OpenIntegrations/src/CommonTemplates)

echo "Add-ins synced from origin/$ref."
