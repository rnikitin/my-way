---
name: harness-audit
sources:
  - https://www.agentlint.app/
  - https://openai.com/index/harness-engineering/
  - https://developers.openai.com/codex/guides/agents-md/
---

# Harness Audit

**Core idea.** Audit the agent harness as a first-class project surface, not only the application code.

**Why it matters.** Agent productivity depends on entry files, commands, safety boundaries, handoff state, CI, secret handling, and verification paths. These files drift quietly because they are mostly prose. A harness audit catches missing `AGENTS.md`, stale command guidance, absent handoff conditions, unsafe secret posture, and duplicated or weak tool-specific instructions before agents repeat the same mistakes.

**How to apply.** Use AgentLint or an equivalent harness audit as a regular check for any shared repository. The default command is:

```bash
npx -y -p agentlint-ai agentlint check --project-dir . --format terminal
```

For deeper review, generate reports outside the repo unless they are intentionally being archived:

```bash
npx -y -p agentlint-ai agentlint check --project-dir . --format all --output-dir .context/agentlint
```

Run cadence:

- At project bootstrap, after the first `README.md`, `AGENTS.md`, ignore rules, and validation commands exist.
- Before making a repo public or before the first serious PR/release.
- Whenever root instructions change: `AGENTS.md`, `CLAUDE.md`, `.cursor/rules`, Copilot instructions, or other agent entry files.
- Whenever the harness changes: skills, hooks, workflows, Makefile/package scripts, security files, handoff files, or test commands.
- Periodically for active shared repos, for example monthly or before major planning cycles.

Treat the score as a signal, not a law. Fix concrete findings such as missing entry files, missing commands, missing `.env` ignores, missing security policy, broken handoff conditions, or absent local test commands. For generic recommendations such as CI policy, test-required gates, or history rewriting, decide deliberately and document the tradeoff in `HANDOFF.md`, an ExecPlan, or project docs.

**Anti-patterns.** Running AgentLint once at project creation and never again. Chasing a perfect score by adding fake tests, fake CI, or heavyweight automation. Ignoring valid findings because they are "just docs." Treating a clean audit as a replacement for project-specific verification. Committing generated audit reports by default.

**References.** AgentLint, OpenAI Harness Engineering, and Codex `AGENTS.md` guidance.

