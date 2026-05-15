---
name: memory-hygiene
sources:
  - https://openai.com/index/harness-engineering/
  - https://developers.openai.com/codex/guides/agents-md/
---

# Memory Hygiene

**Core idea.** Durable project memory belongs in versioned, indexed files with clear ownership and update rules.

**Why it matters.** Chat memory is hard to audit, easy to lose, and often invisible to the next tool. Repo-local memory lets agents and humans share the same source of truth across sessions.

**How to apply.** Use a short index such as `memory/index.md` or `PROJECT_MAP.md`. Keep live status in a separate `context.md` or active plan. Store durable feedback in `feedback/`, durable technical lessons in `knowledge/`, and project evidence near the project or epic it supports.

**Anti-patterns.** Saving every conversation. Duplicating facts across many files. Putting secrets or sensitive personal data in memory. Letting live status boards become long session logs.

**References.** OpenAI Harness Engineering, Codex AGENTS.md guidance, and the user's `ark-algotrading` memory protocol.

