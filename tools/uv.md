---
name: uv
type: tool
archetypes: [research-ml, trading-data, agent-workflow]
status_by_archetype:
  research-ml: mandatory
  trading-data: mandatory
  agent-workflow: optional
last_verified: 2026-05-16
sources:
  - https://docs.astral.sh/uv/
---

# uv

**Purpose.** Manage Python environments, dependencies, lockfiles, and command execution quickly and reproducibly.

**Install.** Use the official Astral installation instructions. On macOS with Homebrew, `brew install uv` is usually acceptable. In CI, prefer the official installer or setup action.

**Config.** Commit `pyproject.toml` and `uv.lock` for applications. Keep local virtual environments ignored.

**When to use.** Use for Python research projects, CLI scripts, tests, notebooks, local tool execution, agent harnesses, and eval runners.

**When to skip.** Skip if the project already has a stable Poetry, Conda, or pip-tools workflow and migration is out of scope.

**Cost.** Low runtime cost. Migration can cost time if project packaging is messy.

**Conflicts.** Can conflict with Conda-managed CUDA stacks. In those projects, document whether `uv --active` is required.

**Known issues / when not to use.** Do not switch an existing project to uv just to match this template. Respect the local environment contract.

**References.** Astral uv documentation.
