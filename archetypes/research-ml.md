---
name: research-ml
projects-examples:
  - ~/dev/xlstm-predictor
---

# Research ML

## What This Is

Use this archetype for machine learning research projects where iteration, experiment tracking, reproducibility, and evidence quality matter more than feature velocity.

Canonical local example: `~/dev/xlstm-predictor`.

This archetype fits projects with changing hypotheses, many experiments, long-running jobs, notebooks, local artifacts, and promotion gates that must distinguish real signal from leakage, bias, or overfit.

## Mandatory Setup

- `AGENTS.md` from [`templates/agents-md/research-ml.md`](../templates/agents-md/research-ml.md)
- `CLAUDE.md` shim from [`templates/claude-md/research-ml.md`](../templates/claude-md/research-ml.md) when Claude Code is used
- Principle: [`instruction-minimalism`](../principles/instruction-minimalism.md)
- Principle: [`memory-hygiene`](../principles/memory-hygiene.md)
- Principle: [`verification`](../principles/verification.md)
- Principle: [`explore-plan-implement`](../principles/explore-plan-implement.md)
- Skill: [`superpowers/brainstorming`](../skills/_vendored/superpowers/brainstorming/SKILL.md)
- Skill: [`superpowers/writing-plans`](../skills/_vendored/superpowers/writing-plans/SKILL.md)
- Skill: [`superpowers/test-driven-development`](../skills/_vendored/superpowers/test-driven-development/SKILL.md)
- Skill: [`superpowers/systematic-debugging`](../skills/_vendored/superpowers/systematic-debugging/SKILL.md)
- Skill: [`superpowers/verification-before-completion`](../skills/_vendored/superpowers/verification-before-completion/SKILL.md)

## Recommended Setup

- Principle: [`progressive-disclosure`](../principles/progressive-disclosure.md)
- Principle: [`context-management`](../principles/context-management.md)
- Principle: [`mechanical-guardrails`](../principles/mechanical-guardrails.md)
- Skill: [`superpowers/executing-plans`](../skills/_vendored/superpowers/executing-plans/SKILL.md)
- Skill: [`superpowers/subagent-driven-development`](../skills/_vendored/superpowers/subagent-driven-development/SKILL.md)
- Skill: [`superpowers/dispatching-parallel-agents`](../skills/_vendored/superpowers/dispatching-parallel-agents/SKILL.md)
- Skill: [`superpowers/using-git-worktrees`](../skills/_vendored/superpowers/using-git-worktrees/SKILL.md)
- Skill: [`superpowers/finishing-a-development-branch`](../skills/_vendored/superpowers/finishing-a-development-branch/SKILL.md)
- Skill: [`mine/execplan`](../skills/mine/execplan/SKILL.md) for long-running or resumable plans

## MCP Servers

Keep mandatory and recommended MCP servers to five total. Add others only when a project has a proven need.

| Status | Name | Why for this archetype |
|--------|------|------------------------|
| mandatory | [`context7`](../mcp/context7.md) | Pulls current framework and library docs without relying on stale model memory. |
| mandatory | [`filesystem`](../mcp/filesystem.md) | Lets agents read local datasets, artifacts, and experiment files without broad context dumps. |
| recommended | [`chrome`](../mcp/chrome.md) | Useful for visual checks of notebooks, dashboards, plots, and local reports. |
| recommended | [`notion`](../mcp/notion.md) | Useful for syncing polished research writeups or PM-facing summaries. |
| optional | [`postgres`](../mcp/postgres.md) | Use only when experiment metadata, feature stores, or evaluation results already live in Postgres. Do not introduce it for artifact storage. |

## Tools

| Status | Name | Why |
|--------|------|-----|
| mandatory | [`uv`](../tools/uv.md) | Fast, reproducible Python environment and dependency management. |
| mandatory | [`pytest`](../tools/pytest.md) | Unit and integration checks for data transforms, losses, and evaluation gates. |
| mandatory | [`ruff`](../tools/ruff.md) | Fast lint and formatting checks. |
| mandatory | [`mypy`](../tools/mypy.md) | Type checks for boundaries that must stay stable. |
| mandatory | [`wandb`](../tools/wandb.md) | Experiment tracking when runs need metrics, configs, and comparisons. Artifacts remain file-backed by default. |
| optional | `marimo` | Notebook-style exploratory UI with more reproducible execution than ad hoc notebooks. |
| optional | `polars` | Fast dataframe work for feature engineering and offline audits. |
| optional | `duckdb` | Local analytical queries over CSV, Parquet, and experiment outputs. |
| optional | [`agentlint`](../tools/agentlint.md) | Harness audit for instruction files and repo guardrails. |

## Skills

| Status | Name | Why |
|--------|------|-----|
| mandatory | `brainstorming` | Clarifies hypothesis, scope, and acceptance before implementation. |
| mandatory | `writing-plans` | Produces explicit, reviewable plans for multi-step experiments and refactors. |
| mandatory | `test-driven-development` | Keeps measurable behavior in front of implementation details. |
| mandatory | `systematic-debugging` | Prevents random retries when metrics or tests regress. |
| mandatory | `verification-before-completion` | Forces evidence before claiming completion. |
| recommended | `executing-plans` | Helps execute existing plans step-by-step with checkpoints. |
| recommended | `subagent-driven-development` | Useful when independent experiment audits can run in parallel. |
| recommended | `using-git-worktrees` | Keeps exploratory changes isolated from active work. |
| recommended | `finishing-a-development-branch` | Standardizes validation and closeout. |
| recommended | `execplan` | Better for long-running research plans that must survive context resets. |

