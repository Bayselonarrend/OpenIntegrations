#!/usr/bin/env bash
# Remove all historical versions of add-in zips and Template.addin, restore current tree once.
# Requires: git-filter-repo. See README.md in this directory.
set -euo pipefail

REPO_ROOT="$(git -C "$(dirname "$0")" rev-parse --show-toplevel)"
cd "$REPO_ROOT"

BACKUP_DIR="${1:-${TMPDIR:-/tmp}/opi-addin-prune-$(date +%Y%m%d-%H%M%S)}"
DRY_RUN="${DRY_RUN:-0}"
SKIP_GC="${SKIP_GC:-0}"

FILTER_REPO=(git-filter-repo)
if ! command -v git-filter-repo >/dev/null 2>&1; then
  if python3 -m git_filter_repo --version >/dev/null 2>&1; then
    FILTER_REPO=(python3 -m git_filter_repo)
  elif python -m git_filter_repo --version >/dev/null 2>&1; then
    FILTER_REPO=(python -m git_filter_repo)
  else
    echo "git-filter-repo not found. Install: pip install git-filter-repo" >&2
    exit 1
  fi
fi

PATH_GLOBS=(
  'src/ru/OInt/addins/*.zip'
  'src/en/OInt/addins/*.zip'
  'src/ru/BSL/OpenIntegrations/src/CommonTemplates/*/Template.addin'
  'src/en/BSL/OpenIntegrations/src/CommonTemplates/*/Template.addin'
)

if [[ -n "$(git status --porcelain)" ]]; then
  echo "Warning: working tree is not clean." >&2
  git status -sb
  read -r -p "Continue anyway? [y/N] " ans
  [[ "${ans,,}" == y ]] || exit 1
fi

mkdir -p "$BACKUP_DIR"
backed=0
for g in "${PATH_GLOBS[@]}"; do
  # shellcheck disable=SC2086
  for f in $g; do
    [[ -f "$f" ]] || continue
    dest="$BACKUP_DIR/$f"
    mkdir -p "$(dirname "$dest")"
    cp -f "$f" "$dest"
    backed=$((backed + 1))
  done
done
echo "Backed up $backed files to: $BACKUP_DIR"

if [[ "$DRY_RUN" == 1 ]]; then
  echo "Dry run. Would run: git filter-repo --force --invert-paths with path globs above."
  exit 0
fi

args=(--force --invert-paths)
for g in "${PATH_GLOBS[@]}"; do
  args+=(--path-glob "$g")
done

echo "Rewriting history..."
"${FILTER_REPO[@]}" "${args[@]}"

echo "Restoring files from backup..."
find "$BACKUP_DIR" -type f | while read -r bf; do
  rel="${bf#"$BACKUP_DIR"/}"
  mkdir -p "$(dirname "$rel")"
  cp -f "$bf" "$rel"
done

git add \
  src/ru/OInt/addins/*.zip \
  src/en/OInt/addins/*.zip \
  src/ru/BSL/OpenIntegrations/src/CommonTemplates \
  src/en/BSL/OpenIntegrations/src/CommonTemplates

if git diff --cached --quiet; then
  echo "Warning: nothing staged after restore." >&2
else
  git commit -m "chore: restore add-in binaries after history prune

Removed all prior versions of OInt zips and Template.addin from Git history
via git-filter-repo; only current tree restored from backup."
fi

if [[ "$SKIP_GC" != 1 ]]; then
  git gc --prune=now
  git count-objects -vH
fi

cat <<EOF

Done. git filter-repo removed 'origin' if present — re-add and force-push.

IMPORTANT — push ALL rewritten refs (not only main):
  git push --force-with-lease origin main
  git push --force-with-lease origin stable
  git push --force origin '+refs/tags/*:refs/tags/*'

Verify remote matches local:
  git rev-parse main stable 'refs/tags/2.1.0^{commit}'
  git ls-remote origin refs/heads/main refs/heads/stable refs/tags/2.1.0

Bare mirror: force-fetch + gc — see service/git/README.md.
Orphan .pack without .idx: cleanup — see service/git/README.md.

Backup: $BACKUP_DIR
See service/git/README.md for symlink / single-path strategies.
EOF
