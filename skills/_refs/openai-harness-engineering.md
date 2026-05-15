---
name: openai-harness-engineering
source_url: https://openai.com/index/harness-engineering/
last_verified: 2026-05-16
copy_policy: local-distillation-only
---

# OpenAI Harness Engineering

OpenAI's harness-engineering article argues that prompts are only one part of agent performance. The repository, app surface, logs, tests, metrics, and mechanical constraints make up the real operating environment.

Important local takeaways: keep `AGENTS.md` short and map-like; store durable knowledge in repo files; make logs and app state readable to agents; encode repeated review feedback into tests, hooks, schema checks, or linters; remove stale context that creates entropy.

This source drives [`../../principles/harness-engineering.md`](../../principles/harness-engineering.md), [`../../principles/mechanical-guardrails.md`](../../principles/mechanical-guardrails.md), and the plan to keep archetypes linked instead of stuffing every rule into root instructions.

