---
name: progressive-disclosure
sources:
  - https://github.blog/ai-and-ml/github-copilot/how-to-write-a-great-agents-md-lessons-from-over-2500-repositories/
  - https://developers.openai.com/codex/skills
---

# Progressive Disclosure

**Core idea.** Put a short map at the top level and load detailed guidance only when the task needs it.

**Why it matters.** Agents need enough context to choose the right workflow, but too much root context competes with the actual task. Progressive disclosure keeps startup cheap while preserving deep guidance.

**How to apply.** Make `AGENTS.md` a compact entrypoint. Link to `PROJECT_MAP.md`, `ARCHITECTURE.md`, plans, memory indexes, and skills. Give every skill a precise description so it is loaded only for the right trigger.

**Anti-patterns.** Copying every project rule into `AGENTS.md`. Hiding important workflows in unlinked docs. Writing vague skill descriptions that trigger too often. Splitting guidance so deeply that no one can find it.

**References.** GitHub's AGENTS.md guidance and Codex skills documentation.

