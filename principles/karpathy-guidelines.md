---
name: karpathy-guidelines
sources:
  - https://github.com/multica-ai/andrej-karpathy-skills/blob/main/skills/karpathy-guidelines/SKILL.md
---

# Karpathy Guidelines

**Core idea.** Think before coding, keep the solution simple, change only what the task requires, and verify against the actual goal.

**Why it matters.** Agent failures usually come from silent assumptions, over-built abstractions, unrelated edits, or weak success criteria. These failures are expensive because they look productive while moving the codebase away from intent.

**How to apply.** Start non-trivial work by stating assumptions and success criteria. Prefer existing project patterns over new frameworks. Touch only files required for the task. Before finalizing, run the narrowest relevant check and report exactly what was verified.

**Anti-patterns.** Guessing missing requirements. Refactoring adjacent code because it looks ugly. Adding configurability before two real use cases exist. Saying "done" when no test, build, smoke check, or manual verification ran.

**References.** Karpathy-style coding guidelines and the user's copied article on the expanded 12-rule template.

