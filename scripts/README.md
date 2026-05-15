# Scripts

Maintenance scripts for this repository.

## `sync-check.sh`

Reports drift between vendored skills and their upstream sources.

Run from the repository root:

```bash
bash scripts/sync-check.sh
```

Statuses:

- `OK` - upstream content hash matches `_meta.json`.
- `DRIFT` - upstream content changed since the local copy was recorded.
- `UNREACHABLE` - upstream URL could not be fetched.
- `MISSING_META` - required provenance field is missing.

The script always exits `0`; review the status lines instead of treating it as a CI gate.
