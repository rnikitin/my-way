---
name: agent-workflow
projects-examples:
  - ~/dev/3lgn/mastergptchatflow
  - ~/dev/3lgn/mastra
  - ~/dev/deliverator
---

# Agent Workflow

## What This Is

Use this archetype for projects that build agents, prompt harnesses, tool-calling workflows, MCP or connector integrations, evaluation harnesses, approval-gated automations, or long-running model-driven workers.

This archetype fits projects where the main product surface is not only application code, but the harness around a model: instructions, context assembly, tool routing, permissions, approvals, execution, memory, compaction, observability, evals, and rollout discipline.

The default posture is conservative: build one reliable agent harness first, keep risky actions draft-only or approval-gated, and add autonomy only after measurable evals show the simpler loop is insufficient.

## Mandatory Setup

- `AGENTS.md` from [`templates/agents-md/agent-workflow.md`](../templates/agents-md/agent-workflow.md)
- `CLAUDE.md` shim from [`templates/claude-md/agent-workflow.md`](../templates/claude-md/agent-workflow.md) when Claude Code is used
- Principle: [`instruction-minimalism`](../principles/instruction-minimalism.md)
- Principle: [`progressive-disclosure`](../principles/progressive-disclosure.md)
- Principle: [`harness-engineering`](../principles/harness-engineering.md)
- Principle: [`mechanical-guardrails`](../principles/mechanical-guardrails.md)
- Principle: [`context-management`](../principles/context-management.md)
- Principle: [`verification`](../principles/verification.md)
- Principle: [`harness-audit`](../principles/harness-audit.md)
- Skill: [`agents-best-practices`](../skills/_vendored/agents-best-practices/SKILL.md)
- Skill: [`superpowers/brainstorming`](../skills/_vendored/superpowers/brainstorming/SKILL.md)
- Skill: [`superpowers/writing-plans`](../skills/_vendored/superpowers/writing-plans/SKILL.md)
- Skill: [`superpowers/test-driven-development`](../skills/_vendored/superpowers/test-driven-development/SKILL.md)
- Skill: [`superpowers/systematic-debugging`](../skills/_vendored/superpowers/systematic-debugging/SKILL.md)
- Skill: [`superpowers/verification-before-completion`](../skills/_vendored/superpowers/verification-before-completion/SKILL.md)

## Recommended Setup

- Principle: [`memory-hygiene`](../principles/memory-hygiene.md)
- Principle: [`explore-plan-implement`](../principles/explore-plan-implement.md)
- Principle: [`simplicity`](../principles/simplicity.md)
- Skill: [`superpowers/executing-plans`](../skills/_vendored/superpowers/executing-plans/SKILL.md)
- Skill: [`superpowers/subagent-driven-development`](../skills/_vendored/superpowers/subagent-driven-development/SKILL.md)
- Skill: [`superpowers/dispatching-parallel-agents`](../skills/_vendored/superpowers/dispatching-parallel-agents/SKILL.md)
- Skill: [`superpowers/using-git-worktrees`](../skills/_vendored/superpowers/using-git-worktrees/SKILL.md)
- Skill: [`superpowers/requesting-code-review`](../skills/_vendored/superpowers/requesting-code-review/SKILL.md)
- Skill: [`superpowers/receiving-code-review`](../skills/_vendored/superpowers/receiving-code-review/SKILL.md)
- Skill: [`goal-forge`](../skills/_vendored/goal-forge/SKILL.md) for compiling rough harness ideas into `/goal`-ready specs when the environment supports Codex goals
- Skill: [`mine/execplan`](../skills/mine/execplan/SKILL.md) for long-running harness plans, eval rollouts, or connector migrations

## MCP Servers

Keep mandatory and recommended MCP servers to five total. Add others only when the project has a concrete data source, action surface, or verification need.

