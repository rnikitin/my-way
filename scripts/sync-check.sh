#!/usr/bin/env bash
# sync-check.sh: report drift between vendored skills and their upstream sources.
set -u

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$repo_root"

ok=0
drift=0
unreachable=0
missing=0

check_remote_file() {
  local label="$1"
  local url="$2"
  local expected="$3"

  if [[ -z "$url" || -z "$expected" ]]; then
    echo "MISSING_META $label"
    missing=$((missing + 1))
    return
  fi

  local tmp_file
  tmp_file="$(mktemp)"
  if ! curl -sS -L --fail -o "$tmp_file" "$url" 2>/dev/null; then
    echo "UNREACHABLE $label"
    unreachable=$((unreachable + 1))
    rm -f "$tmp_file"
    return
  fi

  local actual
  actual="$(shasum -a 256 "$tmp_file" | cut -d" " -f1)"
  rm -f "$tmp_file"
  if [[ "$actual" == "$expected" ]]; then
    echo "OK $label"
    ok=$((ok + 1))
  else
    echo "DRIFT $label (expected=$expected actual=$actual)"
    drift=$((drift + 1))
  fi
}

while IFS= read -r meta; do
  tracked_count="$(jq -r '(.tracked_files // []) | length' "$meta")"
  if [[ "$tracked_count" -gt 0 ]]; then
    while IFS= read -r tracked; do
      path="$(jq -r '.path // empty' <<<"$tracked")"
      url="$(jq -r '.source_url // empty' <<<"$tracked")"
      expected="$(jq -r '.upstream_sha // empty' <<<"$tracked")"
      check_remote_file "$meta:$path" "$url" "$expected"
    done < <(jq -c '.tracked_files[]' "$meta")
  else
    url="$(jq -r '.source_url // empty' "$meta")"
    expected="$(jq -r '.upstream_sha // empty' "$meta")"
    check_remote_file "$meta" "$url" "$expected"
  fi
done < <(find skills/_vendored -name _meta.json | sort)

echo "---"
echo "Summary: OK=$ok DRIFT=$drift UNREACHABLE=$unreachable MISSING_META=$missing"
