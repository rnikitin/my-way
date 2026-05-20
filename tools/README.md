# Tools

Tool recommendations by project archetype, with install, config, validation, and known-issue notes.

## Structure

Each tool file explains what the tool is for, how to install or configure it, when to use it, when to skip it, and which project archetypes should treat it as mandatory, recommended, or optional.

## How To Navigate

Use the [archetype guide](../archetypes/) to decide which tools matter for a project. Then open the individual tool file only when you need exact setup, command, or caveat details. Keep the project-level `AGENTS.md` focused on commands agents actually run.

| Tool | Archetypes | Status |
|------|------------|--------|
| [uv](uv.md) | research-ml, trading-data, agent-workflow | mandatory for Python projects; optional for Python-based agent harnesses |
| [pytest](pytest.md) | research-ml, trading-data, agent-workflow | mandatory for Python tests; optional for Python-based harness evals |
| [ruff](ruff.md) | research-ml, trading-data, agent-workflow | mandatory for Python lint/format; optional for Python-based harnesses |
| [mypy](mypy.md) | research-ml, trading-data, agent-workflow | mandatory for research-ml; recommended at typed data or tool-contract boundaries |
| [wandb](wandb.md) | research-ml | mandatory when experiment tracking is needed |
| [duckdb](duckdb.md) | research-ml, trading-data | recommended for local analytical SQL in trading-data; optional for research-ml |
| [polars](polars.md) | research-ml, trading-data | optional fast dataframe engine for schema-heavy data pipelines |
| [agentlint](agentlint.md) | all, especially agent-workflow | recommended harness audit for shared or public repos |
| [markdown-link-check](markdown-link-check.md) | docs-pm | mandatory link checker for docs-first and reference-heavy projects |
