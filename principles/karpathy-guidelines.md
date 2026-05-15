---
name: karpathy-guidelines
license: MIT
archival_policy: full-local-copy
sources:
  - https://github.com/multica-ai/andrej-karpathy-skills/blob/main/skills/karpathy-guidelines/SKILL.md
---

# Karpathy Guidelines

**Core idea.** Think before coding, keep the solution simple, change only what the task requires, and verify against the actual goal.

**Why it matters.** Agent failures usually come from silent assumptions, over-built abstractions, unrelated edits, or weak success criteria. These failures are expensive because they look productive while moving the codebase away from intent.

**How to apply.** Start non-trivial work by stating assumptions and success criteria. Prefer existing project patterns over new frameworks. Touch only files required for the task. Before finalizing, run the narrowest relevant check and report exactly what was verified.

**Anti-patterns.** Guessing missing requirements. Refactoring adjacent code because it looks ugly. Adding configurability before two real use cases exist. Saying "done" when no test, build, smoke check, or manual verification ran.

**References.** Karpathy-style coding guidelines and the user's copied article on the expanded 12-rule template. The upstream skill is MIT-licensed; this file keeps a local archival copy of the source guidance so the principle survives if the source URL changes.

## Archived Source Guidance

This section preserves the upstream MIT-licensed `karpathy-guidelines` skill content in local form, with light formatting normalization only.

**Tradeoff:** These guidelines bias toward caution over speed. For trivial tasks, use judgment.

## 1. Think Before Coding

**Do not assume. Do not hide confusion. Surface tradeoffs.**

Before implementing:

- State assumptions explicitly. If uncertain, ask.
- If multiple interpretations exist, present them instead of choosing silently.
- If a simpler approach exists, say so. Push back when warranted.
- If something is unclear, stop, name the confusion, and ask.

## 2. Simplicity First

**Minimum code that solves the problem. Nothing speculative.**

- No features beyond what was asked.
- No abstractions for single-use code.
- No flexibility or configurability that was not requested.
- No error handling for impossible scenarios.
- If you write 200 lines and it could be 50, rewrite it.

Ask: would a senior engineer call this overcomplicated? If yes, simplify.

## 3. Surgical Changes

**Touch only what you must. Clean up only your own mess.**

When editing existing code:

- Do not improve adjacent code, comments, or formatting.
- Do not refactor things that are not broken.
- Match existing style, even if you would do it differently.
- If you notice unrelated dead code, mention it instead of deleting it.

When your changes create orphans:

- Remove imports, variables, and functions that your changes made unused.
- Do not remove pre-existing dead code unless asked.

The test: every changed line should trace directly to the user's request.

## 4. Goal-Driven Execution

**Define success criteria. Loop until verified.**

Transform tasks into verifiable goals:

- "Add validation" becomes "write tests for invalid inputs, then make them pass."
- "Fix the bug" becomes "write a test that reproduces it, then make it pass."
- "Refactor X" becomes "ensure tests pass before and after."

For multi-step tasks, state a brief plan:

```text
1. [Step] -> verify: [check]
2. [Step] -> verify: [check]
3. [Step] -> verify: [check]
```

Strong success criteria let an agent loop independently. Weak criteria like "make it work" require constant clarification.