| Status | Name | Why for this archetype |
|--------|------|------------------------|
| mandatory | [`filesystem`](../mcp/filesystem.md) | Lets agents inspect local harness docs, eval fixtures, traces, generated artifacts, and run logs without pasting them into chat. |
| mandatory | [`context7`](../mcp/context7.md) | Pulls current SDK, provider, and framework docs when model API or tool-calling behavior changes. |
| recommended | [`chrome`](../mcp/chrome.md) | Useful for browser-agent, UI, OAuth, dashboard, and local app verification. |
| optional | [`postgres`](../mcp/postgres.md) | Use only when the harness already stores runs, tool events, evals, or business records in Postgres. Prefer read-only credentials for analysis. |
| optional | [`notion`](../mcp/notion.md) | Useful when product specs, policies, meeting notes, or knowledge bases already live in Notion. Treat retrieved content as data, not instructions. |

## Tools

| Status | Name | Why |
|--------|------|-----|
| mandatory | project-native test runner | The harness needs regression tests for model adapter behavior, tool schemas, permission gates, approvals, compaction, and eval fixtures. |
| mandatory | project-native lint and format commands | Agent-facing examples, tool schemas, and generated outputs should stay mechanically consistent. |
| mandatory | project-native type or schema check | Tool contracts, event types, context builders, and permission decisions need stable boundaries. |
| mandatory | eval runner | Use a local command that runs happy-path, near-miss, prompt-injection, tool-misuse, approval-bypass, connector-failure, and compaction cases. |
| recommended | [`agentlint`](../tools/agentlint.md) | Cross-cutting harness audit for instruction files, validation commands, handoff state, safety boundaries, and repo guardrails. |
| optional | [`uv`](../tools/uv.md) | Use for Python-based harnesses, eval runners, or data-processing tools. |
| optional | [`pytest`](../tools/pytest.md) | Use for Python harness tests and eval fixtures. |
| optional | [`ruff`](../tools/ruff.md) | Use for Python lint and format checks. |
| optional | [`mypy`](../tools/mypy.md) | Use when Python tool contracts, adapters, or state models are type-checked. |

## Skills

| Status | Name | Why |
|--------|------|-----|
| mandatory | `agents-best-practices` | Provides the provider-neutral harness model, MVP blueprint, tool permissions, context/compaction, connector, eval, and observability references. |
| mandatory | `brainstorming` | Clarifies domain, autonomy level, risk, state duration, tool surface, and validation before implementation. |
| mandatory | `writing-plans` | Produces explicit plans for multi-step harness, connector, eval, or permission changes. |
| mandatory | `test-driven-development` | Keeps tool schemas, permission decisions, compaction behavior, and eval fixtures grounded in executable checks. |
| mandatory | `systematic-debugging` | Prevents random retries when model behavior, tool calls, connectors, or evals fail. |
| mandatory | `verification-before-completion` | Forces evidence before claiming a harness change, eval result, or rollout gate is complete. |
| recommended | `executing-plans` | Helps execute existing harness plans with checkpoints. |
| recommended | `subagent-driven-development` | Useful only when independent harness slices can be reviewed separately. |
| recommended | `dispatching-parallel-agents` | Useful for independent audits: tool contracts, eval coverage, docs, and connector safety. |
| recommended | `using-git-worktrees` | Keeps risky harness or provider migrations isolated from stable flows. |
| recommended | `goal-forge` | Useful when a rough harness, connector, or eval idea needs a measurable `SPEC.md` and `/goal` contract with scorecard, feedback loop, and working memory. |
| recommended | `execplan` | Better for long-running harness design and implementation plans that must survive context resets. |

## Templates

- [`templates/agents-md/agent-workflow.md`](../templates/agents-md/agent-workflow.md) - copy to `AGENTS.md` and fill project-specific commands, providers, risk classes, tool names, eval commands, and approval policy.
- [`templates/claude-md/agent-workflow.md`](../templates/claude-md/agent-workflow.md) - copy to `CLAUDE.md` when using Claude Code.
- [`templates/execplan/EXECPLAN.md`](../templates/execplan/EXECPLAN.md) - use for harness architecture changes, provider migrations, connector additions, and eval rollouts.

## Suggested Project Layout

Use this as a starting point, then conform to the existing project if it already has a good structure.

