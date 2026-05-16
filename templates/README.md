# Templates

Reusable project files and skeletons for agent instructions, Claude shims, and execution plans.

## Structure

Templates are grouped by the file they produce:

- [agents-md/](agents-md/) - canonical `AGENTS.md` files by archetype.
- [claude-md/](claude-md/) - thin `CLAUDE.md` shims that import `AGENTS.md`.
- [execplan/](execplan/) - self-contained execution plan skeletons.

## How To Navigate

Start with the [archetype guide](../archetypes/) to choose the right template. Copy a template into the target project, then delete anything that is not true locally and fill in commands, versions, paths, and boundaries. Use [../principles/instruction-minimalism.md](../principles/instruction-minimalism.md) as the cleanup rule.

| Template | Use |
|----------|-----|
| [agents-md/research-ml.md](agents-md/research-ml.md) | Starting point for `AGENTS.md` in ML research projects. |
| [claude-md/research-ml.md](claude-md/research-ml.md) | Thin `CLAUDE.md` shim that imports `AGENTS.md` exactly once. |
| [execplan/EXECPLAN.md](execplan/EXECPLAN.md) | Self-contained plan skeleton for long-running work. |
