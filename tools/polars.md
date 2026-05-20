---
name: polars
type: tool
archetypes: [research-ml, trading-data]
status_by_archetype:
  research-ml: optional
  trading-data: optional
last_verified: 2026-05-17
sources:
  - https://docs.pola.rs/
---

# Polars

**Purpose.** Process structured data with a fast dataframe engine, strict schemas, lazy query plans, and strong CSV/Parquet support.

**Install.** Add `polars` to the project when dataframe workloads are a core part of the code, for example `uv add polars`.

**Config.** Document schema expectations, timestamp timezone policy, null handling, and eager vs lazy execution choices near the pipeline code or test fixtures.

**When to use.** Use for market-data transforms, feature pipelines, large local audits, Parquet-heavy workflows, and deterministic table operations that should become tested package code.

**When to skip.** Skip for small projects already stable on pandas, for SQL-first workflows where DuckDB is simpler, or for one-off notebooks that will not be promoted into reusable code.

**Cost.** Low runtime overhead for many analytical workloads, but migration from pandas costs review time and can change edge-case behavior.

**Conflicts.** Mixed pandas, Polars, Arrow, and DuckDB pipelines need clear conversion boundaries. Unchecked conversions can hide timezone, null, and dtype changes.

**Known issues / when not to use.** Do not introduce Polars just because it is faster. Use it when schema discipline, lazy execution, or larger-than-memory style workflows solve a real project problem.

**References.** Polars user guide.