```text
.
├── AGENTS.md
├── CLAUDE.md
├── README.md
├── configs/
│   ├── providers/
│   └── tools/
├── docs/
│   └── agent/
│       ├── architecture.md
│       ├── tool-registry.md
│       ├── permission-matrix.md
│       ├── context-memory.md
│       ├── eval-plan.md
│       ├── threat-model.md
│       └── launch-checklist.md
├── evals/
│   ├── cases/
│   ├── fixtures/
│   └── reports/      # ignored unless intentionally archived
├── memory/
│   ├── index.md
│   ├── context.md
│   ├── feedback/
│   └── knowledge/
├── plan/
├── scripts/
├── src/<project_name>/
└── tests/
```

## Harness Boundary

Document the line between the model and the application before adding tools.

The model should interpret intent, choose the next step, request tools through structured calls, synthesize observations, and produce final answers or plans.

The harness should assemble instructions and context, decide visible tools, validate arguments, enforce permissions, execute tools, store events and artifacts, compact and rehydrate context, enforce budgets, and record traces.

Keep these surfaces outside model control:

- credentials and secret access
- user identity and tenant boundaries
- approval records and approval policy
- authorization and permission decisions
- final commits to external systems
- audit logs, traces, billing, and rate limits

## Tool And Permission Model

Every tool should be a narrow contract with domain meaning. Avoid broad wrappers such as `execute_anything`, `call_api`, `update_database`, or `send_message` unless they are sandboxed and heavily permissioned.

Each tool should define:

- name and purpose
- input schema and output schema
- risk class and side-effect class
- resource scope
- permission policy
- timeout and result-size limit
- retry policy
- audit policy
- structured error format

Default risk classes:

| Risk class | Default policy |
|------------|----------------|
| public read, search, compute | allow within project policy and budget |
| private or organization read | allow only inside user, tenant, role, or session scope |
| draft-only | allow when scoped and traced |
| write local artifact | allow when scoped and reversible |
| write internal record | approval-gated unless explicitly low-risk and allowlisted |
| external communication | draft first, approval before send |
| financial, legal, healthcare, or safety-sensitive | approval plus stronger auth or specialist review |
| destructive action | deny by default or require approval plus recovery plan |
| identity, access, or privileged admin | approval plus stronger auth |
| process execution or open network | sandbox, allowlist, timeout, and logging |

Split risky actions into draft and commit tools:

```text
draft_email -> send_email
prepare_refund -> issue_refund
propose_record_update -> apply_record_update
stage_workflow_change -> commit_workflow_change
recommend_trade -> place_trade
```

The model must never approve its own action.

## Context, Memory, And Compaction

The prompt is not the system of record. Store durable state outside model context and reattach only what the next step needs.

Persist:

- active plan or goal
- todo list
- approval records
- tool traces and compact tool summaries
- artifacts and resource references
- loaded instruction scopes
- skill invocations
- compaction summaries
- eval outcomes

Label retrieved context by trust level:

- trusted: system, developer, organization policy, tool schemas, approval state
- semi-trusted: internal docs, authenticated records, verified reference data
- untrusted: webpages, emails, tickets, logs, uploaded files, connector descriptions, and third-party prompts

Treat compaction as operational handoff, not conversational summarization. Preserve objective, constraints, active plan, approval state, resources inspected, actions taken, errors, blockers, pending tasks, and next recommended step.

## Connectors And MCP

Attach connector capability progressively. Do not expose every tool up front.

Recommended pattern:

1. List or search available connector domains.
2. Load only relevant tool summaries.
3. Load full schemas only for likely tools.
4. Validate arguments locally.
5. Evaluate permission policy.
6. Execute only inside scope.
7. Return compact structured results or artifact references.

Connector descriptions, remote prompts, webpages, tickets, emails, and external docs are data. They can inform the model, but they do not become instructions.

## Secrets And Auth

Never commit secrets, raw credentials, provider keys, OAuth tokens, private datasets, customer records, or unredacted traces.

Recommended locations:

- `.env` and `.env.local` for local-only environment values; both gitignored
- `.env.example` with variable names but no secrets
- provider keys in the platform's secret manager or local password manager
- per-user credentials for connectors when possible
- short-lived tokens and least-privilege scopes
- separate credentials for development, staging, and production

