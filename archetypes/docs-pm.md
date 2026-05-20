---
name: docs-pm
projects-examples:
  - this repo
  - ~/dev/3lgn/screener-3-experiments
---

# Docs PM

## What This Is

Use this archetype for projects where the main work is product specs, program reporting, documentation, roadmaps, decision logs, meeting notes, release checklists, or docs-as-source coordination.

Canonical local example: this repository.

This archetype fits projects where correctness depends on source-of-truth discipline, link health, handoff quality, dated decisions, acceptance criteria, and keeping repo-local docs aligned with Notion, tickets, or stakeholder-facing summaries.

## Mandatory Setup

- `AGENTS.md` from [`templates/agents-md/docs-pm.md`](../templates/agents-md/docs-pm.md)
- `CLAUDE.md` shim from [`templates/claude-md/docs-pm.md`](../templates/claude-md/docs-pm.md) when Claude Code is used
- Principle: [`instruction-minimalism`](../principles/instruction-minimalism.md)
- Principle: [`progressive-disclosure`](../principles/progressive-disclosure.md)
- Principle: [`memory-hygiene`](../principles/memory-hygiene.md)
- Principle: [`context-management`](../principles/context-management.md)
- Principle: [`verification`](../principles/verification.md)
- Principle: [`harness-audit`](../principles/harness-audit.md)
- Skill: [`superpowers/brainstorming`](../skills/_vendored/superpowers/brainstorming/SKILL.md)
- Skill: [`superpowers/writing-plans`](../skills/_vendored/superpowers/writing-plans/SKILL.md)
- Skill: [`superpowers/executing-plans`](../skills/_vendored/superpowers/executing-plans/SKILL.md)
- Skill: [`superpowers/verification-before-completion`](../skills/_vendored/superpowers/verification-before-completion/SKILL.md)

## Recommended Setup

- Principle: [`explore-plan-implement`](../principles/explore-plan-implement.md)
- Principle: [`mechanical-guardrails`](../principles/mechanical-guardrails.md)
- Principle: [`simplicity`](../principles/simplicity.md)
- Skill: [`superpowers/systematic-debugging`](../skills/_vendored/superpowers/systematic-debugging/SKILL.md)
- Skill: [`superpowers/requesting-code-review`](../skills/_vendored/superpowers/requesting-code-review/SKILL.md)
- Skill: [`superpowers/receiving-code-review`](../skills/_vendored/superpowers/receiving-code-review/SKILL.md)
- Skill: [`mine/execplan`](../skills/mine/execplan/SKILL.md) for long-running documentation or program plans

## MCP Servers

Keep mandatory and recommended MCP servers to five total. Add others only when a project has a real source-of-truth or publication surface.

| Status | Name | Why for this archetype |
|--------|------|------------------------|
| mandatory | [`filesystem`](../mcp/filesystem.md) | Lets agents inspect local docs, plans, handoffs, changelogs, templates, and generated reports without pasting them into chat. |
| recommended | [`notion`](../mcp/notion.md) | Useful when PRDs, meeting notes, roadmaps, task databases, or stakeholder-facing wiki pages live in Notion. |

## Tools

| Status | Name | Why |
|--------|------|-----|
| mandatory | project-native docs lint command | Keeps Markdown, frontmatter, tables, generated docs, or prose conventions mechanically consistent. |
| mandatory | [`markdown-link-check`](../tools/markdown-link-check.md) | Catches broken local and external links before docs are published or copied. |
| mandatory | project-native sync or drift check | Confirms generated indexes, vendored docs, source cards, or copied templates still match their declared source. |
| recommended | project-native render or export check | Use when docs publish as a site, PDF, slide deck, or stakeholder-facing report. |
| recommended | [`agentlint`](../tools/agentlint.md) | Cross-cutting harness audit for instruction files, validation commands, handoff state, safety boundaries, and repo guardrails. |

## Skills

| Status | Name | Why |
|--------|------|-----|
| mandatory | `brainstorming` | Clarifies audience, source of truth, decision needed, acceptance criteria, and publication target before editing. |
| mandatory | `writing-plans` | Produces explicit plans for multi-doc reorganizations, release docs, and roadmap changes. |
| mandatory | `executing-plans` | Helps carry a written documentation or program plan through checkpoints. |
| mandatory | `verification-before-completion` | Forces evidence before claiming a doc set, release note, or handoff is complete. |
| recommended | `systematic-debugging` | Useful when validation, generated indexes, or doc builds fail in unclear ways. |
| recommended | `requesting-code-review` | Useful before publishing broad instruction, policy, or public documentation changes. |
| recommended | `receiving-code-review` | Keeps review feedback grounded in the actual requested doc behavior. |
| recommended | `execplan` | Better for long-running program plans that must survive context resets. |

## Templates

