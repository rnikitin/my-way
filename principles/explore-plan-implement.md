---
name: explore-plan-implement
sources:
  - https://code.claude.com/docs/en/best-practices
  - https://developers.openai.com/cookbook/articles/codex_exec_plans
---

# Explore, Plan, Implement

**Core idea.** Separate discovery, design, execution, and closeout for non-trivial work.

**Why it matters.** Agents can move quickly in the wrong direction when they code before understanding the current system. A lightweight phase split keeps the work grounded without adding ceremony to tiny tasks.

**How to apply.** For small fixes, state the check and implement. For multi-file or risky work, inspect the codebase, write a plan, get approval when needed, execute in checkpoints, and finish with validation plus residual risks. Use ExecPlans for long-running or resumable work.

**Anti-patterns.** Planning every typo fix. Coding major architecture changes from the first prompt. Treating a plan as immutable when discovery changes the facts. Ending with a summary but no verification.

**References.** Claude Code best practices and the OpenAI ExecPlans cookbook.

