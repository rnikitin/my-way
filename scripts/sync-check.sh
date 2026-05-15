#!/usr/bin/env bash
# sync-check.sh: report drift between vendored skills and their upstream sources.
set -u

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$repo_root"

ok=0
drift=0
unreachable=0
missing=0

while IFS= read -r meta; do
  url="$(jq -r '.source_url // empty' "$meta")"
  if [[ -z "$url" ]]; then
    echo "MISSING_META $meta"
    missing=$((missing + 1))
    continue
  fi

  expected="$(jq -r '.upstream_sha // empty' "$meta")"
  tmp_file="$(mktemp)"
  if ! curl -sS -L --fail -o "$tmp_file" "$url" 2>/dev/null; then
    echo "UNREACHABLE $meta"
    unreachable=$((unreachable + 1))
    rm -f "$tmp_file"
    continue
  fi

  actual="$(shasum -a 256 "$tmp_file" | cut -d" " -f1)"
  rm -f "$tmp_file"
  if [[ "$actual" == "$expected" ]]; then
    echo "OK $meta"
    ok=$((ok + 1))
  else
    echo "DRIFT $meta (expected=$expected actual=$actual)"
    drift=$((drift + 1))
  fi
done < <(find skills/_vendored -name _meta.json | sort)

echo "---"
echo "Summary: OK=$ok DRIFT=$drift UNREACHABLE=$unreachable MISSING_META=$missing"
