---
name: mechanical-guardrails
sources:
  - https://openai.com/index/harness-engineering/
  - https://developers.openai.com/codex/hooks/
  - https://developers.openai.com/codex/agent-approvals-security/
---

# Mechanical Guardrails

**Core idea.** Repeated feedback should become a deterministic check, not a longer instruction.

**Why it matters.** Prose compliance is probabilistic. Hooks, tests, linters, schemas, approval policies, and secret scans run the same way every time and catch failures before they become review comments.

**How to apply.** Promote repeated mistakes into automation: link checks for docs, schema checks for structured files, type checks for shared contracts, visual smoke tests for UI, secret scanners for public repos, and approval gates for destructive commands.

**Anti-patterns.** Adding another paragraph to `AGENTS.md` for every mistake. Letting hooks mutate broad code without review. Blocking all work behind heavyweight gates. Treating mechanical checks as a substitute for human judgment on product intent.

**References.** OpenAI Harness Engineering, Codex hooks, and Codex approval/security guidance.

