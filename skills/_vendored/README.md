# Vendored Skills

Vendored skills are copied public skills kept locally so important workflows remain available even if an upstream source moves or disappears.

## Structure

Each vendored skill directory should contain:

- `SKILL.md` copied from upstream
- `_meta.json` with source URL, upstream SHA, fetch date, license, and local notes
- `LICENSE.upstream` when the upstream repository provides one

Current vendored set:

- [agents-best-practices/](agents-best-practices/SKILL.md) - MIT-licensed provider-neutral agent harness design skill with references for tool calls, permissions, compaction, MCP/connectors, evals, observability, prompt caching, and launch gates.
- [superpowers/](superpowers/) - MIT-licensed development workflow skills.

## How To Navigate

Open a skill's `SKILL.md` when you need to run that workflow. Open `_meta.json` when checking provenance or upstream drift. Use [../../scripts/sync-check.sh](../../scripts/sync-check.sh) from the repository root to compare recorded upstream hashes.

Do not edit vendored skill content silently. If a local change is necessary, record the reason in `_meta.json` `local_notes`.

## Agents Best Practices

[`agents-best-practices`](agents-best-practices/SKILL.md) is the broadest vendored agent-harness reference in this repository. Use it when designing or auditing a project that builds agents, tool-calling workflows, MCP/external connector integrations, prompt harnesses, approval-gated automations, or long-running model-driven workers.

It is useful to `my-way` because it translates harness-engineering principles into concrete implementation surfaces:

- the model-tool-observation loop
- typed tool registries and structured tool results
- risk classes and runtime permission decisions
- draft/commit separation for risky actions
- scoped instructions, memory, retrieval, and compaction
- planning mode and measurable goal loops
- skills, MCP, external connector loading, and connector safety
- prompt-cache-aware context ordering and cost telemetry
- traces, evals, threat models, approval records, and launch gates

Keep this package as an upstream snapshot. For local interpretation and where it should feed future `my-way` docs, use [../_refs/agents-best-practices.md](../_refs/agents-best-practices.md).
