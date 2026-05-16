# Handoff

## Current State

`my-way` is public at <https://github.com/rnikitin/my-way>. The first complete archetype is `research-ml`; the remaining planned archetypes are `trading-data`, `agent-workflow`, `docs-pm`, and `prototype`.

The current repository intentionally favors documentation, templates, and skills over automation. There is no package manifest, application runtime, bootstrap CLI, or formal test suite.

## Next Work

- Author the remaining archetypes.
- Decide whether a small CI workflow is worth the maintenance cost.
- Review whether more local Codex-home skills should move into `skills/mine/`.
- Keep `_refs/` files as annotated source cards, not blind links.

## Verification Conditions

Before calling a docs/catalog change complete, run:

```bash
bash scripts/sync-check.sh
find . -name "*.md" -not -path "./.git/*" -print0 | while IFS= read -r -d "" file; do
  npx -y markdown-link-check -c .markdown-link-check.json "$file"
done
```

At bootstrap, before public release, and when root instructions, skills, hooks, workflows, validation commands, handoff files, or security files change, also run:

```bash
npx -y -p agentlint-ai agentlint check --project-dir . --format terminal
```

verify:

- PASS when `make test` exits 0.
- PASS when `scripts/sync-check.sh` reports `DRIFT=0`, `UNREACHABLE=0`, and `MISSING_META=0`.
- PASS when markdown link check exits 0 or has only explicitly documented ignore patterns.
- PASS when AgentLint findings are either fixed or listed below as intentional tradeoffs.
- PASS when `git status --short` is clean before publishing.

## Known AgentLint Findings

AgentLint still flags missing CI, a missing `test-required.yml` commit gate, and a personal email in public git history. These are known tradeoffs for the current docs-first repo:

- CI and secret scanning are useful future additions but were not part of the initial lightweight repository scope.
- The current test surface is docs-focused: `make test` runs vendored skill sync and markdown link checks.
- Historical commit email should not be rewritten without an explicit history-rewrite decision.
