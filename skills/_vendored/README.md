# Vendored Skills

Vendored skills are copied public skills kept locally so important workflows remain available even if an upstream source moves or disappears.

## Structure

Each vendored skill directory should contain:

- `SKILL.md` copied from upstream
- `_meta.json` with source URL, upstream SHA, fetch date, license, and local notes
- `LICENSE.upstream` when the upstream repository provides one

Current vendored set:

- [superpowers/](superpowers/) - MIT-licensed development workflow skills.

## How To Navigate

Open a skill's `SKILL.md` when you need to run that workflow. Open `_meta.json` when checking provenance or upstream drift. Use [../../scripts/sync-check.sh](../../scripts/sync-check.sh) from the repository root to compare recorded upstream hashes.

Do not edit vendored skill content silently. If a local change is necessary, record the reason in `_meta.json` `local_notes`.

