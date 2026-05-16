# Tools

Tool recommendations by project archetype, with install, config, validation, and known-issue notes.

## Structure

Each tool file explains what the tool is for, how to install or configure it, when to use it, when to skip it, and which project archetypes should treat it as mandatory, recommended, or optional.

## How To Navigate

Use the [archetype guide](../archetypes/) to decide which tools matter for a project. Then open the individual tool file only when you need exact setup, command, or caveat details. Keep the project-level `AGENTS.md` focused on commands agents actually run.

| Tool | Archetypes | Status |
|------|------------|--------|
| [uv](uv.md) | research-ml, trading-data | mandatory for Python projects |
| [pytest](pytest.md) | research-ml, trading-data | mandatory for Python tests |
| [ruff](ruff.md) | research-ml, trading-data | mandatory for Python lint/format |
| [mypy](mypy.md) | research-ml | mandatory at typed boundaries |
| [wandb](wandb.md) | research-ml | mandatory when experiment tracking is needed |
| [agentlint](agentlint.md) | all | recommended harness audit for shared or public repos |
