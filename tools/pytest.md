---
name: pytest
type: tool
archetypes: [research-ml, trading-data, agent-workflow]
status_by_archetype:
  research-ml: mandatory
  trading-data: mandatory
  agent-workflow: optional
last_verified: 2026-05-16
sources:
  - https://docs.pytest.org/
---

# pytest

**Purpose.** Run Python tests for data transforms, model utilities, metrics, and regression fixtures.

**Install.** Add `pytest` as a development dependency with the project's package manager, for example `uv add --dev pytest`.

**Config.** Configure test paths and markers in `pyproject.toml` or `pytest.ini`. Keep slow or GPU-heavy tests marked separately.

**When to use.** Use for pure logic, feature builders, leakage checks, metric calculations, CLI behavior, agent tool contracts, permission engines, compaction behavior, and regression tests.

**When to skip.** Skip for one-off notebook exploration until behavior is promoted into reusable code.

**Cost.** Usually low. GPU, data, or integration tests need markers and narrow commands.

**Conflicts.** Hidden global state and filesystem-heavy tests can make pytest flaky. Use temp dirs and explicit seeds.

**Known issues / when not to use.** Passing pytest does not prove a model has research signal. Keep experiment gates separate.

**References.** pytest documentation.
