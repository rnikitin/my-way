---
name: trading-data
projects-examples:
  - ~/dev/ark-algotrading
---

# Trading Data

## What This Is

Use this archetype for projects that ingest market data, build features or signals, run backtests, analyze portfolios, or prepare trading research for paper or live workflows.

Canonical local example: `~/dev/ark-algotrading`.

This archetype fits projects where correctness depends on time, data provenance, market calendars, cost assumptions, and strict separation between research, paper trading, and live trading.

## Mandatory Setup

- `AGENTS.md` from [`templates/agents-md/trading-data.md`](../templates/agents-md/trading-data.md)
- `CLAUDE.md` shim from [`templates/claude-md/trading-data.md`](../templates/claude-md/trading-data.md) when Claude Code is used
- Principle: [`instruction-minimalism`](../principles/instruction-minimalism.md)
- Principle: [`memory-hygiene`](../principles/memory-hygiene.md)
- Principle: [`verification`](../principles/verification.md)
- Principle: [`explore-plan-implement`](../principles/explore-plan-implement.md)
- Principle: [`mechanical-guardrails`](../principles/mechanical-guardrails.md)
- Principle: [`harness-audit`](../principles/harness-audit.md)
- Skill: [`superpowers/brainstorming`](../skills/_vendored/superpowers/brainstorming/SKILL.md)
- Skill: [`superpowers/writing-plans`](../skills/_vendored/superpowers/writing-plans/SKILL.md)
- Skill: [`superpowers/test-driven-development`](../skills/_vendored/superpowers/test-driven-development/SKILL.md)
- Skill: [`superpowers/systematic-debugging`](../skills/_vendored/superpowers/systematic-debugging/SKILL.md)
- Skill: [`superpowers/verification-before-completion`](../skills/_vendored/superpowers/verification-before-completion/SKILL.md)

## Recommended Setup

- Principle: [`progressive-disclosure`](../principles/progressive-disclosure.md)
- Principle: [`context-management`](../principles/context-management.md)
- Principle: [`simplicity`](../principles/simplicity.md)
- Principle: [`harness-engineering`](../principles/harness-engineering.md)
- Skill: [`superpowers/executing-plans`](../skills/_vendored/superpowers/executing-plans/SKILL.md)
- Skill: [`superpowers/subagent-driven-development`](../skills/_vendored/superpowers/subagent-driven-development/SKILL.md)
- Skill: [`superpowers/dispatching-parallel-agents`](../skills/_vendored/superpowers/dispatching-parallel-agents/SKILL.md)
- Skill: [`superpowers/using-git-worktrees`](../skills/_vendored/superpowers/using-git-worktrees/SKILL.md)
- Skill: [`mine/execplan`](../skills/mine/execplan/SKILL.md) for long-running strategy, data, or evaluation plans

## MCP Servers

Keep mandatory and recommended MCP servers to five total. Add others only when a project has a proven need and clear permission boundary.

| Status | Name | Why for this archetype |
|--------|------|------------------------|
| mandatory | [`filesystem`](../mcp/filesystem.md) | Lets agents inspect local data snapshots, reports, configs, and run artifacts without pasting them into chat. |
| recommended | [`context7`](../mcp/context7.md) | Pulls current library and broker-framework docs when APIs drift. |
| recommended | [`postgres`](../mcp/postgres.md) | Useful when market data, feature stores, orders, or results already live in Postgres. Use read-only credentials by default. |
| optional | [`chrome`](../mcp/chrome.md) | Useful for visual checks of local dashboards, reports, or broker UIs. |
| optional | [`notion`](../mcp/notion.md) | Useful only when research summaries or roadmap decisions are maintained in Notion. |

## Tools

| Status | Name | Why |
|--------|------|-----|
| mandatory | [`uv`](../tools/uv.md) | Reproducible Python environment and command runner. |
| mandatory | [`pytest`](../tools/pytest.md) | Regression tests for loaders, calendars, indicators, features, signals, and accounting. |
| mandatory | [`ruff`](../tools/ruff.md) | Fast lint and formatting checks. |
| recommended | [`mypy`](../tools/mypy.md) | Type checks for data contracts, broker adapters, configs, and portfolio/accounting boundaries. |
| recommended | [`duckdb`](../tools/duckdb.md) | Local analytical SQL over CSV, Parquet, DuckDB files, and backtest outputs. |
| optional | [`polars`](../tools/polars.md) | Fast dataframe pipelines when strict schemas and lazy execution solve real data-transform problems. |
| recommended | [`agentlint`](../tools/agentlint.md) | Cross-cutting harness audit for instruction files, validation commands, handoff state, and repo guardrails. |

## Skills

| Status | Name | Why |
|--------|------|-----|
| mandatory | `brainstorming` | Clarifies strategy, data, risk, and acceptance before implementation. |
| mandatory | `writing-plans` | Produces explicit plans for multi-step data, signal, or backtest changes. |
| mandatory | `test-driven-development` | Keeps feature and accounting behavior measurable. |
| mandatory | `systematic-debugging` | Prevents random retry loops when metrics or backtests regress. |
| mandatory | `verification-before-completion` | Forces evidence before claiming a strategy, data fix, or report is complete. |
| recommended | `executing-plans` | Helps execute existing research or pipeline plans with checkpoints. |
| recommended | `subagent-driven-development` | Useful for independent audits: data quality, leakage, costs, and reporting. |
| recommended | `dispatching-parallel-agents` | Useful when independent data sources or strategy variants can be reviewed separately. |
| recommended | `using-git-worktrees` | Keeps exploratory strategy branches isolated from stable baselines. |
| recommended | `execplan` | Better for long-running strategy plans that must survive context resets. |

