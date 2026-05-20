# Templates

Reusable project files and skeletons for agent instructions, Claude shims, and execution plans.

## Structure

Templates are grouped by the file they produce:

- [agents-md/](agents-md/) - canonical `AGENTS.md` files by archetype.
- [claude-md/](claude-md/) - thin `CLAUDE.md` shims that import `AGENTS.md`.
- [execplan/](execplan/) - self-contained execution plan skeletons.

## How To Navigate

Start with the [archetype guide](../archetypes/) to choose the right template. Copy a template into the target project, then delete anything that is not true locally and fill in commands, versions, paths, and boundaries. Use [../principles/instruction-minimalism.md](../principles/instruction-minimalism.md) as the cleanup rule.

| Template | Use |
|----------|-----|
| [agents-md/research-ml.md](agents-md/research-ml.md) | Starting point for `AGENTS.md` in ML research projects. |
| [agents-md/trading-data.md](agents-md/trading-data.md) | Starting point for `AGENTS.md` in trading, market-data, and backtesting projects. |
| [agents-md/agent-workflow.md](agents-md/agent-workflow.md) | Starting point for `AGENTS.md` in agent harness, tool-calling, connector, and eval projects. |
| [agents-md/docs-pm.md](agents-md/docs-pm.md) | Starting point for `AGENTS.md` in docs, PM, program reporting, and decision-tracking projects. |
| [agents-md/prototype.md](agents-md/prototype.md) | Starting point for `AGENTS.md` in lightweight app, game, demo, and exploratory prototype projects. |
| [claude-md/research-ml.md](claude-md/research-ml.md) | Thin `CLAUDE.md` shim that imports `AGENTS.md` exactly once. |
| [claude-md/trading-data.md](claude-md/trading-data.md) | Thin `CLAUDE.md` shim for trading-data projects. |
| [claude-md/agent-workflow.md](claude-md/agent-workflow.md) | Thin `CLAUDE.md` shim for agent-workflow projects. |
| [claude-md/docs-pm.md](claude-md/docs-pm.md) | Thin `CLAUDE.md` shim for docs-pm projects. |
| [claude-md/prototype.md](claude-md/prototype.md) | Thin `CLAUDE.md` shim for prototype projects. |
| [execplan/EXECPLAN.md](execplan/EXECPLAN.md) | Self-contained plan skeleton for long-running work. |
