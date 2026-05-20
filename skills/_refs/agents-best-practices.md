---
name: agents-best-practices
source_url: https://github.com/DenisSergeevitch/agents-best-practices
last_verified: 2026-05-18
copy_policy: vendored-mit-snapshot
license: MIT
upstream_commit: 10ab22a0d1e4a1cd372389d065c0d86f1f85ecb6
---

# Agents Best Practices

`agents-best-practices` is a portable `SKILL.md` package for designing, auditing, and explaining agent harnesses across model providers. The local copy is archived at [`../_vendored/agents-best-practices/SKILL.md`](../_vendored/agents-best-practices/SKILL.md) with its focused references under [`../_vendored/agents-best-practices/references/`](../_vendored/agents-best-practices/references/).

The upstream repository is useful because it treats an agent as a product harness, not as a single prompt. It covers the runtime loop around a model: instruction assembly, context retrieval, tool schemas, permission gates, approval pauses, execution, structured observations, state storage, compaction, evals, tracing, and rollout discipline.

## Why It Matters To My Way

`my-way` already has principles for compact instructions, harness engineering, verification, context management, and mechanical guardrails. This source gives those ideas a more operational shape for projects that build agents directly.

Use it as the primary source behind the `agent-workflow` archetype. It can also inform root `AGENTS.md` templates for projects that expose model tool calls, MCP connectors, browser automation, external communication, financial actions, security-sensitive operations, or long-running goals.

## What The Vendored Skill Contains

| Area | Upstream file | Local use |
|------|---------------|-----------|
| Entry workflow | [`SKILL.md`](../_vendored/agents-best-practices/SKILL.md) | Trigger guidance and the provider-neutral harness frame. |
| MVP blueprint | [`mvp-agent-blueprint.md`](../_vendored/agents-best-practices/references/mvp-agent-blueprint.md) | Template for the first useful agent harness in a domain. |
| Architecture | [`architecture.md`](../_vendored/agents-best-practices/references/architecture.md) | Boundaries between model, harness, tools, permissions, memory, compaction, and evals. |
| Agent loop | [`agentic-loop.md`](../_vendored/agents-best-practices/references/agentic-loop.md) | Provider-neutral model-call, tool-call, observation, retry, and stop behavior. |
| Tools and permissions | [`tools-and-permissions.md`](../_vendored/agents-best-practices/references/tools-and-permissions.md) | Risk classes, draft/commit split, typed tool contracts, and permission decisions. |
| Context and compaction | [`context-memory-compaction.md`](../_vendored/agents-best-practices/references/context-memory-compaction.md) | Context tiers, trust labels, memory categories, compaction triggers, and handoff shape. |
| Planning and goals | [`planning-and-goals.md`](../_vendored/agents-best-practices/references/planning-and-goals.md) | When to plan, when to pause for approval, and how to constrain longer goal loops. |
| Skills and connectors | [`skills-and-connectors.md`](../_vendored/agents-best-practices/references/skills-and-connectors.md) | Progressive skill loading, MCP/connector attachment, namespacing, and connector safety. |
| Provider APIs | [`provider-api-patterns.md`](../_vendored/agents-best-practices/references/provider-api-patterns.md) | OpenAI, Anthropic, and OpenAI-compatible adapter patterns without tying the architecture to one SDK. |
| Security, evals, observability | [`security-evals-observability.md`](../_vendored/agents-best-practices/references/security-evals-observability.md) | Threat model, approval records, trace fields, eval categories, and launch gates. |
| Checklists | [`checklists.md`](../_vendored/agents-best-practices/references/checklists.md) | Audit lists for MVPs, tools, permissions, context, planning, skills, connectors, evals, and prompt caching. |

## What We Can Reuse

The strongest reusable idea is the **MVP agent harness blueprint**. A project that is building agents needs more than a prompt template; it needs a concrete definition of the smallest safe harness that can do useful work. For `my-way`, this should become the core of `archetypes/agent-workflow.md`.

The next strongest piece is the **tool and permission model**. It gives practical vocabulary for risk classes such as read-only, draft-only, write-internal, external communication, financial, identity/access, process execution, destructive, and privileged admin. This can improve `AGENTS.md` templates by making risky action boundaries explicit instead of relying on vague "be careful" prose.

The **draft versus commit split** is directly reusable. Agent projects should expose tools such as `draft_email` and `send_email`, or `prepare_refund` and `issue_refund`, as separate capabilities. Draft tools can often be automatic; commit tools need approval, stronger authentication, audit records, or denial by default.

