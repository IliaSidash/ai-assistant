#!/usr/bin/env bash
set -euo pipefail

DEFAULT_REMOTE="tradernet-dev:/var/www/tradernet"

# Usage:
#   ./sync.sh <worktree-name> [remote] [repo_path]
# Examples:
#   ./sync.sh migrate-loader-component
#   ./sync.sh migrate-loader-component tradernet-dev:/var/www/tradernet /Users/i.sidash/web/fft/tradernet

WT_NAME="${1:-}"
REMOTE="${2:-${WT_REMOTE:-$DEFAULT_REMOTE}}"
REPO_PATH="${3:-.}"

if [[ -z "$WT_NAME" ]]; then
  echo "❌ worktree-name is required"
  echo "   usage: $0 <worktree-name> [remote] [repo_path]"
  exit 1
fi

if ! git -C "$REPO_PATH" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "❌ '$REPO_PATH' is not a git repo/worktree."
  echo "   Tip: pass repo_path, e.g. /Users/i.sidash/web/fft/tradernet"
  exit 1
fi

WT_PATH="$(
  git -C "$REPO_PATH" worktree list --porcelain \
  | awk -v name="$WT_NAME" '
      $1=="worktree"{p=$2}
      $1=="branch"{
        b=$2; sub(/^refs\/heads\//,"",b);
        if (b==name) {print p; exit}
      }'
)"

if [[ -z "$WT_PATH" ]]; then
  echo "❌ worktree '$WT_NAME' not found in repo: $(git -C "$REPO_PATH" rev-parse --show-toplevel)"
  echo "   Available:"
  git -C "$REPO_PATH" worktree list
  exit 1
fi

cd "$WT_PATH"

tmpfile="$(mktemp -t wt-files.XXXXXX)"
trap 'rm -f "$tmpfile"' EXIT

# Build list: modified tracked + untracked (excluding ignored)
{ git diff --name-only; git ls-files --others --exclude-standard; } \
  | sort -u \
  | while read -r line; do [ -f "$line" ] && echo "$line"; done > "$tmpfile"

if [[ ! -s "$tmpfile" ]]; then
  echo "✅ No changed/new files in '$WT_NAME' ($WT_PATH)"
  exit 0
fi

count="$(wc -l < "$tmpfile" | tr -d ' ')"

echo "📦 Worktree: $WT_NAME"
echo "📁 Path:     $WT_PATH"
echo "➡️  Remote:   $REMOTE"
echo "🧾 Files:    $count"

# Send only those files, preserving paths; no mirroring / no deletes
rsync -av --files-from="$tmpfile" ./ "$REMOTE"

echo "✅ Done"