- [`templates/agents-md/docs-pm.md`](../templates/agents-md/docs-pm.md) - copy to `AGENTS.md` and fill project-specific commands, source-of-truth rules, publication targets, and review gates.
- [`templates/claude-md/docs-pm.md`](../templates/claude-md/docs-pm.md) - copy to `CLAUDE.md` when using Claude Code.
- [`templates/execplan/EXECPLAN.md`](../templates/execplan/EXECPLAN.md) - use for multi-doc reorganizations, release plans, roadmap phases, and durable decision work.

## Suggested Project Layout

Use this as a starting point, then conform to the existing project if it already has a good structure.

```text
.
├── AGENTS.md
├── CLAUDE.md
├── README.md
├── CHANGELOG.md
├── HANDOFF.md
├── docs/
│   ├── README.md
│   ├── decisions/
│   ├── specs/
│   ├── reports/
│   └── releases/
├── memory/
│   ├── index.md
│   ├── context.md
│   ├── feedback/
│   └── knowledge/
├── plans/
├── scripts/
└── templates/
```

## Source Of Truth Discipline

Every doc set should say where truth lives:

- repo-local Markdown
- Notion page or database
- ticket tracker
- generated site or export
- product analytics or reporting system
- external source linked through a short local source card

When syncing between systems, state the direction: repo to Notion, Notion to repo, generated from templates, or manual summary. Do not silently merge conflicting versions.

Use dated status markers for active documents:

- draft
- proposed
- accepted
- superseded
- archived
- retracted

## Memory Discipline

Keep memory focused on durable working state, not meeting transcripts or raw stakeholder chat.

- `HANDOFF.md` - current repo status, next work, validation commands, and known tradeoffs
- `memory/index.md` - memory map and startup reads for projects that need persistent agent memory
- `memory/context.md` - live status board only
- `docs/decisions/` - dated decisions with owner, status, context, and consequences
- `docs/reports/` - durable summaries, not raw generated output dumps
- `plans/` - execution plans and phase plans that need to survive context resets

When summarizing a meeting, separate facts, decisions, open questions, owner/action items, and follow-up verification. Do not turn a tentative note into accepted policy.

## Secrets & Privacy

Never commit secrets, credentials, private customer data, internal-only exports, unredacted transcripts, or raw workspace dumps.

Recommended locations:

- `.env` and `.env.local` for local-only publishing credentials; both gitignored
- private Notion, ticket, or docs workspace for confidential stakeholder material
- redacted fixtures for public examples
- ignored local artifacts for generated validation reports

Recommended `.gitignore` additions:

```gitignore
.env
.env.*
!.env.example
.context/
artifacts/
exports/private/
reports/generated/
```

## Review Gates

Every public or stakeholder-facing doc change should name its evidence type:

- local link check
- external link check
- docs lint or format check
- generated index sync check
- render or export check
- source-card review
- stakeholder approval
- release checklist result
- AgentLint or equivalent harness audit

Minimum gate before publishing:

1. Source of truth and sync direction documented.
2. Audience and purpose clear in the document or enclosing README.
3. Acceptance criteria, owners, dates, and status markers present where decisions or commitments are made.
4. Relative links resolve and external links are either checked or explicitly documented as intentionally ignored.
5. Private material is redacted or kept out of the public repo.
6. Handoff, changelog, or release notes updated when the change affects navigation, process, or public-facing structure.

## Typical Pitfalls

- Blind links -> Add a local sentence explaining why the source matters and when to open it.
- Notion drift -> Decide which system wins before syncing.
- Stale handoff -> Update the handoff when status, validation, next work, or known tradeoffs change.
- Prose without acceptance -> Add a checklist or validation command before calling a spec ready.
- Decision ambiguity -> Record status, date, owner, context, and consequences.
- Generated-doc churn -> Keep generated output ignored unless it is an intentional fixture or release artifact.
- Root instruction bloat -> Move long rationale into docs, principles, or source cards.
- Overclaiming -> Say what was verified, what was only reviewed, and what remains open.

## Reference Layouts

- Local canonical: this repository
- Useful local comparison: `~/dev/3lgn/screener-3-experiments`
- Current handoff pattern: [`../HANDOFF.md`](../HANDOFF.md)
- AGENTS.md practical guide: [`agents-md-2500-study`](../skills/_refs/agents-md-2500-study.md)
- AGENTS.md evaluation paper: [`evaluating-agents-md-paper`](../skills/_refs/evaluating-agents-md-paper.md)

## First Setup Checklist

- [ ] Copy `templates/agents-md/docs-pm.md` to `AGENTS.md`.
- [ ] Fill in project name, docs commands, source-of-truth rules, publication targets, and review gates.
- [ ] Add a thin `CLAUDE.md` shim only if Claude Code is used.
- [ ] Create or update `HANDOFF.md`.
- [ ] Create or update README navigation for major docs directories.
- [ ] Add `.env.example` only if publishing or sync commands require environment variables.
- [ ] Run docs lint, link check, sync check, and any render/export check; record expected output in `README.md` or `AGENTS.md`.
