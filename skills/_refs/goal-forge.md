---
name: goal-forge
source: https://github.com/michaelpersonal/goal-forge
license: MIT
fetched_at: 2026-05-21
upstream_commit: 838f57e1c1957c473c4cd180742de606b9e13199
local_status: vendored
---

# Goal Forge

## Why This Source Matters

`goal-forge` is a Codex skill for turning rough coding ideas into `SPEC.md`, `GOAL.md`, and a `/goal`-ready execution contract. It is useful to `my-way` because it fills the gap between short execution plans and long-running autonomous coding runs: measurable success criteria, scorecards, feedback loops, working memory, and an explicit human control surface.

Use it as a companion to [`execplan`](../mine/execplan/SKILL.md), not a replacement. `execplan` is the durable plan format in this repository; `goal-forge` is useful when the target environment supports Codex `/goal` and the task should be compiled into a long-running autonomous run.

## When To Open Upstream

Open the upstream repository when checking for changes to Codex `/goal` conventions, config readiness requirements, XML block structure, or the read-only config inspector script.

For local use, start with the vendored copy at [`../_vendored/goal-forge/SKILL.md`](../_vendored/goal-forge/SKILL.md). It includes:

- `references/goal_prompt_blocks.md` for the `GOAL.md` block structure
- `references/config_checklist.md` for autonomous `/goal` config notes
- `references/control_surface_templates.md` for optional `CONTROL.md` knobs
- `references/working_memory_templates.md` for `PLAN.md`, `ATTEMPTS.md`, and `NOTES.md`
- `scripts/inspect_codex_config.py` for read-only Codex readiness checks

## What To Apply Locally

- Require measurable `done_when` criteria before compiling a goal.
- Add a scorecard that names the metric or checklist, threshold, regression checks, scoring path, and stop condition.
- Define the fastest representative feedback loop and the slower final verification check.
- Use working-memory files for multi-hour runs instead of relying on chat context.
- Add a compact human control surface only when the user may need to steer resources, scope, pivots, or sidecar inputs during a long run.
- Treat dangerous autonomous settings such as broad filesystem access and `approval_policy = "never"` as trusted-project-only choices.

## What Not To Over-Copy

Do not turn every `my-way` plan into a `/goal` contract. Many tasks are better served by the lighter [`templates/execplan/EXECPLAN.md`](../../templates/execplan/EXECPLAN.md) skeleton or by ordinary `AGENTS.md` workflow guidance.

Do not make the autonomous `/goal` config the default repository policy. It is powerful and intentionally risky: use only for explicitly trusted project paths and tasks with strong verification loops.

Do not silently edit the vendored files. If local adaptation becomes necessary, record the reason in [`../_vendored/goal-forge/_meta.json`](../_vendored/goal-forge/_meta.json).
