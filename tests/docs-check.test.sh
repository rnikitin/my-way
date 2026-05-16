#!/usr/bin/env bash
set -euo pipefail

bash scripts/sync-check.sh

find . -name "*.md" -not -path "./.git/*" -print0 | while IFS= read -r -d "" file; do
  npx -y markdown-link-check -c .markdown-link-check.json "$file"
done

