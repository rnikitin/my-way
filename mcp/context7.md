---
name: context7
type: mcp
archetypes: [research-ml, agent-workflow]
status_by_archetype:
  research-ml: mandatory
  agent-workflow: mandatory
last_verified: 2026-05-16
registry_url: null
registry_status: not-found-2026-05-16
sources:
  - https://github.com/upstash/context7
---

# Context7

**Purpose.** Pull current library and framework documentation into the agent workflow.

**Install.** For clients that support remote MCP, use the hosted endpoint documented by Context7. For local MCP client config, follow the upstream `upstash/context7` README.

**Config.** Context7 may require an API key for higher limits. Store any key in local MCP client config or a user-level secret store, not in project files.

**When to use.** Use when APIs are likely to have changed: Mastra, AI SDKs, PyTorch ecosystem, browser tooling, or any fast-moving framework.

**When to skip.** Skip for stable standard-library questions or when the project already vendors exact docs for the library version.

**Cost.** Adds tool calls and retrieved text to context. Ask narrow doc questions.

**Conflicts.** Can conflict with repo-local docs if the project intentionally pins an older version. In that case, repo-local version constraints win.

**Known issues / when not to use.** Do not use current docs to silently upgrade a project. Surface version drift before changing code.

**References.** Upstream Context7 documentation.

