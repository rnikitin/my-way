---
name: simplicity
sources:
  - https://github.com/multica-ai/andrej-karpathy-skills/blob/main/skills/karpathy-guidelines/SKILL.md
  - https://simonwillison.net/2026/Feb/23/agentic-engineering-patterns/
---

# Simplicity

**Core idea.** Choose the smallest change that produces the required observable behavior.

**Why it matters.** Agents are good at generating code quickly, so the limiting factor is no longer typing speed. The limiting factor is keeping the codebase understandable, testable, and aligned with the real problem.

**How to apply.** Reuse the local pattern first. Add an abstraction only when it removes real duplication or clarifies a stable boundary. Keep file, function, and module ownership narrow enough that a future agent can inspect it quickly.

**Anti-patterns.** Building a framework for one use case. Adding options because they might be useful later. Splitting code by technical fashion instead of responsibility. Treating cleverness as quality.

**References.** Karpathy-style simplicity guidance and Simon Willison's agentic engineering patterns.

