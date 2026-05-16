# Scripts

Maintenance scripts for this repository.

## Structure

Scripts live here only when they maintain `my-way` itself. They should be deterministic, safe to run from the repository root, and documented in this README with expected status output.

## How To Navigate

Use this directory when changing vendored skills, source references, or public documentation. For normal project setup, start from [../archetypes/](../archetypes/) instead.

## `sync-check.sh`

Reports drift between vendored skills and their upstream sources.

Run from the repository root:

```bash
make sync-check
```

Statuses:

- `OK` - upstream content hash matches `_meta.json`.
- `DRIFT` - upstream content changed since the local copy was recorded.
- `UNREACHABLE` - upstream URL could not be fetched.
- `MISSING_META` - required provenance field is missing.

The script always exits `0`; review the status lines instead of treating it as a CI gate.

## Related Checks

Markdown link checks are run with `markdown-link-check` and configured by [../.markdown-link-check.json](../.markdown-link-check.json). Use `make link-check` for the full command.
