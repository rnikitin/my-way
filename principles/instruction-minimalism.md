---
name: instruction-minimalism
sources:
  - https://arxiv.org/abs/2602.11988
  - https://developers.openai.com/codex/guides/agents-md/
---

# Instruction Minimalism

**Core idea.** Root agent files should contain only non-derivable, actionable constraints that prevent real mistakes.

**Why it matters.** Extra instructions are not free. They consume context, encourage broad exploration, and can push agents into unnecessary work. A compact hand-curated file usually beats a long generated policy dump.

**How to apply.** Before adding a line to `AGENTS.md` or `CLAUDE.md`, ask whether the agent can infer it from package files, tests, docs, or code. Keep commands exact, boundaries explicit, and project-specific invariants visible. Put detailed workflows in linked docs or skills.

**Anti-patterns.** LLM-generating a giant `AGENTS.md`. Repeating generic advice like "be careful." Listing tools without flags or success conditions. Mixing personal preferences, architecture rules, and stale project history in one root file.

**References.** Evaluating AGENTS.md and Codex AGENTS.md guidance.

