---
name: prototype
projects-examples:
  - ~/dev/2and
  - lightweight demos
---

# Prototype

## What This Is

Use this archetype for lightweight apps, games, demos, experiments, proof-of-concept product surfaces, and exploratory workflows where the fastest useful outcome is a runnable experience.

Canonical local example: `~/dev/2and`.

This archetype fits projects where correctness depends on a working first screen, focused scope, clear promotion boundaries, responsive behavior, browser or runtime smoke checks, and avoiding the false confidence of a static mockup.

## Mandatory Setup

- `AGENTS.md` from [`templates/agents-md/prototype.md`](../templates/agents-md/prototype.md)
- `CLAUDE.md` shim from [`templates/claude-md/prototype.md`](../templates/claude-md/prototype.md) when Claude Code is used
- Principle: [`instruction-minimalism`](../principles/instruction-minimalism.md)
- Principle: [`progressive-disclosure`](../principles/progressive-disclosure.md)
- Principle: [`explore-plan-implement`](../principles/explore-plan-implement.md)
- Principle: [`mechanical-guardrails`](../principles/mechanical-guardrails.md)
- Principle: [`simplicity`](../principles/simplicity.md)
- Principle: [`verification`](../principles/verification.md)
- Skill: [`superpowers/brainstorming`](../skills/_vendored/superpowers/brainstorming/SKILL.md)
- Skill: [`superpowers/writing-plans`](../skills/_vendored/superpowers/writing-plans/SKILL.md)
- Skill: [`superpowers/test-driven-development`](../skills/_vendored/superpowers/test-driven-development/SKILL.md)
- Skill: [`superpowers/systematic-debugging`](../skills/_vendored/superpowers/systematic-debugging/SKILL.md)
- Skill: [`superpowers/verification-before-completion`](../skills/_vendored/superpowers/verification-before-completion/SKILL.md)

## Recommended Setup

- Principle: [`context-management`](../principles/context-management.md)
- Principle: [`memory-hygiene`](../principles/memory-hygiene.md)
- Principle: [`harness-audit`](../principles/harness-audit.md)
- Skill: [`mine/frontend-design`](../skills/mine/frontend-design/SKILL.md) for web UI, dashboards, marketing surfaces, and interactive product views
- Skill: [`mine/code-simplifier`](../skills/mine/code-simplifier/SKILL.md) for tightening prototype code without changing behavior
- Skill: [`superpowers/executing-plans`](../skills/_vendored/superpowers/executing-plans/SKILL.md)
- Skill: [`superpowers/requesting-code-review`](../skills/_vendored/superpowers/requesting-code-review/SKILL.md)
- Skill: [`mine/execplan`](../skills/mine/execplan/SKILL.md) for prototypes that grow into multi-step implementation plans

## MCP Servers

Keep mandatory and recommended MCP servers to five total. Add others only when the prototype has a concrete runtime, data, or verification need.

| Status | Name | Why for this archetype |
|--------|------|------------------------|
| mandatory | [`filesystem`](../mcp/filesystem.md) | Lets agents inspect local source, assets, docs, screenshots, and generated artifacts without pasting them into chat. |
| recommended | [`chrome`](../mcp/chrome.md) | Useful for browser smoke checks, responsive verification, console/network inspection, screenshots, and local app QA. |
| optional | [`context7`](../mcp/context7.md) | Useful when fast-moving framework, game engine, or SDK docs may have changed. |
| optional | [`notion`](../mcp/notion.md) | Useful only when prototype briefs, feedback, or stakeholder notes already live in Notion. |

## Tools

| Status | Name | Why |
|--------|------|-----|
| mandatory | project-native install and dev-server commands | A prototype must be runnable locally, not only described. |
| mandatory | project-native test command | Keep core parsing, state transitions, rules, and data transforms executable. |
| mandatory | project-native lint and format commands | Prevent rapid iteration from becoming unreviewable churn. |
| recommended | project-native type or schema check | Useful for props, API payloads, game state, config, and generated data boundaries. |
| recommended | browser or runtime smoke check | Verify the primary user flow in the real target runtime after UI or interaction changes. |
| recommended | [`agentlint`](../tools/agentlint.md) | Recommended when the prototype includes agent instructions, handoffs, generated workflows, or public templates. |

## Skills

| Status | Name | Why |
|--------|------|-----|
| mandatory | `brainstorming` | Clarifies user, first useful flow, interaction model, constraints, and acceptance before building. |
| mandatory | `writing-plans` | Produces explicit plans for prototypes that need more than a single small edit. |
| mandatory | `test-driven-development` | Keeps core behavior measurable even when UI is exploratory. |
| mandatory | `systematic-debugging` | Prevents random retries when dev servers, browser state, rendering, or assets fail. |
| mandatory | `verification-before-completion` | Forces browser/runtime evidence before claiming the prototype works. |
| recommended | `frontend-design` | Helps turn web prototypes into usable, distinctive interfaces instead of generic mockups. |
| recommended | `code-simplifier` | Useful after the first working pass to reduce accidental complexity. |
| recommended | `executing-plans` | Helps carry larger prototype plans through checkpoints. |
| recommended | `execplan` | Better for prototypes that become durable product or architecture work. |

