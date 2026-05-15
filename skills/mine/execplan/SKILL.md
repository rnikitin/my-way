---
name: execplan
description: Create, update, or review ExecPlans (execution plans): self-contained, beginner-friendly design documents that a coding agent can follow to deliver a working feature or system change. Use when asked to write an ExecPlan, execution plan, executable spec, or ExecPlsn (typo). Also triggers when the user says "write a plan", "create a spec", or references PLANS.md. Produces a plan with milestones, concrete commands, verifiable acceptance criteria, and living sections (Progress, Surprises & Discoveries, Decision Log, Outcomes & Retrospective).
user_invocable: true
---

# ExecPlan

Write a self-contained ExecPlan: a strict-format execution plan that a complete novice can follow using only the plan and the current working tree.

This skill covers authoring and maintaining the ExecPlan document itself—not implementing the change described in it.

## Workflow

1. Read the full spec and skeleton in `references/execplan-spec.md` before writing anything.

2. Check for a `PLANS.md` file in the target repository root. If it exists, read it fully and treat it as an additional non-negotiable standard; mention it at the top of the ExecPlan.

3. Build context first: identify the user-visible behavior change, the files and modules involved, and the exact commands a novice must run (including working directories).

4. Draft using the skeleton from `references/execplan-spec.md`. Narrative sections must be prose; checkboxes only in `Progress`.

5. Formatting rules (non-negotiable):
   - In chat: output as one single fenced code block labeled `md` (` ```md ... ``` `).
   - Do NOT nest additional triple-backtick fences inside; use indented blocks for commands/transcripts/code.
   - Two blank lines after every heading inside the ExecPlan.
   - When writing to a `.md` file where the file content *is only* the ExecPlan, omit the outer triple backticks.

6. When revising an existing ExecPlan: update every impacted section so it stays self-contained, add a short note at the bottom describing what changed and why, and record key choices in `Decision Log`.

## Pitfalls to avoid

- Assuming prior context ("as discussed", "see architecture doc") instead of embedding the explanation directly.
- Phrasing acceptance as internal code attributes rather than observable, human-verifiable behavior.
- Nesting triple-backtick fences inside the ExecPlan (breaks the single-fence requirement).
- Leaving `Progress` stale—it must reflect reality at every stopping point, with timestamps.
- Using unexplained jargon; define every non-ordinary term at first use.

## Resources

Read `references/execplan-spec.md` before writing or revising any ExecPlan. It contains the full requirements, formatting rules, guidelines, and the mandatory skeleton template.