## Templates

- [`templates/agents-md/research-ml.md`](../templates/agents-md/research-ml.md) - copy to `AGENTS.md` and fill project-specific placeholders.
- [`templates/claude-md/research-ml.md`](../templates/claude-md/research-ml.md) - copy to `CLAUDE.md` when using Claude Code.
- [`templates/execplan/EXECPLAN.md`](../templates/execplan/EXECPLAN.md) - use for long-running experiment plans, phase plans, and architecture changes.

## Suggested Project Layout

Use this as a starting point, then conform to the existing project if it already has a good structure.

```text
.
├── AGENTS.md
├── CLAUDE.md
├── README.md
├── docs/
│   ├── agent/
│   │   ├── engineering-protocol.md
│   │   ├── memory-protocol.md
│   │   └── research-integrity.md
│   ├── phase_registry.md
│   └── reports/
├── plan/
│   ├── README.md
│   └── YYYY-MM-DD-or-phase-name.md
├── memory/
│   ├── index.md
│   ├── context.md
│   ├── feedback/
│   └── knowledge/
├── src/<project_name>/
├── tests/
├── notebooks/
├── scripts/
└── data/
    ├── raw/        # never mutate in place
    ├── interim/    # reproducible derived data
    └── artifacts/  # local or ignored run outputs
```

## Memory Discipline

Use a routing index so the agent knows where to look first:

- `memory/index.md` - memory map and startup reads
- `memory/context.md` - live status board only
- `memory/feedback/` - durable corrections about how to work
- `memory/knowledge/` - permanent research and technical lessons
- `docs/phase_registry.md` - source of truth for active, frozen, skipped, and completed phases

Keep raw run artifacts out of memory. Store them as ignored files under `data/artifacts/` or `data/runs/` by default. External artifact stores are opt-in, not the baseline.

## Secrets & Auth

Never commit secrets or raw credentials.

Recommended locations:

- `.env` and `.env.local` for local-only environment values; both gitignored
- `wandb login` for W&B credentials when W&B is used for metrics or run comparison
- Postgres credentials in environment variables or a local secret manager only for projects that already use Postgres
- Claude Code credentials in the tool's own local config
- Notion OAuth through the relevant MCP or app connector

Recommended `.gitignore` additions:

```gitignore
.env
.env.*
!.env.example
*.key
*.pem
wandb/
.aim/
data/**/artifacts/
data/**/runs/
```

## Eval Gates

Every promoted result should name its evidence type:

- hypothesis
- implementation result
- unit/integration test result
- single-split validation result
- holdout result
- leak-checked result
- multi-seed result
- paper or forward result
- production or live result

Minimum gate for model changes:

1. Dataset version or data snapshot recorded.
2. Train/validation/test or holdout policy documented.
3. Random seed or seed set documented.
4. Baseline comparison included.
5. Leakage, lookahead, and target-construction checks addressed.
6. Metrics and config saved in local JSON/CSV, W&B, or a phase report; artifacts saved as ignored files unless the project explicitly chooses external storage.
7. Promotion decision based on validation or predeclared gate, not post hoc test selection.

## Typical Pitfalls

- LLM-generated `AGENTS.md` -> Hand-curate from the template and delete generic filler.
- Instruction bloat -> Remove any rule inferable from code, package files, tests, or existing docs.
- Vague persona -> State the project domain, stack versions, and one concrete local pattern instead.
- Missing version specificity -> Name Python, CUDA, PyTorch, and major library versions when they affect behavior.
- Kitchen-sink session -> Reset or compact between exploration, implementation, and writeup.
- Trust-then-verify gap -> Every model change ships with an explicit holdout or reproducibility check.
- Beautiful metric trap -> Treat unusually strong metrics as suspicious until leakage, bias, and baseline checks pass.
- Artifact sprawl -> Keep ignored run outputs out of durable memory and summarize only durable findings.
- Test-only confidence -> Passing unit tests do not prove research validity; promotion gates still apply.

## Reference Layouts

- Local canonical: `~/dev/xlstm-predictor`
- Useful local comparison: `~/dev/ark-algotrading`
- External skill format: [`openai/skills`](../skills/_refs/openai-skills-catalog.md)
- AGENTS.md practical guide: [`agents-md-2500-study`](../skills/_refs/agents-md-2500-study.md)
- AGENTS.md evaluation paper: [`evaluating-agents-md-paper`](../skills/_refs/evaluating-agents-md-paper.md)

## First Setup Checklist

- [ ] Copy `templates/agents-md/research-ml.md` to `AGENTS.md`.
- [ ] Fill in project name, Python version, CUDA version, commands, data rules, and promotion gates.
- [ ] Add a thin `CLAUDE.md` shim only if Claude Code is used.
- [ ] Create or update `memory/index.md` and `memory/context.md`.
- [ ] Create or update a phase registry if the project has multiple research phases.
- [ ] Add `.env.example` without secrets.
- [ ] Run the first verification command and record expected output in `README.md` or `AGENTS.md`.
