---
name: agentlint
type: tool
archetypes: [research-ml, trading-data, agent-workflow, docs-pm, prototype]
status_by_archetype:
  research-ml: recommended
  trading-data: recommended
  agent-workflow: recommended
  docs-pm: recommended
  prototype: recommended
last_verified: 2026-05-17
sources:
  - https://www.agentlint.app/
---

# AgentLint

**Purpose.** Audit agent instruction files, validation commands, continuity files, safety posture, and harness guardrails.

**Install.** Use `npx -y -p agentlint-ai agentlint check --project-dir . --format terminal` for ad hoc runs, or follow the current AgentLint instructions from the official site for a persistent install.

**Config.** Treat it as an external audit. Do not make it the only source of truth for local project policy. Generated reports should usually go under ignored local artifacts such as `.context/agentlint/`.

**When to use.** Use during repo setup, before public release, before serious PR/release work, and whenever `AGENTS.md`, `CLAUDE.md`, `.cursor/rules`, skills, hooks, workflows, validation commands, `HANDOFF.md`, or security files change.

**When to skip.** Skip in offline environments, very small private throwaway experiments, or emergency patches where a targeted test is more important than a full harness audit.

**Cost.** Third-party dependency and possible network usage.

**Conflicts.** Its recommendations may be generic. Local project constraints win when there is a clear reason.

**Known issues / when not to use.** Do not blindly apply generated recommendations. Fix concrete misses, but document deliberate tradeoffs for generic findings such as CI policy, test-required gates, or public git-history email.

**References.** AgentLint website.
