---
name: agentlint
type: tool
archetypes: [research-ml, trading-data, agent-workflow, docs-pm, prototype]
status_by_archetype:
  research-ml: optional
  trading-data: optional
  agent-workflow: optional
  docs-pm: optional
  prototype: optional
last_verified: 2026-05-16
sources:
  - https://www.agentlint.app/
---

# AgentLint

**Purpose.** Audit agent instruction files and harness guardrails.

**Install.** Follow the current AgentLint instructions from the official site.

**Config.** Treat it as an external audit. Do not make it the only source of truth for local project policy.

**When to use.** Use during repo setup, before public release, or when instruction files drift across tools.

**When to skip.** Skip in Phase A acceptance and in offline environments. The repo should remain useful without it.

**Cost.** Third-party dependency and possible network usage.

**Conflicts.** Its recommendations may be generic. Local project constraints win when there is a clear reason.

**Known issues / when not to use.** Do not blindly apply generated recommendations. Review changes manually.

**References.** AgentLint website.

