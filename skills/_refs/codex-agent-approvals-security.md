---
name: codex-agent-approvals-security
source_url: https://developers.openai.com/codex/agent-approvals-security/
last_verified: 2026-05-16
copy_policy: summarize-and-link
---

# Codex Agent Approvals And Security

Codex approval and security guidance is the reference for deciding which operations require explicit user approval and which can run inside a normal agent loop.

For `my-way`, the practical split is: safe reads and narrow checks can run freely; destructive file operations, credential access, production changes, migrations, and external side effects need explicit scope or approval.

This reference supports `principles/mechanical-guardrails.md` and the "ask first / never do" sections in `AGENTS.md` templates.

