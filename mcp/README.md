# MCP Catalog

Curated Model Context Protocol server notes by archetype. The official MCP registry is the source of truth; this directory adds usage guidance and local fit.

## Structure

Each file describes one MCP server: purpose, install/config notes, when to use it, when to skip it, cost, conflicts, known issues, and references. The frontmatter records archetype fit and whether the entry is mandatory, recommended, or optional.

## How To Navigate

Start from an [archetype](../archetypes/) first. Use this catalog only after the archetype says an MCP server is relevant, or when a project already has a concrete integration need. Do not add MCP servers just because they exist; each server increases configuration, permissions, and context surface.

| MCP | Archetypes | Status | Registry status |
|-----|------------|--------|-----------------|
| [context7](context7.md) | research-ml, trading-data, agent-workflow, prototype | mandatory for docs-heavy framework work; recommended for trading-data API drift; optional for prototype framework drift | not-found-2026-05-16 |
| [filesystem](filesystem.md) | research-ml, trading-data, agent-workflow, docs-pm, prototype | mandatory when local files are the working surface | not-found-2026-05-16 |
| [chrome](chrome.md) | research-ml, trading-data, prototype, agent-workflow | recommended for browser/app verification; optional for trading dashboards | not-found-2026-05-16 |
| [postgres](postgres.md) | research-ml, trading-data, agent-workflow | recommended for trading-data; optional elsewhere when the project already has Postgres | not-found-2026-05-16 |
| [notion](notion.md) | docs-pm, research-ml, trading-data, agent-workflow, prototype | recommended for PM/wiki sync; optional for trading research summaries, prototype feedback, and policy/knowledge bases | not-found-2026-05-16 |
