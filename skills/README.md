# Skills

Skills are reusable agent workflows written as `SKILL.md` files. They should be loaded only when the task needs that workflow, which keeps root project instructions short.

## Structure

| Directory | Purpose |
|-----------|---------|
| [_vendored/](./_vendored/) | Copied public skills with provenance metadata and upstream license files. |
| [_refs/](./_refs/) | Reference notes for useful upstream material that should stay canonical elsewhere. |
| [mine/](./mine/) | Original or personally maintained skills. |

## How To Navigate

Start from an [archetype](../archetypes/) to see which skills are mandatory or recommended for a project type. Use [_vendored/](./_vendored/) when you need stable local copies, [_refs/](./_refs/) when you need source context, and [mine/](./mine/) for skills maintained in this repository.

When adding a new skill, prefer `SKILL.md` as the canonical format and avoid creating separate Codex/Claude copies unless there is a proven adapter need.

## Current Local Skills

| Skill | Location | Use when |
|-------|----------|----------|
| `frontend-design` | [mine/frontend-design](mine/frontend-design/SKILL.md) | Building or redesigning frontend UI. |
| `code-simplifier` | [mine/code-simplifier](mine/code-simplifier/SKILL.md) | Cleaning up code while preserving behavior. |
| `execplan` | [mine/execplan](mine/execplan/SKILL.md) | Planning long-running, resumable work. |
| `agents-best-practices` | [_vendored/agents-best-practices](_vendored/agents-best-practices/SKILL.md) | Designing or auditing agent harnesses, tool-calling workflows, MCP/connectors, permissions, compaction, evals, and observability. |
| `goal-forge` | [_vendored/goal-forge](_vendored/goal-forge/SKILL.md) | Turning rough coding ideas into `SPEC.md`, `GOAL.md`, scorecards, feedback loops, and `/goal` readiness checks. |
| `superpowers/*` | [_vendored/superpowers](_vendored/superpowers/) | Running structured development workflows such as brainstorming, planning, TDD, debugging, and verification. |
