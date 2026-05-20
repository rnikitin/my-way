# Phase B Archetype Rollout Plan

## Context

Phase A proved the repository shape with the complete `research-ml` archetype. The durable source plan is [2026-05-17-my-way-best-practices-repo-plan.md](2026-05-17-my-way-best-practices-repo-plan.md); this file narrows Phase B into an execution order for the remaining archetypes.

## Assumptions

- Keep `my-way` docs-first. Do not add a bootstrap CLI, database, CI workflow, or package manifest as part of Phase B.
- Keep `AGENTS.md` templates compact and hand-curated.
- Add tool and MCP entries only when an archetype links to them.
- Treat AgentLint as recommended harness audit tooling, not the only quality gate.
- Preserve file-backed artifacts as the default unless a target project already has a stronger storage contract.

## Archetype Matrix

| Order | Archetype | Local examples | Main risk to encode | New catalog surface |
|-------|-----------|----------------|---------------------|---------------------|
| 1 | `trading-data` | `~/dev/ark-algotrading` | Lookahead bias, data leakage, fragile backtests, live-trading safety. | `tools/duckdb.md`, `tools/polars.md`, `templates/agents-md/trading-data.md`, `templates/claude-md/trading-data.md`. |
| 2 | `agent-workflow` | `~/dev/3lgn/mastergptchatflow`, `~/dev/3lgn/mastra`, `~/dev/deliverator` | Prompt/tool drift, weak evals, overgrown workflows, unsafe external actions. | Vendored `agents-best-practices` skill, `agent-workflow` templates, workflow verification guidance. |
| 3 | `docs-pm` | This repo, `~/dev/3lgn/screener-3-experiments` | Blind links, stale handoffs, prose without acceptance checks, Notion drift. | Markdown/link tooling expansion, docs release checklist. |
| 4 | `prototype` | `~/dev/2and` and lightweight demos | Shipping a demo with no verification, no visual QA, or unclear promotion boundary. | Browser verification notes, frontend/game-specific template guidance. |

## Ordered Steps

1. Complete `trading-data` end to end using the `research-ml` file shape.
2. Complete `agent-workflow` using the vendored `agents-best-practices` source package.
3. Complete `docs-pm` with source-of-truth, link-check, handoff, and release-documentation guidance.
4. Complete `prototype` with runnable-flow, browser/runtime verification, and promotion-boundary guidance.
5. Update indexes and README navigation so users can discover every complete archetype.
6. Run the normal docs checks and fix broken relative links immediately.

## Acceptance

- `archetypes/trading-data.md` exists and has no unresolved placeholders.
- `templates/agents-md/trading-data.md` is compact and under 150 lines.
- `templates/claude-md/trading-data.md` contains exactly one standalone `@AGENTS.md` import line.
- `archetypes/agent-workflow.md` exists and has no unresolved placeholders.
- `templates/agents-md/agent-workflow.md` is compact and under 150 lines.
- `templates/claude-md/agent-workflow.md` contains exactly one standalone `@AGENTS.md` import line.
- `archetypes/docs-pm.md` exists and has no unresolved placeholders.
- `templates/agents-md/docs-pm.md` is compact and under 150 lines.
- `templates/claude-md/docs-pm.md` contains exactly one standalone `@AGENTS.md` import line.
- `archetypes/prototype.md` exists and has no unresolved placeholders.
- `templates/agents-md/prototype.md` is compact and under 150 lines.
- `templates/claude-md/prototype.md` contains exactly one standalone `@AGENTS.md` import line.
- Every new relative link resolves.
- `make test` passes.

## Validation

- 2026-05-18: `bash tests/docs-check.test.sh` passed.
- 2026-05-18: `make test` passed.
- 2026-05-18: `npx -y -p agentlint-ai agentlint check --project-dir . --format terminal` reported `95/100 (core)`.
- 2026-05-19: `bash tests/docs-check.test.sh` passed.
- 2026-05-19: `make test` passed.
- 2026-05-19: `npx -y -p agentlint-ai agentlint check --project-dir . --format terminal` reported `95/100 (core)`.
- 2026-05-20: Acceptance audit confirmed all five archetypes exist, all `templates/agents-md/*.md` archetype templates stay under 150 lines, every matching `templates/claude-md/*.md` shim has exactly one standalone `@AGENTS.md` import line, and there are no unresolved `TBD`, `TODO`, `FIXME`, or `unresolved` markers in the Phase B archetype/template files.
- 2026-05-20: `bash tests/docs-check.test.sh` passed.
- 2026-05-20: `make test` passed.
- 2026-05-20: `npx -y -p agentlint-ai agentlint check --project-dir . --format terminal` reported `95/100 (core)`.
- 2026-05-20: `git diff --check` passed.

## Progress

- [x] Save the source Phase A/B plan under `plans/`.
- [x] Create this Phase B rollout matrix.
- [x] Complete the `trading-data` archetype slice.
- [x] Complete the `agent-workflow` archetype slice.
- [x] Complete the `docs-pm` archetype slice.
- [x] Complete the `prototype` archetype slice.
- [x] Exclude ignored `.context/` scratch files from public-doc link checks.
- [x] Re-run checks and record the result.