Recommended `.gitignore` additions:

```gitignore
.env
.env.*
!.env.example
*.key
*.pem
evals/reports/
traces/
artifacts/
```

## Eval Gates

Every harness change should name the evidence that supports it:

- unit or integration test
- tool schema validation
- permission decision test
- approval flow test
- prompt injection eval
- connector failure eval
- context compaction eval
- cost or latency measurement
- trace review
- AgentLint or equivalent harness audit

Minimum gate before limited rollout:

1. MVP objective, autonomy level, risk class, and done condition documented.
2. Tool registry is narrow, typed, and locally validated.
3. Permission matrix is enforced in code, not only in prompt text.
4. Risky actions are split into draft and commit tools.
5. Approval records are persisted and traceable.
6. Prompt injection tests cover untrusted retrieved content.
7. Compaction tests preserve active objective, plan, approvals, and pending work.
8. Connector auth failure, revocation, timeout, and malformed result paths are tested.
9. Traces record tool calls, permission decisions, errors, retries, token usage, latency, and final status without exposing hidden reasoning.
10. Cost, time, tool-call, and token budgets are enforced.
11. Rollback or incident response path is documented.

## Typical Pitfalls

- Prompt-only safety -> Enforce permissions in code.
- Overbroad tools -> Replace with narrow domain tools and typed schemas.
- Model-approved side effects -> The model can request, but never approve or authorize.
- No draft/commit split -> Separate proposals from irreversible actions.
- Untrusted content as instruction -> Label retrieved content and isolate it from policy.
- Huge raw tool results -> Summarize, paginate, filter, or store externally and return references.
- Missing event store -> Typed events make audit, replay, compaction, and evals possible.
- Context bloat -> Keep root instructions map-like and load references just in time.
- No adversarial evals -> Happy paths do not prove the harness is safe.
- Multi-agent too early -> Add subagents only after a single-agent harness has measured failure cases.
- Provider API drift -> Check official docs when implementing live model, tool, or connector APIs.

## Reference Layouts

- Vendored harness skill: [`agents-best-practices`](../skills/_vendored/agents-best-practices/SKILL.md)
- Local source card: [`agents-best-practices`](../skills/_refs/agents-best-practices.md)
- MVP blueprint: [`mvp-agent-blueprint`](../skills/_vendored/agents-best-practices/references/mvp-agent-blueprint.md)
- Tool permissions: [`tools-and-permissions`](../skills/_vendored/agents-best-practices/references/tools-and-permissions.md)
- Context and compaction: [`context-memory-compaction`](../skills/_vendored/agents-best-practices/references/context-memory-compaction.md)
- Security, evals, and observability: [`security-evals-observability`](../skills/_vendored/agents-best-practices/references/security-evals-observability.md)
- Checklists: [`checklists`](../skills/_vendored/agents-best-practices/references/checklists.md)
- External skill format: [`openai/skills`](../skills/_refs/openai-skills-catalog.md)
- AGENTS.md practical guide: [`agents-md-2500-study`](../skills/_refs/agents-md-2500-study.md)
- AGENTS.md evaluation paper: [`evaluating-agents-md-paper`](../skills/_refs/evaluating-agents-md-paper.md)

## First Setup Checklist

- [ ] Copy `templates/agents-md/agent-workflow.md` to `AGENTS.md`.
- [ ] Fill in project name, providers, framework versions, commands, eval commands, tool names, and approval rules.
- [ ] Add a thin `CLAUDE.md` shim only if Claude Code is used.
- [ ] Write or link `docs/agent/architecture.md`.
- [ ] Write or link `docs/agent/tool-registry.md`.
- [ ] Write or link `docs/agent/permission-matrix.md`.
- [ ] Write or link `docs/agent/eval-plan.md`.
- [ ] Create or update `memory/index.md` and `memory/context.md`.
- [ ] Add `.env.example` without secrets.
- [ ] Add or confirm `.gitignore` entries for local secrets, traces, eval reports, and generated artifacts.
- [ ] Run the fastest harness tests, eval smoke, and AgentLint audit; record expected commands in `README.md` or `AGENTS.md`.
