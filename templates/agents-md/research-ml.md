# {project_name} Research ML Project

## Commands
- Install/sync: `uv sync`
- Run all tests: `uv run pytest`
- Run one test: `uv run pytest tests/path/test_file.py::test_name -q`
- Lint: `uv run ruff check .`
- Format check: `uv run ruff format --check .`
- Type check: `uv run mypy src tests`
- W&B offline run: `WANDB_MODE=offline uv run python scripts/train.py --config configs/example.yaml`

## Testing
- Add tests for reusable data transforms, metrics, loss functions, config parsing, and evaluation gates.
- Mark slow, GPU, and external-service tests explicitly; do not hide them inside the default fast suite.
- Every promoted model change must include a holdout or predeclared validation gate, not only unit tests.
- Use fixed seeds for regression checks and record allowed tolerance for numeric comparisons.

## Project Structure
```text
data/
  raw/        # immutable source snapshots; never edit in place
  interim/    # reproducible derived data
  artifacts/  # ignored run outputs
docs/
  agent/      # detailed protocols loaded on demand
  reports/    # durable experiment reports
memory/
  index.md
  context.md
  feedback/
  knowledge/
notebooks/
plan/
scripts/
src/{project_name}/
tests/
```

## Code Style
- Python: {python_version}; CUDA: {cuda_version}; keep version-sensitive notes near the command that needs them.
- Prefer typed package code under `src/{project_name}/`; keep notebooks exploratory and promote reusable logic into `src/`.
- Example boundary style:

```python
from dataclasses import dataclass
from pathlib import Path

import numpy as np


@dataclass(frozen=True)
class EvaluationWindow:
    name: str
    start: str
    end: str


def load_predictions(path: Path) -> np.ndarray:
    """Load saved model predictions for an evaluation window."""
    return np.load(path)["predictions"]
```

## Git Workflow
- Check `git status --short` before editing.
- Keep experiment code, reports, and generated artifacts in separate commits when practical.
- Do not commit `.env`, credentials, raw private data, W&B tokens, `.aim/`, or large run outputs.
- Commit messages should describe the behavior or research state changed.
- Do not rewrite shared history unless explicitly requested.

## Boundaries

### Always Do
- State assumptions before changing experiment design or promotion gates.
- Preserve raw data snapshots; derive new datasets reproducibly.
- Store run artifacts as ignored files under `data/artifacts/` or `data/runs/` by default.
- Record dataset version, seed, config, baseline, and evaluation split for promoted results.
- Distinguish hypothesis, implementation result, validation result, holdout result, and live/paper result.
- Verify leakage, lookahead, and target construction before trusting strong metrics.

### Ask First
- Long GPU/cluster runs, paid API sweeps, or large W&B artifact uploads.
- Changing the canonical dataset, target definition, embargo, or promotion gate.
- Deleting artifacts, rewriting phase history, or archiving active plans.
- Connecting to production databases or private user data.

### Never Do
- Never edit `data/raw/` in place.
- Never select winners on test data unless the plan explicitly defines that as an audit.
- Never commit credentials, private datasets, or generated heavy run directories.
- Never introduce a database only to store research artifacts.
- Never present a single split or lucky seed as robust model skill.
- Never silently rewrite a biased or leaked result; add a retraction note instead.
