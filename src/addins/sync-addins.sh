#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/../.."

if [[ "$(git rev-parse --abbrev-ref HEAD)" == "addins" ]]; then
    echo "Already on addins branch."
    exit 0
fi

git fetch origin addins --depth=1

# Only paths published to origin/addins (see publish-addins.bat).
# Worktree only: binaries are in .gitignore and must not be staged.
git restore --source=origin/addins --worktree -- src/ru/OInt/addins/ src/en/OInt/addins/

while IFS= read -r f; do
    git restore --source=origin/addins --worktree -- "$f"
done < <(git ls-tree -r --name-only origin/addins -- \
    src/ru/BSL/OpenIntegrations/src/CommonTemplates \
    src/en/BSL/OpenIntegrations/src/CommonTemplates)

echo "Add-ins synced from origin/addins."