The **structured observation pattern** is also useful. Tool results should return status, summary, bounded items, evidence refs, and next valid actions instead of large raw blobs. This matches `my-way`'s mechanical-guardrail principle and helps future agents validate and recover.

The **context and compaction guidance** is stronger than generic "summarize when long" advice. It says compaction is an operational handoff: preserve objective, constraints, loaded instructions, active plan, approval state, resources inspected, actions taken, errors, blockers, pending tasks, and next step.

The **event model** is a good foundation for long-running agent projects. Rather than storing only chat messages, an agent harness should record typed events such as user message, tool call, tool result, approval request, approval result, plan update, skill invocation, memory load, context compaction, error, and final answer.

The **observability and eval sections** are useful for launch readiness. They make "agent done" measurable: trace what tool calls happened, what data was used, what state changed, who approved it, why the run stopped, and whether the final answer was grounded in evidence.

## Where It Fits Locally

Best local targets:

- `archetypes/agent-workflow.md`: make this the main applied guide for projects that build agent runtimes, tool-calling workflows, MCP connectors, prompt harnesses, or eval systems.
- `templates/agents-md/agent-workflow.md`: include only the compact project-facing instructions: commands, tool risk classes, approval policy, eval gates, and where to find harness docs.
- `principles/mechanical-guardrails.md`: borrow the risk taxonomy, draft/commit split, and validator-first posture.
- `principles/context-management.md`: borrow the compaction handoff shape and trust-label vocabulary.
- `principles/harness-audit.md`: borrow the launch gates and trace/eval checklist as deeper audit criteria.
- `skills/mine/`: consider a local derivative only if we want a smaller, opinionated `my-way` skill for agent harness design.

## How To Use It In A Real Project

For a new agent project, start with [`mvp-agent-blueprint.md`](../_vendored/agents-best-practices/references/mvp-agent-blueprint.md). Fill in the domain, primary user, job-to-be-done, input systems, output artifacts, allowed actions, forbidden actions, approval-required actions, and completion signal.

Then use [`tools-and-permissions.md`](../_vendored/agents-best-practices/references/tools-and-permissions.md) to write a small tool registry. Each tool should have a purpose, typed input schema, structured output schema, risk class, side-effect class, resource scope, permission policy, timeout, result limit, retry policy, and audit policy.

Use [`context-memory-compaction.md`](../_vendored/agents-best-practices/references/context-memory-compaction.md) when the agent has more than one turn of state, uses retrieval, loads scoped instructions, records approvals, or can pause and resume. This is especially important for long-running coding, research, support, finance, legal, and operations agents.

Use [`security-evals-observability.md`](../_vendored/agents-best-practices/references/security-evals-observability.md) before allowing state-changing actions. The minimum useful eval set should include happy paths, near misses, prompt injection attempts, tool misuse, approval bypass attempts, connector failures, compaction cases, conflicting instructions, and high-risk action attempts.

Use [`checklists.md`](../_vendored/agents-best-practices/references/checklists.md) as a review surface before launch or public release. Convert repeated checklist failures into tests, validators, templates, hooks, or policy gates instead of adding more root prompt text.

## What Not To Over-Copy

Do not paste the full upstream skill into root `AGENTS.md`. It is intentionally broad and should remain progressively disclosed.

Do not use it to justify multi-agent orchestration by default. Its local lesson is the opposite: build a single reliable harness first, then add subagents only when measured failures show decomposition is needed.

Do not treat provider API examples as timeless product docs. The architecture is durable, but OpenAI, Anthropic, MCP, and connector APIs can change. Check official docs when implementing live API calls.

Do not make AgentLint or any generic harness audit the only gate. Use it alongside project-specific evals, local checks, and domain-specific acceptance criteria.

Do not silently edit the vendored copy. If local divergence becomes necessary, record it in [`../_vendored/agents-best-practices/_meta.json`](../_vendored/agents-best-practices/_meta.json) and prefer a local derivative under `skills/mine/` for opinionated changes.

## Local Decision

Keep the full upstream markdown package vendored because it is MIT-licensed, compact enough to carry locally, and directly relevant to the `agent-workflow` archetype. Treat it as an upstream reference skill, not as the final `my-way` voice.

The local derivative is the concise `agent-workflow` archetype that turns this broad harness guidance into copyable project setup: root instructions, permission matrix, eval checklist, tool registry expectations, connector policy, and verification commands.