## Templates

- [`templates/agents-md/trading-data.md`](../templates/agents-md/trading-data.md) - copy to `AGENTS.md` and fill project-specific placeholders.
- [`templates/claude-md/trading-data.md`](../templates/claude-md/trading-data.md) - copy to `CLAUDE.md` when using Claude Code.
- [`templates/execplan/EXECPLAN.md`](../templates/execplan/EXECPLAN.md) - use for strategy, data, backtest, and risk-control plans.

## Suggested Project Layout

Use this as a starting point, then conform to the existing project if it already has a good structure.

```text
.
├── AGENTS.md
├── CLAUDE.md
├── README.md
├── configs/
├── docs/
│   └── reports/
├── memory/
│   ├── index.md
│   ├── context.md
│   ├── feedback/
│   └── knowledge/
├── plan/
├── scripts/
├── src/<project_name>/
├── tests/
└── data/
    ├── raw/       # immutable vendor or exchange snapshots
    ├── interim/   # reproducible normalized data
    ├── features/  # derived features rebuilt from raw/interim
    └── runs/      # ignored backtest and audit outputs
```

## Memory Discipline

Keep memory focused on decisions and durable context, not raw market data or generated backtest output.

- `memory/index.md` - memory map and startup reads
- `memory/context.md` - live status board only
- `memory/feedback/` - durable corrections about how to work
- `memory/knowledge/` - permanent lessons about vendors, data quirks, metrics, and strategy assumptions
- `docs/reports/` - durable research reports, retractions, and promotion decisions

Record enough provenance that another agent can tell which data snapshot, calendar, timezone, fees, slippage, and baseline a result used.

## Secrets & Auth

Never commit secrets, broker credentials, exchange keys, paid data files, account identifiers, cookies, or raw credentials.

Recommended locations:

- `.env` and `.env.local` for local-only environment values; both gitignored
- `.env.example` with variable names but no secrets
- OS keychain, 1Password, or the broker/vendor's own CLI login for credentials when available
- Read-only database credentials for analysis and audits
- Separate credentials for paper trading and live trading

Recommended `.gitignore` additions:

```gitignore
.env
.env.*
!.env.example
*.key
*.pem
data/**/raw/private/
data/**/runs/
data/**/artifacts/
*.duckdb
*.duckdb.wal
```

## Eval Gates

Every promoted result should name its evidence type:

- data audit
- feature regression test
- single-symbol backtest
- multi-symbol backtest
- walk-forward result
- out-of-sample result
- paper result
- live result
- postmortem or retraction

Minimum gate for strategy or signal changes:

1. Data vendor, snapshot date, timezone, market calendar, and adjustment policy recorded.
2. Train/validation/test or walk-forward policy documented.
3. Lookahead, leakage, survivorship bias, and timestamp alignment checked.
4. Baseline comparison included.
5. Transaction costs, slippage, liquidity, and position limits documented.
6. Backtest accounting and portfolio constraints covered by tests or audit reports.
7. Promotion decision based on predeclared gate, not post hoc chart selection.

## Typical Pitfalls

- Lookahead by timestamp rounding -> Test that features use only information available at decision time.
- Survivorship bias -> Record universe construction and membership date policy.
- Vendor drift -> Pin snapshot dates and keep raw snapshots immutable.
- Split confusion -> Separate research, validation, out-of-sample, paper, and live evidence.
- Cost-free backtests -> Include fees, spread, slippage, and liquidity limits before claiming edge.
- Overfit signal search -> Use predeclared gates and report failed variants honestly.
- Broker side effects -> Keep live/paper order endpoints behind explicit user approval.
- Artifact sprawl -> Store heavy run outputs as ignored files and summarize durable conclusions in reports.
- Instruction bloat -> Keep root instructions compact and move detailed data policy into focused docs.

## Reference Layouts

- Local canonical: `~/dev/ark-algotrading`
- Useful local comparison: `~/dev/xlstm-predictor`
- External skill format: [`openai/skills`](../skills/_refs/openai-skills-catalog.md)
- AGENTS.md practical guide: [`agents-md-2500-study`](../skills/_refs/agents-md-2500-study.md)
- AGENTS.md evaluation paper: [`evaluating-agents-md-paper`](../skills/_refs/evaluating-agents-md-paper.md)

## First Setup Checklist

- [ ] Copy `templates/agents-md/trading-data.md` to `AGENTS.md`.
- [ ] Fill in project name, Python version, commands, vendor names, data paths, calendars, and promotion gates.
- [ ] Add a thin `CLAUDE.md` shim only if Claude Code is used.
- [ ] Create or update `memory/index.md` and `memory/context.md`.
- [ ] Add `.env.example` without secrets.
- [ ] Add or confirm `.gitignore` entries for data, run outputs, broker credentials, and DuckDB files.
- [ ] Run the fastest data-quality and backtest smoke checks and record expected output in `README.md` or `AGENTS.md`.
