---
name: postgres
type: mcp
archetypes: [research-ml, trading-data, agent-workflow]
status_by_archetype:
  research-ml: optional
  trading-data: recommended
  agent-workflow: optional
last_verified: 2026-05-16
registry_url: null
registry_status: not-found-2026-05-16
sources:
  - https://github.com/modelcontextprotocol/servers
  - https://www.postgresql.org/docs/
---

# Postgres

**Purpose.** Let agents inspect and query Postgres-backed project data with controlled permissions.

**Install.** Use the Postgres MCP server supported by the active client or the official MCP servers repository. Prefer read-only credentials for research and analysis.

**Config.** Store connection strings in local secret storage or ignored environment files. Never commit database URLs, passwords, cookies, or tokens.

**When to use.** Use for analytics tables, feature stores, reporting queries, schema inspection, or experiment metadata that already lives in Postgres.

**When to skip.** Skip when local fixture files, saved query outputs, or file-backed artifacts answer the question. Do not add Postgres just to store research artifacts, and do not connect production data by default.

**Cost.** Queries can be expensive. Always use explicit limits and time windows for exploratory work.

**Conflicts.** Direct database MCP can bypass app-level authorization. Use least-privilege accounts.

**Known issues / when not to use.** Avoid write access unless the task is explicitly a migration or data repair with rollback plan.

**References.** Model Context Protocol servers repository and PostgreSQL documentation.
