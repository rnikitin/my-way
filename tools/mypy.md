---
name: mypy
type: tool
archetypes: [research-ml, trading-data, agent-workflow]
status_by_archetype:
  research-ml: mandatory
  trading-data: recommended
  agent-workflow: recommended
last_verified: 2026-05-16
sources:
  - https://mypy.readthedocs.io/
---

# mypy

**Purpose.** Type-check Python boundaries that should stay stable.

**Install.** Add `mypy` as a development dependency, for example `uv add --dev mypy`.

**Config.** Configure packages, strictness, and ignored third-party imports in `pyproject.toml` or `mypy.ini`.

**When to use.** Use for public interfaces, data contracts, metrics, config objects, model wrappers, tool schemas, event types, and permission boundaries.

**When to skip.** Skip for raw exploratory notebooks or throwaway scripts. Do not force full strictness onto legacy code in one pass.

**Cost.** Medium. It adds annotations and can expose third-party typing gaps.

**Conflicts.** Scientific Python libraries may have incomplete type hints. Use targeted ignores with comments.

**Known issues / when not to use.** Type checks do not catch statistical or data leakage bugs. Pair with research-specific tests.

**References.** mypy documentation.
