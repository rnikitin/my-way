---
name: ruff
type: tool
archetypes: [research-ml, trading-data]
status_by_archetype:
  research-ml: mandatory
  trading-data: mandatory
last_verified: 2026-05-16
sources:
  - https://docs.astral.sh/ruff/
---

# ruff

**Purpose.** Provide fast Python linting and formatting.

**Install.** Add `ruff` as a development dependency, for example `uv add --dev ruff`.

**Config.** Prefer `pyproject.toml` for rules, line length, target Python version, and formatter settings.

**When to use.** Use on committed Python code, scripts that become reusable, and CI checks.

**When to skip.** Skip for generated files and raw notebook exports unless the project explicitly formats them.

**Cost.** Very low. It is a good pre-commit or CI guardrail.

**Conflicts.** Can conflict with Black/isort if both are active. Pick one formatting authority per project.

**Known issues / when not to use.** Do not auto-fix broad legacy code during a narrow task unless the task is formatting cleanup.

**References.** Ruff documentation.

