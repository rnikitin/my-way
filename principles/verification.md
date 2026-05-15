---
name: verification
sources:
  - https://code.claude.com/docs/en/best-practices
  - https://developers.openai.com/codex/hooks/
---

# Verification

**Core idea.** Every meaningful change needs a verification path the agent can run or explain precisely.

**Why it matters.** "Looks right" is weak evidence. Agents can produce plausible code and plausible summaries while missing the user-visible failure. Verification turns the task from prose into an observable contract.

**How to apply.** Define the check before implementation when possible. For code, prefer a failing test or a narrow reproduction first. For docs, run link checks or grep for stale terms. For UI, run a browser smoke check or capture screenshots when visual behavior matters.

**Anti-patterns.** Claiming tests passed when they were not run. Treating lint success as product success. Writing shallow tests that only encode the implementation. Skipping edge cases named by the user.

**References.** Claude Code best practices and Codex hooks.

