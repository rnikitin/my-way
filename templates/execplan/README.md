# ExecPlan Templates

ExecPlans are self-contained plans for multi-step work that must survive context resets, reviews, and handoffs.

## Structure

The template in this directory is organized around purpose, progress, decisions, context, concrete steps, validation, recovery, artifacts, and interfaces. It is more detailed than a short task checklist because it is meant to be executable by a future agent with minimal extra context.

## How To Navigate

Use [EXECPLAN.md](EXECPLAN.md) when an implementation touches multiple files, has hidden assumptions, or needs review checkpoints. For small changes, use the project `AGENTS.md` workflow instead. For the skill that explains how to write and maintain these plans, see [../../skills/mine/execplan/SKILL.md](../../skills/mine/execplan/SKILL.md).

