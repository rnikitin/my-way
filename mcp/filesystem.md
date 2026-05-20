---
name: filesystem
type: mcp
archetypes: [research-ml, trading-data, agent-workflow, docs-pm, prototype]
status_by_archetype:
  research-ml: mandatory
  trading-data: mandatory
  agent-workflow: mandatory
  docs-pm: mandatory
  prototype: mandatory
last_verified: 2026-05-16
registry_url: null
registry_status: not-found-2026-05-16
sources:
  - https://github.com/modelcontextprotocol/servers
---

# Filesystem

**Purpose.** Give agents controlled read/write access to local project files.

**Install.** Use the filesystem MCP server supported by the active client or the official MCP servers repository. Scope it to the project directory whenever possible.

**Config.** Configure allowed roots explicitly. Do not grant home-directory or disk-wide access unless the task genuinely requires it.

**When to use.** Use for file-heavy work: source inspection, local artifacts, markdown memory, experiment reports, prototype assets, screenshots, eval fixtures, traces, harness docs, and repo maps.

**When to skip.** Skip when the coding harness already provides native filesystem tools with narrower permissions.

**Cost.** Low direct cost, but broad file access can encourage unnecessary exploration.

**Conflicts.** Can conflict with sandboxed execution expectations. Make the allowed root clear in project instructions.

**Known issues / when not to use.** Never expose secret directories, browser profiles, or unrelated project roots by default.

**References.** Model Context Protocol servers repository.