## Templates

- [`templates/agents-md/prototype.md`](../templates/agents-md/prototype.md) - copy to `AGENTS.md` and fill project-specific commands, runtime, design constraints, and verification gates.
- [`templates/claude-md/prototype.md`](../templates/claude-md/prototype.md) - copy to `CLAUDE.md` when using Claude Code.
- [`templates/execplan/EXECPLAN.md`](../templates/execplan/EXECPLAN.md) - use when a prototype needs phases, browser checks, asset plans, or a promotion path.

## Suggested Project Layout

Use this as a starting point, then conform to the existing project if it already has a good structure.

```text
.
├── AGENTS.md
├── CLAUDE.md
├── README.md
├── docs/
│   ├── brief.md
│   ├── decisions/
│   └── verification/
├── memory/
│   ├── index.md
│   └── context.md
├── plans/
├── public/
├── scripts/
├── src/
└── tests/
```

## Prototype Boundary

Write down what the prototype proves and what it deliberately does not prove.

At minimum, record:

- target user and primary task
- first useful flow
- devices or runtime to support
- fake, stubbed, or generated data
- external services intentionally not integrated
- persistence model, if any
- accessibility and responsive baseline
- promotion criteria for turning the prototype into product work

Prefer a real usable first screen over a landing page that only explains the idea.

## Browser And Runtime Verification

A UI prototype is not verified until it has run in the target runtime.

For browser prototypes, check:

- dev server starts cleanly
- first viewport is not blank
- primary interaction works
- expected assets load
- console has no relevant errors
- desktop and mobile layouts do not overlap
- focus states and keyboard path are usable for the primary flow

For non-browser prototypes, define the equivalent smoke path: CLI invocation, game loop, notebook run, API request, or generated artifact render.

## Secrets & Data

Never commit secrets, tokens, raw credentials, private user data, production exports, or generated heavy artifacts.

Recommended locations:

- `.env` and `.env.local` for local-only values; both gitignored
- `.env.example` with variable names but no secrets
- ignored `artifacts/`, `screenshots/`, `test-results/`, or `runs/` directories for generated outputs
- mock or redacted fixtures for public demos

Recommended `.gitignore` additions:

```gitignore
.env
.env.*
!.env.example
artifacts/
screenshots/
test-results/
runs/
```

## Review Gates

Every promoted prototype result should name its evidence type:

- unit or integration test
- browser smoke result
- screenshot review
- responsive viewport check
- accessibility smoke result
- build result
- deployment preview
- user walkthrough notes

Minimum gate before sharing:

1. Primary user flow works from a fresh local start.
2. README explains install, run, and verification commands.
3. Fake data, stubs, and unsupported paths are labeled.
4. Desktop and mobile views are checked when the target is browser UI.
5. Console, terminal, or runtime errors are reviewed.
6. Promotion boundary and next risk are documented.

## Typical Pitfalls

- Static mockup trap -> Build and verify a runnable flow.
- Scope creep -> Keep the first useful flow narrow and defer secondary screens.
- Generic UI -> Use a clear design direction and the existing design system when present.
- No visual QA -> Open the app and inspect the real runtime before claiming completion.
- Hidden stubs -> Label fake data, fake auth, fake payments, and simulated integrations.
- Mobile breakage -> Check small and wide viewports before sharing a browser prototype.
- Dependency churn -> Do not add heavy packages unless they directly prove the prototype goal.
- Promotion blur -> Record what must change before production use.

## Reference Layouts

- Local canonical: `~/dev/2and`
- UI skill: [`frontend-design`](../skills/mine/frontend-design/SKILL.md)
- AGENTS.md practical guide: [`agents-md-2500-study`](../skills/_refs/agents-md-2500-study.md)
- AGENTS.md evaluation paper: [`evaluating-agents-md-paper`](../skills/_refs/evaluating-agents-md-paper.md)

## First Setup Checklist

- [ ] Copy `templates/agents-md/prototype.md` to `AGENTS.md`.
- [ ] Fill in project name, runtime, install/dev/build/test commands, and browser or runtime smoke checks.
- [ ] Add a thin `CLAUDE.md` shim only if Claude Code is used.
- [ ] Create or update a README with install, run, and verification commands.
- [ ] Label fake data, stubs, unsupported paths, and promotion criteria.
- [ ] Run the primary local smoke path and record expected output in `README.md` or `AGENTS.md`.
