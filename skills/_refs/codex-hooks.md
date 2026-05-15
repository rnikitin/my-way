---
name: codex-hooks
source_url: https://developers.openai.com/codex/hooks/
last_verified: 2026-05-16
copy_policy: summarize-and-link
---

# Codex Hooks

Codex hooks are a way to run deterministic checks around agent work. They are useful for repeated feedback that should not rely on the model remembering prose instructions.

Use hooks for checks like tests, lint, formatting, secret scans, link checks, or project-specific invariants. Keep them focused; broad auto-mutating hooks can create confusing diffs.

This reference feeds `principles/mechanical-guardrails.md`.

