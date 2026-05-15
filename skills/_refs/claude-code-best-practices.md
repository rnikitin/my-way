---
name: claude-code-best-practices
source_url: https://code.claude.com/docs/en/best-practices
last_verified: 2026-05-16
copy_policy: summarize-and-link
---

# Claude Code Best Practices

Claude's official guidance emphasizes giving the agent a way to verify its work. It also recommends separating exploration, planning, implementation, and commit/closeout for non-trivial changes.

The docs explain `CLAUDE.md` placement and import behavior. In `my-way`, `CLAUDE.md` should be a thin shim with exactly one `@AGENTS.md` import, plus local ignored overrides when needed.

This reference supports the `verification`, `explore-plan-implement`, and `context-management` principles.

