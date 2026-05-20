# {project_name} Trading Data Project

## Commands
- Install/sync: `uv sync`
- Run all tests: `uv run pytest`
- Run one test: `uv run pytest tests/path/test_file.py::test_name -q`
- Run data checks: `uv run pytest tests/data -q`
- Run backtest smoke: `uv run python scripts/backtest.py --config configs/smoke.yaml`
- Lint: `uv run ruff check .`
- Format check: `uv run ruff format --check .`
- Type check: `uv run mypy src tests`
- Harness audit: `npx -y -p agentlint-ai agentlint check --project-dir . --format terminal`

## Testing
- Add tests for loaders, timestamp parsing, market calendars, corporate actions, feature builders, signals, position sizing, and backtest accounting.
- Keep slow, paid-data, broker, exchange, and live API tests out of the default fast suite unless explicitly requested.
- Every strategy or signal change must include a no-lookahead check, a baseline comparison, and documented transaction-cost assumptions.
- Use fixed input fixtures for regression tests; store generated outputs outside committed data unless they are small intentional fixtures.

## Project Structure
```text
configs/
data/
  raw/       # immutable vendor or exchange snapshots
  interim/   # reproducible normalized data
  features/  # derived features rebuilt from raw/interim
  runs/      # ignored backtest and audit outputs
docs/
  reports/
memory/
  index.md
  context.md
plan/
scripts/
src/{project_name}/
tests/
```

## Code Style
- Python: {python_version}; document market timezone, session calendar, and vendor snapshot assumptions near the command that needs them.
- Keep broker/API adapters, data normalization, feature generation, signal logic, and portfolio accounting in separate modules.
- Example boundary style:

```python
from dataclasses import dataclass

import polars as pl


@dataclass(frozen=True)
class MarketWindow:
    symbol: str
    start: str
    end: str
    timezone: str = "UTC"


def require_sorted_bars(frame: pl.DataFrame, timestamp_col: str = "timestamp") -> None:
    """Reject market bars that can make rolling features non-deterministic."""
    if not frame.get_column(timestamp_col).is_sorted():
        raise ValueError(f"{timestamp_col} must be sorted ascending")
```

## Git Workflow
- Check `git status --short` before editing.
- Keep data ingestion, strategy logic, reports, and generated artifacts in separate commits when practical.
- Do not commit `.env`, broker credentials, paid data snapshots, API tokens, or large backtest outputs.
- Commit messages should state the data, signal, or risk-control behavior changed.
- Do not rewrite shared history unless explicitly requested.

## Boundaries

### Always Do
- Record data vendor, snapshot date, timezone, market calendar, and adjustment policy for promoted results.
- Preserve raw data snapshots; rebuild normalized data and features reproducibly.
- Check for lookahead, target leakage, survivorship bias, and timestamp alignment before trusting metrics.
- Include transaction costs, slippage, liquidity limits, and baseline comparisons in backtest claims.
- Separate paper, simulated, and live results in reports and memory.
- Run a harness audit after changing root instructions, validation commands, handoff files, workflows, hooks, skills, or safety files.

### Ask First
- Connecting to live broker/exchange APIs or placing any order.
- Downloading paid datasets, running long data pulls, or uploading private data to external services.
- Changing canonical symbols, splits, target definitions, calendars, or promotion gates.
- Deleting raw snapshots, overwriting baselines, or archiving active plans.
- Connecting to production databases or private account data.

### Never Do
- Never trade live, paper trade, or call broker order endpoints unless the user explicitly requested it.
- Never edit `data/raw/` in place.
- Never commit credentials, paid/private datasets, account data, or generated heavy run directories.
- Never use future bars, revised fundamentals, or post-event membership lists as if they were known at decision time.
- Never present a backtest without costs, baseline, and sample-period caveats.
- Never annualize tiny samples into a headline claim without showing the underlying period.
