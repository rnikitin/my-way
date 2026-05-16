# My Way

My Way is a reusable operating guide for AI-assisted software projects. It collects the project instructions, memory conventions, skills, MCP/tool choices, and verification habits that should be easy to apply across different repositories without rebuilding the same setup by hand.

The repository is intentionally documentation-first. It does not install anything into a project automatically yet; the first useful workflow is to link or copy the right template, then keep project-specific details inside the target repository.

## What Is Inside

| Area | Purpose |
|------|---------|
| [AGENTS.md](AGENTS.md) | Instructions for agents working on this repository itself. |
| [archetypes/](archetypes/) | Project-type guides that say which principles, tools, MCP servers, skills, and templates to use. |
| [principles/](principles/) | Short reusable rules for agent work: memory, verification, instruction minimalism, harness design, context management, and simplicity. |
| [templates/](templates/) | Starter files for `AGENTS.md`, thin `CLAUDE.md` shims, and long-running execution plans. |
| [skills/](skills/) | Vendored public skills, original local skills such as `frontend-design`, and reference notes for sources that should not be copied wholesale. |
| [mcp/](mcp/) | Curated MCP server notes with archetype fit, config guidance, and when to skip each server. |
| [tools/](tools/) | Tool notes for the practical checks agents should run: test, lint, type check, sync check, and audit tools. |
| [scripts/](scripts/) | Maintenance scripts for this repository, including vendored skill sync checks. |
| [HANDOFF.md](HANDOFF.md) | Current repo status, next work, validation conditions, and known audit findings. |
| [SECURITY.md](SECURITY.md) | Security reporting and maintainer expectations. |

## Quick Start

1. Pick the closest project type in [archetypes/](archetypes/).
2. Copy the matching file from [templates/agents-md/](templates/agents-md/) into the target project as `AGENTS.md`.
3. If Claude Code is used, add the matching [templates/claude-md/](templates/claude-md/) shim as `CLAUDE.md`.
4. Add only the project-specific details that are not obvious from code: commands, test gates, data rules, safety boundaries, and local navigation.
5. Link deeper guidance from this repo instead of pasting long instructions into every project.

## Navigation Model

Start with an archetype, because it is the only place that combines the rest of the repository into an applied setup. From there, move to templates for files to copy, principles for durable behavior, tools/MCP entries for runtime choices, and skills for reusable agent workflows.

Example for a research ML project:

```bash
cp ~/dev/my-way/templates/agents-md/research-ml.md ./AGENTS.md
cp ~/dev/my-way/templates/claude-md/research-ml.md ./CLAUDE.md
```

Then fill in the placeholders for the project name, Python/CUDA versions, commands, data rules, and promotion gates.

## Current Status

The first complete proof of concept is [research-ml](archetypes/research-ml.md), based on the patterns found in local research and trading projects. The remaining intended archetypes are:

- `trading-data`
- `agent-workflow`
- `docs-pm`
- `prototype`

Until those are written, use the research-ml archetype as the reference for file shape and depth.

## Design Rules

- Keep root agent instructions short. `AGENTS.md` should be a practical map, not a handbook.
- Store durable memory in versioned project files, not in chat history.
- Prefer file-backed artifacts by default; add databases or external stores only when the project already needs them.
- Standardize reusable behavior as `SKILL.md` files with source metadata.
- Turn repeated feedback into checks, hooks, tests, or templates instead of longer prose.
- Require verification evidence before claiming a task is complete.

## Maintenance

Run these from the repository root when changing references, vendored skills, or public docs:

```bash
make test
```

For a full markdown link check:

```bash
make link-check
```

For an optional harness audit:

```bash
npx -y -p agentlint-ai agentlint check --project-dir . --format terminal
```

## Source Policy

Open-licensed reusable skills and guidelines may be archived locally with provenance metadata. Copyrighted articles and product documentation should be represented as short local distillations with links to the source.
