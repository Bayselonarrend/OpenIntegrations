#!/usr/bin/env bash
# Remove add-in binaries from main/stable/tags history (not branch addins).
# Requires: git-filter-repo. See README.md in this directory.
set -euo pipefail

REPO_ROOT="$(git -C "$(dirname "$0")" rev-parse --show-toplevel)"
cd "$REPO_ROOT"

BACKUP_DIR="${1:-}"
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
  'src/ru/OInt/addins/*'
  'src/en/OInt/addins/*'
  'src/ru/BSL/OpenIntegrations/src/CommonTemplates/*/Template.addin'
  'src/en/BSL/OpenIntegrations/src/CommonTemplates/*/Template.addin'
)

if [[ -n "$(git status --porcelain)" ]]; then
  echo "Warning: working tree is not clean." >&2
  git status -sb
  read -r -p "Continue anyway? [y/N] " ans
  [[ "${ans,,}" == y ]] || exit 1
fi

git fetch origin --tags --prune 2>/dev/null || true

REWRITE_REFS=()
for name in main stable; do
  if git show-ref --verify --quiet "refs/heads/$name"; then
    REWRITE_REFS+=("refs/heads/$name")
  elif git show-ref --verify --quiet "refs/remotes/origin/$name"; then
    git branch -f "$name" "refs/remotes/origin/$name" 2>/dev/null || true
    if git show-ref --verify --quiet "refs/heads/$name"; then
      REWRITE_REFS+=("refs/heads/$name")
    fi
  fi
done

while IFS= read -r tag; do
  [[ -n "$tag" ]] && REWRITE_REFS+=("$tag")
done < <(git for-each-ref --format='%(refname)' refs/tags)

if [[ ${#REWRITE_REFS[@]} -eq 0 ]]; then
  echo "No refs to rewrite." >&2
  exit 1
fi

echo "Refs to rewrite (addins excluded):"
printf '  %s\n' "${REWRITE_REFS[@]}"

if [[ -n "$BACKUP_DIR" ]]; then
  mkdir -p "$BACKUP_DIR"
  backed=0
  for g in "${PATH_GLOBS[@]}"; do
    # shellcheck disable=SC2086
    for f in $g; do
      [[ -f "$f" ]] || continue
      dest="$BACKUP_DIR/$f"
      mkdir -p "$(dirname "$dest")"
      if [[ "$DRY_RUN" != 1 ]]; then
        cp -f "$f" "$dest"
      else
        echo "  would backup: $f"
      fi
      backed=$((backed + 1))
    done
  done
  echo "Backed up $backed working-tree files to: $BACKUP_DIR"
fi

if [[ "$DRY_RUN" == 1 ]]; then
  echo "Dry run. Would run git filter-repo --invert-paths with path globs above."
  exit 0
fi

args=(--force --invert-paths --refs "${REWRITE_REFS[@]}")
for g in "${PATH_GLOBS[@]}"; do
  args+=(--path-glob "$g")
done

echo "Rewriting history..."
"${FILTER_REPO[@]}" "${args[@]}"

if [[ -n "$BACKUP_DIR" && -d "$BACKUP_DIR" ]]; then
  echo "Restoring working-tree copies from backup (not staged)..."
  find "$BACKUP_DIR" -type f | while read -r bf; do
    rel="${bf#"$BACKUP_DIR"/}"
    mkdir -p "$(dirname "$rel")"
    cp -f "$bf" "$rel"
  done
fi

if [[ "$SKIP_GC" != 1 ]]; then
  git gc --prune=now
  git count-objects -vH
fi

cat <<'EOF'

Done. Branch addins was not rewritten.

Re-add origin if removed, force-push main/stable/tags (not addins).
Restore working-tree binaries: bash src/addins/sync-addins.sh

See service/git/README.md for details.
EOF
