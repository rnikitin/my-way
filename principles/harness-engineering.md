---
name: harness-engineering
sources:
  - https://openai.com/index/harness-engineering/
---

# Harness Engineering

**Core idea.** The harness is the whole environment that lets agents do correct work: repo-local knowledge, tests, app observability, logs, guardrails, and cleanup loops.

**Why it matters.** Good prompts help, but the agent still needs the project to expose truth. A repo with clear maps, runnable checks, readable logs, and explicit invariants lets agents recover from ambiguity without inventing context.

**How to apply.** Keep `AGENTS.md` short and map-like. Move durable knowledge into versioned docs with stable names. Make app behavior inspectable through logs, metrics, screenshots, snapshots, or CLI output. Turn repeated review feedback into mechanical checks where possible.

**Anti-patterns.** Treating the prompt as the only harness. Hiding product or architecture decisions in chat history. Leaving logs unreadable to humans and agents. Keeping stale docs because removing them feels risky.

**References.** OpenAI Harness Engineering.

