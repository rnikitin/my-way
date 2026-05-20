# Changelog

## 2026-05-16

- Initial scaffolding for the My Way best practices repository.
- Completed Phase A research-ml proof of concept: principles, research-ml archetype, MCP/tool catalog, Superpowers vendored skills, link-only references, execplan skill copy, templates, sync check, and link check.
- Expanded Karpathy guidelines into a local archived MIT-licensed copy after source-durability review.
- Made research artifacts file-backed by default and downgraded Postgres MCP to optional for research-ml.
- Improved README navigation and added locally maintained `frontend-design` and `code-simplifier` skills to the skills catalog.
- Added root `AGENTS.md`, `HANDOFF.md`, `SECURITY.md`, `plans/README.md`, `Makefile`, and docs-check test after an AgentLint audit.
- Promoted AgentLint into a cross-project harness-audit principle and recommended tool cadence.
- Added `.markdown-link-check.json` to ignore intentional localhost example URLs in copied planning references.

## 2026-05-18

- Saved the durable Phase A/B source plan under `plans/`.
- Added a Phase B rollout matrix for the remaining archetypes.
- Completed the `trading-data` archetype slice with `AGENTS.md` and `CLAUDE.md` templates.
- Added `duckdb` and `polars` tool notes for data-heavy archetypes.
- Excluded ignored `.context/` scratch files from repository markdown link checks.
- Refreshed Notion MCP source links after upstream documentation moved.
- Vendored the MIT-licensed `agents-best-practices` skill with reference files, provenance metadata, and local guidance for the planned `agent-workflow` archetype.
- Added an explicit markdown-link-check ignore for `agentskills.io` links because the site returns HTTP 200 via `curl` while `markdown-link-check` reports transient status 0 failures.
- Added a draft `agent-workflow` archetype with matching `AGENTS.md` and `CLAUDE.md` templates for agent harness, tool-calling, connector, eval, and approval-gated automation projects.

## 2026-05-19

- Promoted the `agent-workflow` archetype from draft to complete after adding matching navigation, templates, vendored skill references, and local project examples.
- Completed the `docs-pm` archetype with matching templates and a mandatory `markdown-link-check` tool note.
- Completed the `prototype` archetype with matching templates and browser/runtime verification guidance.
- Made the Makefile markdown link-check target fail on individual `markdown-link-check` errors instead of masking them through the shell pipeline.
- Added a markdown-link-check ignore for vendored MCP 2025-11-25 spec links because the live Mintlify pages return HTTP 200 via `curl` while `markdown-link-check` intermittently reports status 0.

## 2026-05-20

- Closed the Phase B rollout plan after verifying all five archetypes, their compact `AGENTS.md` templates, their `CLAUDE.md` shims, and the repository docs checks.
