# Archetype Field Hardening Plan

## Context

Phase B completed the five initial archetypes: [`research-ml`](../archetypes/research-ml.md), [`trading-data`](../archetypes/trading-data.md), [`agent-workflow`](../archetypes/agent-workflow.md), [`docs-pm`](../archetypes/docs-pm.md), and [`prototype`](../archetypes/prototype.md).

The next useful work is not more abstract catalog expansion. The next useful work is applying these archetypes against real projects and tightening anything that proves too generic, too heavy, too vague, or missing a local safety boundary.

## Assumptions

- Keep `my-way` docs-first.
- Do not edit external target projects from this repository workspace unless the user explicitly directs that work.
- Do not add CI, release automation, package managers, or bootstrap scripts as part of field hardening without a separate explicit decision.
- Treat target-project application as evidence gathering first, template changes second.
- Keep local validation reports outside committed docs unless a report becomes a durable example.

## Target Matrix

| Archetype | Candidate project | What to test |
|-----------|-------------------|--------------|
| `research-ml` | `~/dev/xlstm-predictor` | Whether research memory, artifact, W&B, and promotion gates are specific enough without bloating `AGENTS.md`. |
| `trading-data` | `~/dev/ark-algotrading` | Whether data provenance, lookahead, broker, and backtest safety boundaries are concrete enough for real trading workflows. |
| `agent-workflow` | `~/dev/3lgn/mastergptchatflow`, `~/dev/3lgn/mastra`, `~/dev/deliverator` | Whether tool permissions, evals, compaction, connector trust, and approval gates map cleanly to a real harness. |
| `docs-pm` | this repo, `~/dev/3lgn/screener-3-experiments` | Whether source-of-truth, link-check, handoff, and decision-log rules are enough for docs/program work. |
| `prototype` | `~/dev/2and` and lightweight demos | Whether runnable-flow, visual QA, responsive checks, and promotion boundaries are practical for fast prototypes. |

## Ordered Steps

1. For each target project, read its root instructions, README, package/tooling files, and nearest project docs.
2. Pick the closest `my-way` archetype and copy its template into a scratch comparison, not directly into the target project.
3. Create a field note under `.context/field-hardening/` with:
   - target project and date
   - chosen archetype
   - template lines that fit unchanged
   - template lines that are too generic or wrong
   - local rules missing from the archetype
   - validation commands that actually exist
   - proposed `my-way` changes, if any
4. Make `my-way` changes only when the same issue is likely to recur across projects.
5. Avoid adding project-specific details to archetypes unless they are clearly labeled as examples.
6. After each pass, run the repo docs checks and update `HANDOFF.md` with the current hardening status.

## Acceptance

- Each complete archetype has at least one field note in `.context/field-hardening/`.
- Any archetype/template change is backed by a named target-project observation.
- No target project is modified from this workspace without explicit user direction.
- No new CI, release automation, package manager, or bootstrap script is added without a separate decision.
- Public docs stay in English and have no blind links.
- `make test` passes after committed docs changes.
- AgentLint is rerun when root instructions, templates, skills, validation commands, handoff files, or security files change.

## Validation

Run after each docs/catalog change:

```bash
make test
```

Run after changing root instructions, templates, skills, validation commands, handoff files, or security files:

```bash
npx -y -p agentlint-ai agentlint check --project-dir . --format terminal
```

## Decisions

- 2026-05-21: Field hardening starts as evidence gathering in `.context/field-hardening/`; public archetype edits come only after a reusable issue is found.
- 2026-05-21: CI remains a separate decision because repository instructions require asking before adding CI or release automation.

## Progress

- [x] Create this field-hardening plan.
- [x] Run the first `docs-pm` pass against this repository.
- [ ] Run one pass each for `research-ml`, `trading-data`, `agent-workflow`, and `prototype` against a target project or a user-approved proxy.
- [ ] Convert recurring findings into archetype/template updates.
- [ ] Re-run validation and update `HANDOFF.md`.
