# Archetypes

Archetypes are the starting point for applying this repository to a real project. Each archetype combines the relevant principles, templates, MCP servers, tools, and skills into one project-type guide.

## Structure

Each archetype file should contain:

- what kind of project it fits
- mandatory and recommended setup
- MCP server and tool tables
- skills to enable or keep nearby
- templates to copy
- secrets, evaluation gates, pitfalls, and reference layouts

## Available Archetypes

| Archetype | Status | Start here when |
|-----------|--------|-----------------|
| [research-ml](research-ml.md) | complete proof of concept | The project has experiments, model evaluation, notebooks, datasets, or research phases. |
| `trading-data` | planned | The project works with market data, backtests, signals, live trading, or data quality gates. |
| `agent-workflow` | planned | The project builds agents, prompts, tool calls, workflows, or model evaluation harnesses. |
| `docs-pm` | planned | The project is mostly product specs, program reporting, docs, roadmaps, or decision tracking. |
| `prototype` | planned | The project is a lightweight app, game, demo, or exploratory product surface. |

## How To Use

1. Pick the closest archetype.
2. Copy the listed `AGENTS.md` template from [../templates/agents-md/](../templates/agents-md/).
3. Add only the project-specific facts that the agent cannot infer from code.
4. Follow links from the archetype into [../principles/](../principles/), [../mcp/](../mcp/), [../tools/](../tools/), and [../skills/](../skills/) when you need detail.

If no archetype fits cleanly, start from [research-ml](research-ml.md) for file shape and delete everything that is not true for the target project.

