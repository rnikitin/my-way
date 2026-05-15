---
name: context-management
sources:
  - https://code.claude.com/docs/en/best-practices
  - https://openai.com/index/harness-engineering/
---

# Context Management

**Core idea.** Treat context as scarce and reset or split work when it stops helping the current task.

**Why it matters.** Long sessions accumulate stale assumptions, rejected ideas, huge logs, and unrelated files. Agents can then optimize against old context instead of the current request.

**How to apply.** Use a fresh session or explicit summary for unrelated work. Keep active plans current. Compact long investigations into durable notes. Use separate agents or separate passes for read-heavy side research when the platform supports it.

**Anti-patterns.** Kitchen-sink sessions that mix debugging, planning, refactoring, and product decisions. Re-reading giant logs instead of summarizing the useful state. Carrying stale rejected approaches into new implementation.

**References.** Claude Code best practices and OpenAI Harness Engineering.

