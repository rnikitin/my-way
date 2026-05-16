---
name: wandb
type: tool
archetypes: [research-ml]
status_by_archetype:
  research-ml: mandatory
last_verified: 2026-05-16
sources:
  - https://docs.wandb.ai/
---

# Weights & Biases

**Purpose.** Track experiment metrics, configs, and runs.

**Install.** Add `wandb` as a project dependency or development dependency according to the training code. Authenticate with `wandb login`.

**Config.** Keep entity, project, mode, and upload policy documented. Do not commit API keys.

**When to use.** Use when experiments need reproducible configs, metric history, and run comparison. Keep artifacts file-backed by default unless the project explicitly opts into W&B artifact storage.

**When to skip.** Skip for private or offline-only experiments where local JSON/CSV logs are sufficient and easier to audit.

**Cost.** External service dependency plus possible artifact storage cost.

**Conflicts.** Can leak names, configs, prompts, or paths if logging is careless. Review what gets uploaded.

**Known issues / when not to use.** Do not let dashboard convenience replace checked-in conclusions. Summarize durable findings in repo docs.

**References.** W&B documentation.
