---
name: duckdb
type: tool
archetypes: [research-ml, trading-data]
status_by_archetype:
  research-ml: optional
  trading-data: recommended
last_verified: 2026-05-17
sources:
  - https://duckdb.org/docs/current/
---

# DuckDB

**Purpose.** Run local analytical SQL over CSV, Parquet, Arrow, and DuckDB files without standing up a database service.

**Install.** For Python projects, add `duckdb` as a dependency or development dependency, for example `uv add duckdb`. For local CLI work on macOS, `brew install duckdb` is usually enough.

**Config.** Keep persistent `.duckdb` files small and intentional. Treat large databases, downloaded market data, and generated query outputs as artifacts unless they are explicit test fixtures.

**When to use.** Use for reproducible data audits, joins across local snapshots, Parquet inspection, backtest result summaries, and one-off analytical queries that should not require a running Postgres instance.

**When to skip.** Skip when the source of truth is already a managed database with access controls, when streaming semantics matter, or when the project needs app-level authorization rather than local analytical reads.

**Cost.** Low operational cost. Query cost can still be high on large files, so use explicit projections, date filters, and limits during exploration.

**Conflicts.** DuckDB is not a replacement for a production OLTP database or a broker/exchange data API. Do not let local convenience create a second source of truth.

**Known issues / when not to use.** Extension and cloud-storage access can introduce credentials and network behavior. Keep secrets out of SQL files, notebooks, and committed config.

**References.** DuckDB documentation.
