# My Way Best Practices Repo Plan

## Context And Requirements
- The user wants a reusable public GitHub repository at `~/dev/my-way`.
- The repository collects best practices, instructions, skills, memory conventions, principles, and project setup approaches that the user can apply to any new project by linking the repo from that project.
- The repository must support multiple project types (the eight reference projects listed below).
- The user supplied a local article attachment and two external references:
  - `.context/attachments/pasted_text_2026-05-15_23-35-07.txt`
  - https://github.com/multica-ai/andrej-karpathy-skills/blob/main/skills/karpathy-guidelines/SKILL.md
  - https://openai.com/index/harness-engineering/
- The user explicitly requested use of `superpowers:brainstorming` and `superpowers:writing-plans`.
- The current repo requires an active task plan under `plan/` at the start of each task.

## Reference Projects
- `~/dev/ark-algotrading` — trading/quant
- `~/dev/xlstm-predictor` — ML research
- `~/dev/3lgn/screener-3-experiments` — product/PRD work
- `~/dev/3lgn/mastergptchatflow` — agent workflow
- `~/dev/3lgn/mastra` — agent framework
- `~/dev/datamate` — data platform with OpenSpec discipline
- `~/dev/2and` — game prototype
- `~/dev/deliverator` — agent workflow with OpenSpec + ExecPlan
- This PM workspace (pattaya) — docs/PM archetype

## Decisions Made During Brainstorming (2026-05-15 → 2026-05-16)
- **No bootstrap CLI / no `init` script.** Manual setup is fine. Goal is principles collected in one place; scripts add maintenance burden without solving real pain.
- **MCP/tools/plugins/skills catalog is in scope** as a separate runtime dimension distinct from pattern/principle layer. Lean on docs and external best practices, not only what the user currently uses. Each entry has explicit `mandatory | recommended | optional` status per archetype.
- **Success metrics deferred.** Skip "how to measure my-way works after 3 months" until later.
- **Codex-first with adapters is the working assumption** (`SKILL.md` single source of truth, `CLAUDE.md` generated/derived). Confirm at scaffold time.
- **5 archetypes:** research-ml, trading-data, agent-workflow, docs-pm, prototype. `2and` (game) is a `prototype` subset, not its own archetype.
- **Repository layout:** archetype docs + per-category folders with README/index, not a flat list.
- **`skills/_vendored/`** — full copy of public skills + `_meta.json` per skill (source URL, sha, fetched_at, upstream_version, local_notes). `scripts/sync-check.sh` compares against upstream and reports drift without auto-overwriting.
- **`skills/_refs/`** — link-only entries for sources that should not be copied (Karpathy guidelines, OpenAI/Anthropic harness articles, arXiv AGENTS.md paper, ExecPlan cookbook, agents-md docs, OpenSpec upstream).
- **Skills classification:**
  - **`skills/mine/` (author):** `execplan` (user's own skill based on OpenAI cookbook). Five other candidates (`notion-sync`, `new-epic`, `memory-search`, `notion-curate`, `program-reporting`) stay local to their projects, not lifted to `my-way`.
  - **`skills/_vendored/`:** superpowers suite, openspec-* suite, frontend-design, code-simplifier.
  - **`skills/_refs/`:** Karpathy guidelines, OpenSpec upstream, ExecPlan cookbook, OpenAI/Anthropic harness references, arXiv AGENTS.md paper, agents-md docs.
- **Templates as separate section** (`templates/`) for files like `EXECPLAN.md`, `AGENTS.md` per archetype, `CLAUDE.md` per archetype.
- **Anti-patterns captured per entry**, not in a separate `_deprecated.md`, as a `## Known issues / when not to use` section inside each MCP/tool/skill record.
- **Versioning:** `last_verified: YYYY-MM-DD` in MCP/tool frontmatter; sha + fetched_at for `_vendored`; no semver on `my-way` itself yet.
- **One format for skills:** `SKILL.md` in Codex/Anthropic format; other tool variants generated on demand. Avoids `.codex/` vs `.claude/` asymmetric drift seen in reference projects.
- **README and content language: English.** Repo will be public.
- **`principles/README.md`** = one paragraph TL;DR per principle + link to full file.
- **`archetypes/<name>.md`** = detailed: mandatory setup, recommended setup, MCP table, tools table, skills table, templates list, secrets/auth, eval gates, typical pitfalls, reference layouts.
- **Top-5 limit** on MCP/tools per archetype (mandatory + recommended combined), lean on upstream docs not only on what the user already uses.
- **Refs over reinvention for MCP catalog (added 2026-05-16 after web research).** The Official MCP Registry at `registry.modelcontextprotocol.io` is the authoritative catalog. `my-way/mcp/` contains a curated archetype-annotated subset with `registry_url` field, not a competing catalog.
- **AGENTS.md minimalism (added 2026-05-16 after arXiv AGENTS.md study + github.blog 2500-repo guide).** Templates use 150 lines as a hard ceiling, but the real rule is stricter: include only non-derivable, actionable constraints that prevent mistakes. The six default sections are commands, testing, structure, code style with real examples, git workflow, and boundaries. Boundaries use 3-tier framework (always do / ask first / never do). LLM-generated `AGENTS.md` is an explicit anti-pattern.
- **CLAUDE.md generated via exactly one `@AGENTS.md` import line (added 2026-05-16).** Anthropic's Claude Code supports `@path/to/import` in CLAUDE.md. `my-way` templates use a thin shim importing the canonical `AGENTS.md` content once, avoiding double-maintenance drift and duplicate context.
- **Vendored skill provenance must include license metadata.** Every copied public skill gets `_meta.json` with source URL, sha, fetched date, upstream version, license, and license URL. Copy upstream `LICENSE` / `LICENSE.txt` when present.
- **Critical-source archival.** For MIT/open-licensed skill or guideline sources, keep a substantive local copy or full local archive, not just a link. For copyrighted articles and docs, keep concise local distillation plus source metadata.
- **Source attribution matters.** GitHub's 2,500-repo post is used for practical `AGENTS.md` section guidance. The arXiv "Evaluating AGENTS.md" paper is used for the cost/success warning about unnecessary context and LLM-generated files.
- **File-backed artifacts by default.** Research artifacts stay as ignored local files for now. Do not introduce Postgres or another database just to store run artifacts; database MCPs are opt-in only when a project already has a real database-backed workflow.

## Proposed Repository Layout

```
~/dev/my-way/
├── README.md                       # Repo entry point, how to use
├── CHANGELOG.md                    # Append-only log of structural changes
├── archetypes/
│   ├── README.md                   # Index + selection guidance
│   ├── research-ml.md
│   ├── trading-data.md
│   ├── agent-workflow.md
│   ├── docs-pm.md
│   └── prototype.md
├── principles/
│   ├── README.md                   # Paragraph + link per principle
│   ├── karpathy-guidelines.md
│   ├── harness-engineering.md
│   ├── simplicity.md
│   ├── verification.md             # "Highest leverage" per Anthropic playbook
│   ├── instruction-minimalism.md    # Only non-derivable constraints in root agent files
│   ├── memory-hygiene.md           # Repo-local context > tribal chat memory
│   ├── mechanical-guardrails.md     # Hooks/lints/tests enforce repeated feedback
│   ├── explore-plan-implement.md   # 4-phase workflow from Anthropic playbook
│   ├── progressive-disclosure.md   # Short root + focused refs (github.blog study)
│   └── context-management.md       # CLAUDE.md hygiene, /clear, subagents
├── mcp/
│   ├── README.md                   # Catalog index with archetype filter
│   ├── context7.md
│   ├── notion.md
│   ├── chrome.md
│   ├── postgres.md
│   ├── filesystem.md
│   └── ... (added per archetype need, top-5 cap per archetype)
├── tools/
│   ├── README.md
│   ├── uv.md
│   ├── ruff.md
│   ├── pytest.md
│   ├── duckdb.md
│   ├── polars.md
│   ├── promptfoo.md
│   ├── langfuse.md
│   ├── markdown-link-check.md
│   ├── vale.md
│   ├── agentlint.md                 # optional harness audit tool
│   └── ...
├── skills/
│   ├── README.md
│   ├── _vendored/
│   │   ├── superpowers/
│   │   │   ├── brainstorming/{SKILL.md,_meta.json}
│   │   │   ├── writing-plans/{SKILL.md,_meta.json}
│   │   │   ├── executing-plans/{SKILL.md,_meta.json}
│   │   │   ├── test-driven-development/{SKILL.md,_meta.json}
│   │   │   ├── systematic-debugging/{SKILL.md,_meta.json}
│   │   │   ├── verification-before-completion/{SKILL.md,_meta.json}
│   │   │   ├── requesting-code-review/{SKILL.md,_meta.json}
│   │   │   ├── receiving-code-review/{SKILL.md,_meta.json}
│   │   │   ├── subagent-driven-development/{SKILL.md,_meta.json}
│   │   │   ├── dispatching-parallel-agents/{SKILL.md,_meta.json}
│   │   │   ├── using-git-worktrees/{SKILL.md,_meta.json}
│   │   │   ├── finishing-a-development-branch/{SKILL.md,_meta.json}
│   │   │   └── writing-skills/{SKILL.md,_meta.json}
│   │   ├── openspec/
│   │   │   ├── explore/{SKILL.md,_meta.json}
│   │   │   ├── new-change/{SKILL.md,_meta.json}
│   │   │   ├── apply-change/{SKILL.md,_meta.json}
│   │   │   ├── verify-change/{SKILL.md,_meta.json}
│   │   │   └── archive-change/{SKILL.md,_meta.json}
│   │   ├── frontend-design/{SKILL.md,_meta.json}
│   │   └── code-simplifier/{SKILL.md,_meta.json}
│   ├── _refs/
│   │   ├── karpathy-guidelines.md
│   │   ├── openspec-upstream.md
│   │   ├── execplan-cookbook.md
│   │   ├── openai-harness-engineering.md
│   │   ├── anthropic-effective-harnesses.md
│   │   ├── agents-md-docs.md
│   │   ├── evaluating-agents-md-paper.md
│   │   ├── agents-md-spec.md          # github.com/agentsmd/agents.md
│   │   ├── agents-md-2500-study.md    # github.blog evidence-backed AGENTS.md study
│   │   ├── claude-code-best-practices.md  # code.claude.com/docs/en/best-practices
│   │   ├── openai-skills-catalog.md   # github.com/openai/skills
│   │   ├── codex-agent-approvals-security.md
│   │   ├── codex-hooks.md
│   │   ├── simonw-agentic-patterns.md # Simon Willison pattern catalog
│   │   ├── mcp-official-registry.md   # registry.modelcontextprotocol.io
│   │   ├── cursor-rules-docs.md       # official Cursor .mdc / AGENTS.md rules docs
│   │   └── awesome-cursorrules.md     # examples only, not canonical
│   └── mine/
│       ├── README.md
│       └── execplan/
│           ├── SKILL.md
│           └── references/execplan-spec.md
├── templates/
│   ├── README.md
│   ├── execplan/
│   │   └── EXECPLAN.md
│   ├── agents-md/
│   │   ├── research-ml.md
│   │   ├── trading-data.md
│   │   ├── agent-workflow.md
│   │   ├── docs-pm.md
│   │   └── prototype.md
│   └── claude-md/
│       ├── research-ml.md
│       ├── trading-data.md
│       ├── agent-workflow.md
│       ├── docs-pm.md
│       └── prototype.md
└── scripts/
    └── sync-check.sh
```

## File Content Shapes

### `mcp/<name>.md` and `tools/<name>.md`
```markdown
---
name: <kebab>
type: mcp | tool
archetypes: [research-ml, docs-pm]
status_by_archetype:
  research-ml: mandatory
  docs-pm: recommended
last_verified: YYYY-MM-DD
registry_url: https://registry.modelcontextprotocol.io/...  # for MCP entries only
registry_status: listed | not-found-YYYY-MM-DD               # for MCP entries only
sources:
  - https://upstream-docs
---

# <Name>

**Purpose.** One sentence.

**Install.** Exact command(s) with target environment.

**Config.** Env vars, secrets, files needed; what MUST NOT be committed.

**When to use.** Trigger conditions.

**When to skip.** Anti-triggers — when overkill.

**Cost.** Tokens / $ / latency if material.

**Conflicts.** Doesn't play with X.

**Known issues / when not to use.** Captured experience.

**References.** Upstream docs, articles informing the recommendation.
```

### `archetypes/<name>.md`
```markdown
---
name: <archetype>
projects-examples: [list-of-user-projects-that-fit]
---

# <Archetype Name>

## What this is
2-3 sentences describing the project type covered.

## Mandatory setup
- `AGENTS.md` / `CLAUDE.md` — template ref: `templates/agents-md/<archetype>.md`
- `memory/` discipline — see `principles/memory-hygiene.md`
- Specific skills that MUST be present (list of paths into `my-way/skills/`)

## Recommended setup
- Additional skills, templates, principles to consider.

## MCP servers
| Status | Name | Why for this archetype |
|--------|------|------------------------|

## Tools
| Status | Name | Why |
|--------|------|-----|

## Skills (from `my-way/skills/`)
| Status | Name | Why |
|--------|------|-----|

## Templates (from `my-way/templates/`)
- Template paths and when to use each.

## Secrets & auth
What credentials each setup needs. Where they live (.env, 1Password, OS keyring). What MUST NOT be committed. Patterns for .gitignore.

## Eval gates
"Definition of working" checks for this archetype.

## Typical pitfalls
- Pitfall: description → mitigation.

## Reference layouts
Link to canonical example in user's projects or external repo.
```

### `principles/<name>.md`
```markdown
---
name: <name>
sources:
  - https://...
---

# <Principle Name>

**Core idea.** One sentence.

**Why it matters.** 2-3 sentences with reasoning.

**How to apply.** Concrete actions / checks.

**Anti-patterns.** What violating this looks like.

**References.** Upstream sources.
```

### `principles/README.md`
For each principle: one paragraph TL;DR + link to full file. No further depth here.

### `skills/_vendored/<group>/<skill>/_meta.json`
```json
{
  "name": "<skill-name>",
  "source_url": "https://github.com/.../SKILL.md",
  "upstream_repo": "https://github.com/...",
  "upstream_version": "tag-or-commit",
  "upstream_sha": "git-sha",
  "fetched_at": "YYYY-MM-DD",
  "license": "MIT | Apache-2.0 | unknown",
  "license_url": "https://github.com/.../LICENSE",
  "local_notes": "modifications applied or empty"
}
```

If upstream ships a `LICENSE` or `LICENSE.txt` beside the skill or at repo root, copy it into the vendored skill directory as `LICENSE.upstream`.

### `skills/_refs/<name>.md`
Frontmatter with `source_url`, `last_verified`, plus a short narrative on what the source covers and why we link rather than copy.

### `scripts/sync-check.sh`
Iterates over `skills/_vendored/*/*/_meta.json`. For each:
- Fetch upstream content (`curl`/`gh api`).
- Compute hash, compare to `_meta.json.upstream_sha`.
- If different: print diff summary, suggest review.
- If upstream returns 4xx/5xx or network error: warn but keep local copy.
- Optional flag `--update <skill>` to refresh a specific entry after manual review.

No auto-update. No CI requirement for now.

## Implementation Phases

### Phase A — POC archetype: `research-ml` end-to-end
Build one archetype completely before mirroring the structure across the remaining four. This validates the file shapes and surfaces gaps cheaply. Phase A breaks into ten milestones; each ends in its own `git commit` so the work can resume from any point. Every command names its working directory; every step is idempotent unless explicitly marked otherwise. The user is on macOS with `git`, `gh`, `bash`, `jq`, `curl`, and `shasum` already installed.

#### M1 — Bootstrap skeleton

Goal: a new local git repo at `~/dev/my-way` with top-level `README.md`, `CHANGELOG.md`, `LICENSE` (MIT, copyright "Roman Nikitin", 2026), `.gitignore`, and the subdirectory tree from "Proposed Repository Layout" above. Every subdirectory has its own placeholder `README.md` so the tree is browsable on GitHub.

Commands (cwd = `~`):
```bash
mkdir -p ~/dev/my-way && cd ~/dev/my-way
git init --initial-branch=main
mkdir -p archetypes principles mcp tools \
         skills/_vendored skills/_refs skills/mine \
         templates/agents-md templates/claude-md templates/execplan \
         scripts
```

Top-level `README.md` describes only what the repo is and how to consume it (no detailed catalog yet — that comes in M3+). `CHANGELOG.md` opens with a 2026-05-16 entry "Initial scaffolding". `.gitignore` excludes `.DS_Store`, `*.swp`, `*.swo`, `.idea/`, `.vscode/`, `node_modules/`, `__pycache__/`. Each subdirectory gets a one-paragraph `README.md` describing its purpose and what files will appear there.

Commit:
```bash
git add . && git commit -m "M1: scaffold empty repository structure"
```

Acceptance: `tree -L 2 ~/dev/my-way` shows the exact layout from "Proposed Repository Layout". `git log --oneline` shows one commit.

#### M2 — Principles (10 files + README)

Goal: ten principle files plus `principles/README.md` summary. Each principle file has frontmatter (`name`, `sources`) and five sections (Core idea, Why it matters, How to apply, Anti-patterns, References). Each is two to five paragraphs.

Files and the primary source for each:
- `karpathy-guidelines.md` — `https://github.com/multica-ai/andrej-karpathy-skills/blob/main/skills/karpathy-guidelines/SKILL.md`. MIT-licensed source gets a full local archival section plus local application notes: think before coding, surgical changes, verifiable goals.
- `harness-engineering.md` — `https://openai.com/index/harness-engineering/`. Repo-local knowledge as system of record; short `AGENTS.md` as a map; app/log/metric legibility; mechanical architecture and taste invariants; entropy cleanup.
- `simplicity.md` — Smallest change for correct observable behavior; resist abstraction without two existing call sites.
- `verification.md` — `https://code.claude.com/docs/en/best-practices`. The agent's single highest-leverage advantage; every change ships with a self-runnable verification.
- `instruction-minimalism.md` — `https://arxiv.org/abs/2602.11988`. Root context files can reduce task success and raise cost when they add unnecessary requirements. Include only non-derivable, actionable constraints.
- `memory-hygiene.md` — Durable context in versioned repo files; `memory/index.md` + `context.md` + `feedback/` + `knowledge/`; rotation rules.
- `mechanical-guardrails.md` — `https://openai.com/index/harness-engineering/`, `https://developers.openai.com/codex/hooks/`, `https://developers.openai.com/codex/agent-approvals-security/`. Repeated review feedback should become hooks, lints, tests, schema checks, or approval policy, not longer prose.
- `explore-plan-implement.md` — Anthropic 4-phase workflow; plan mode or ExecPlan for multi-file changes; skip planning for typo fixes.
- `progressive-disclosure.md` — `https://github.blog/ai-and-ml/github-copilot/how-to-write-a-great-agents-md-lessons-from-over-2500-repositories/`, `https://developers.openai.com/codex/skills`. `AGENTS.md` is a short map; skills and focused refs load on demand.
- `context-management.md` — Context window as scarce resource; `/clear` between unrelated tasks; subagents for read-many-files; kitchen-sink session is the dominant failure pattern.

`principles/README.md` is one paragraph TL;DR (2-4 sentences) per principle plus a link to the full file. Replaces the M1 placeholder.

Commit:
```bash
git add principles/ && git commit -m "M2: principles (10 files + README)"
```

Acceptance: `ls principles/` lists 11 files. `grep -c '^\*\*Core idea\.\*\*' principles/*.md` returns 1 per non-README file.

#### M3 — `archetypes/research-ml.md`

Goal: one self-contained archetype document. Per the "File Content Shapes" section above, with all relative paths resolving to files that will exist by end of M8.

Section contents specific to research-ml:

- **What this is**: ML research projects where iteration, experiment tracking, and reproducibility are central. Canonical example: `~/dev/xlstm-predictor`.
- **Mandatory setup**: `templates/agents-md/research-ml.md`, `principles/instruction-minimalism.md`, `principles/memory-hygiene.md`, `principles/verification.md`, `principles/explore-plan-implement.md`; mandatory skills `superpowers/brainstorming`, `superpowers/writing-plans`, `superpowers/test-driven-development`, `superpowers/systematic-debugging`, `superpowers/verification-before-completion`.
- **Recommended setup**: `principles/progressive-disclosure.md`, `principles/context-management.md`, `principles/mechanical-guardrails.md`; skills `superpowers/executing-plans`, `superpowers/subagent-driven-development`, `superpowers/dispatching-parallel-agents`, `superpowers/using-git-worktrees`, `superpowers/finishing-a-development-branch`; `mine/execplan` for multi-step tasks.
- **MCP** (top-5): mandatory `context7` (fresh framework docs), `filesystem` (read datasets without bloat); recommended `chrome` (visual verify plots/dashboards), `notion` (writeups). `postgres` is optional only when experiment metadata or evaluation results already live in Postgres.
- **Tools** (top-5): mandatory `uv` (env), `pytest` (tests), `ruff` (lint), `mypy` (types), `wandb` (experiment tracking); recommended `marimo`, `polars`, `duckdb`.
- **Templates**: `templates/agents-md/research-ml.md`, `templates/claude-md/research-ml.md`, `templates/execplan/EXECPLAN.md`.
- **Secrets & auth**: Anthropic API key in `~/.config/claude/credentials.json`; `wandb login` if W&B is used; Notion via Claude Code MCP OAuth. Add Postgres env secrets only for projects that already use Postgres. `.gitignore` patterns: `.env`, `*.key`, `*.pem`, `wandb/`.
- **Eval gates**: holdout split with documented seed; leak check; hyperparam log per run; reproducibility tolerance.
- **Typical pitfalls** (each as `Pitfall → Mitigation`): LLM-generated AGENTS.md (hand-curate from template), instruction bloat (delete any rule the agent can infer from repo files), vague persona (state domain + stack versions + one example pattern), missing version specificity (name PyTorch/CUDA/lib versions), kitchen-sink session (`/clear` between analysis and authoring), trust-then-verify gap (every model change ships with holdout eval).
- **Reference layouts**: `~/dev/xlstm-predictor` (local canonical), GitHub blog 2500-repo study, `openai/skills` repo (external).

Length target: 200-350 lines (archetype is more detailed than the AGENTS.md template).

Commit:
```bash
git add archetypes/research-ml.md && git commit -m "M3: research-ml archetype"
```

Acceptance: file exists, line count in range, every link resolves to a file existing now or scheduled for M4-M8.

#### M4 — MCP + tools catalog for research-ml

Goal: 5 MCP entries + 5 tool entries + 2 `README.md` indexes. Each entry follows the shape from "File Content Shapes" → `mcp/<name>.md` and `tools/<name>.md`.

MCP files: `context7.md`, `filesystem.md`, `chrome.md`, `postgres.md`, `notion.md`. For each, look up the corresponding entry in the Official MCP Registry at `https://registry.modelcontextprotocol.io/` and populate `registry_url` when present. If a useful MCP server is not yet in the registry, set `registry_url: null`, cite the official upstream docs, and add `registry_status: not-found-2026-05-16`. `postgres.md` is optional for research-ml and agent-workflow, recommended for trading-data only when database access is part of the project. Body 30-80 lines.

Tool files: `uv.md`, `pytest.md`, `ruff.md`, `mypy.md`, `wandb.md`, plus optional `agentlint.md` because the tool was added by design review before execution. Install + config drawn from official docs (`https://docs.astral.sh/uv/`, `https://docs.pytest.org/`, `https://docs.astral.sh/ruff/`, `https://mypy.readthedocs.io/`, `https://docs.wandb.ai/`, `https://www.agentlint.app/`). Body 30-80 lines.

`mcp/README.md` and `tools/README.md`: orientation paragraph + table indexing entries. MCP README explicitly defers to the Official MCP Registry as authoritative.

`last_verified` set to today's date for all 10 entries.

Commit:
```bash
git add mcp/ tools/ && git commit -m "M4: MCP and tool catalog for research-ml archetype"
```

Acceptance: 13 files total in `mcp/` + `tools/`. `grep -l '^last_verified:' mcp/*.md tools/*.md` returns 11 paths. All `../mcp/...` and `../tools/...` links from `archetypes/research-ml.md` resolve.

#### M5 — Vendor Superpowers skills

Goal: 13 subdirectories under `skills/_vendored/superpowers/`, each with `SKILL.md` (verbatim upstream) and `_meta.json` sidecar. Plus a `README.md` enumerating all 13.

Skill slugs: `brainstorming`, `writing-plans`, `executing-plans`, `test-driven-development`, `systematic-debugging`, `verification-before-completion`, `requesting-code-review`, `receiving-code-review`, `subagent-driven-development`, `dispatching-parallel-agents`, `using-git-worktrees`, `finishing-a-development-branch`, `writing-skills`.

Per skill (example `brainstorming`):
```bash
mkdir -p skills/_vendored/superpowers/brainstorming
curl -sS -L --fail -o skills/_vendored/superpowers/brainstorming/SKILL.md \
  https://raw.githubusercontent.com/obra/superpowers/main/skills/brainstorming/SKILL.md \
  || cp ~/.codex/plugins/cache/openai-curated/superpowers/*/skills/brainstorming/SKILL.md \
        skills/_vendored/superpowers/brainstorming/SKILL.md
sha=$(shasum -a 256 skills/_vendored/superpowers/brainstorming/SKILL.md | cut -d' ' -f1)
curl -sS -L --fail -o skills/_vendored/superpowers/brainstorming/LICENSE.upstream \
  https://raw.githubusercontent.com/obra/superpowers/main/LICENSE \
  || true
cat > skills/_vendored/superpowers/brainstorming/_meta.json <<JSON
{
  "name": "brainstorming",
  "source_url": "https://raw.githubusercontent.com/obra/superpowers/main/skills/brainstorming/SKILL.md",
  "upstream_repo": "https://github.com/obra/superpowers",
  "upstream_version": "main",
  "upstream_sha": "$sha",
  "fetched_at": "2026-05-16",
  "license": "MIT",
  "license_url": "https://github.com/obra/superpowers/blob/main/LICENSE",
  "local_notes": ""
}
JSON
```

Repeat for all 13. If `curl` fails for all, stop and ask user; partial failures fall back per-skill with `local_notes` recording the cache path. For every vendored skill, copy the upstream license when available and populate `license` / `license_url`; if the license cannot be verified, set `license: unknown` and keep the skill out of public release until reviewed.

`skills/_vendored/superpowers/README.md`: one-line purpose per skill, drawn from each `SKILL.md`'s frontmatter `description:`.

Commit:
```bash
git add skills/_vendored/superpowers/ && git commit -m "M5: vendor 13 Superpowers skills with meta sidecars"
```

Acceptance: `ls skills/_vendored/superpowers/ | wc -l` = 14. `jq -r .upstream_sha skills/_vendored/superpowers/*/_meta.json | sort -u | wc -l` = 13. `jq -r .license skills/_vendored/superpowers/*/_meta.json | rg -v '^(unknown|null|)$' | wc -l` = 13 before public release.

#### M6 — `skills/_refs/` link-only entries

Goal: 17 link-only Markdown files in `skills/_refs/`. Each has frontmatter (`name`, `source_url`, `last_verified: 2026-05-16`) and 2-3 paragraphs: what the source is, who maintains it, one fact making it worth citing.

Files and URLs:
1. `karpathy-guidelines.md` — `https://github.com/multica-ai/andrej-karpathy-skills/blob/main/skills/karpathy-guidelines/SKILL.md`
2. `openspec-upstream.md` — `https://github.com/Fission-AI/OpenSpec` (verify canonical org at fetch; search if 404)
3. `execplan-cookbook.md` — `https://developers.openai.com/cookbook/articles/codex_exec_plans`
4. `openai-harness-engineering.md` — `https://openai.com/index/harness-engineering/`
5. `anthropic-effective-harnesses.md` — `https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents`
6. `agents-md-docs.md` — `https://developers.openai.com/codex/guides/agents-md/`
7. `evaluating-agents-md-paper.md` — `https://arxiv.org/abs/2602.11988`
8. `agents-md-spec.md` — `https://github.com/agentsmd/agents.md`
9. `agents-md-2500-study.md` — `https://github.blog/ai-and-ml/github-copilot/how-to-write-a-great-agents-md-lessons-from-over-2500-repositories/`
10. `claude-code-best-practices.md` — `https://code.claude.com/docs/en/best-practices`
11. `openai-skills-catalog.md` — `https://github.com/openai/skills`
12. `codex-agent-approvals-security.md` — `https://developers.openai.com/codex/agent-approvals-security/`
13. `codex-hooks.md` — `https://developers.openai.com/codex/hooks/`
14. `simonw-agentic-patterns.md` — `https://simonwillison.net/2026/Feb/23/agentic-engineering-patterns/`
15. `mcp-official-registry.md` — `https://registry.modelcontextprotocol.io/`
16. `cursor-rules-docs.md` — `https://docs.cursor.com/en/context`
17. `awesome-cursorrules.md` — `https://github.com/PatrickJS/awesome-cursorrules` (examples only; official Cursor docs remain canonical)

Commit:
```bash
git add skills/_refs/ && git commit -m "M6: skills/_refs/ link-only references"
```

Acceptance: 17 files, each with `source_url:` populated.

#### M7 — `skills/mine/execplan/`

Goal: verbatim copy of the user's authored skill from `~/.claude/skills/execplan/` plus a `_meta.json` recording provenance.

```bash
mkdir -p skills/mine/execplan/references
cp ~/.claude/skills/execplan/SKILL.md skills/mine/execplan/SKILL.md
cp ~/.claude/skills/execplan/references/execplan-spec.md \
   skills/mine/execplan/references/execplan-spec.md
cat > skills/mine/execplan/_meta.json <<'JSON'
{
  "name": "execplan",
  "author": "Roman Nikitin",
  "inspired_by": "https://developers.openai.com/cookbook/articles/codex_exec_plans",
  "copied_from": "~/.claude/skills/execplan/",
  "copied_at": "2026-05-16"
}
JSON
```

`skills/mine/README.md`: single-entry list for now; note that this directory grows as new author-original skills emerge.

Commit:
```bash
git add skills/mine/ && git commit -m "M7: copy execplan skill into skills/mine/"
```

Acceptance: `diff ~/.claude/skills/execplan/SKILL.md skills/mine/execplan/SKILL.md` returns nothing.

#### M8 — Templates

Goal: three template files.

`templates/agents-md/research-ml.md` — canonical AGENTS.md template, maximum 150 lines (verify with `wc -l`). Shorter is better: every line must be a non-derivable constraint, command, example, or boundary. Six evidence-backed sections in order: Commands (`uv`, `pytest`, `ruff`, `mypy`, `wandb` invocations), Testing (run all, run single, coverage expectations), Project structure (indented 2-3 level tree: `data/`, `experiments/`, `notebooks/`, `src/<project>/`, `tests/`), Code style (real example function with import conventions + type annotations + docstring), Git workflow (branch names, commit style, when to PR), Boundaries (three subheadings: "Always do" 3-5 rules; "Ask first" 3-5 rules; "Never do" 3-5 rules — e.g. "never commit credentials", "never edit `data/raw/` in place", "never rerun `wandb sync` on archived runs"). Placeholders in curly braces: `{project_name}`, `{python_version}`, `{cuda_version}`.

`templates/claude-md/research-ml.md` — thin shim using Anthropic `@import` syntax. Body:
```markdown
# CLAUDE.md

This file imports `AGENTS.md` so a single source of truth governs both Codex and
Claude Code. To extend or override, add additional content below the imports.

@AGENTS.md

# Personal overrides

Per-developer overrides go in `CLAUDE.local.md` (which is gitignored).
```

The string `@AGENTS.md` appears exactly once in the file. Avoid explanatory text like `See @AGENTS.md` because Claude Code may treat that as a second import.

`templates/execplan/EXECPLAN.md` — canonical ExecPlan skeleton slimmed to section headings + one-sentence prompt per section. Sections: Purpose / Big Picture, Progress, Surprises & Discoveries, Decision Log, Outcomes & Retrospective, Context and Orientation, Plan of Work, Concrete Steps, Validation and Acceptance, Idempotence and Recovery, Artifacts and Notes, Interfaces and Dependencies.

`templates/README.md`: describes the three templates and when to use each.

Commit:
```bash
git add templates/ && git commit -m "M8: templates for AGENTS.md, CLAUDE.md, and ExecPlan"
```

Acceptance: `wc -l templates/agents-md/research-ml.md` is <=150 and every line is a non-derivable constraint, command, example, or boundary. `grep -c '^@AGENTS.md$' templates/claude-md/research-ml.md` = 1 and `grep -c '@AGENTS.md' templates/claude-md/research-ml.md` = 1. EXECPLAN.md has all 12 sections.

#### M9 — `scripts/sync-check.sh` + initial sha seal

Goal: executable bash script + first-run log. Script iterates `_meta.json` files in `skills/_vendored/`, fetches `source_url`, compares sha against `upstream_sha`, emits one line per skill with status `OK` / `DRIFT` / `UNREACHABLE` / `MISSING_META`, plus a summary. Always exit 0; status is per-line.

Full script body at `~/dev/my-way/scripts/sync-check.sh`:
```bash
#!/usr/bin/env bash
# sync-check.sh: report drift between vendored skills and their upstream sources.
set -u
repo_root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$repo_root"

ok=0; drift=0; unreachable=0; missing=0

while IFS= read -r meta; do
  url="$(jq -r '.source_url // empty' "$meta")"
  if [[ -z "$url" ]]; then
    echo "MISSING_META $meta"; missing=$((missing+1)); continue
  fi
  expected="$(jq -r '.upstream_sha // empty' "$meta")"
  body="$(curl -sS -L --fail "$url" 2>/dev/null || true)"
  if [[ -z "$body" ]]; then
    echo "UNREACHABLE $meta"; unreachable=$((unreachable+1)); continue
  fi
  actual="$(printf '%s' "$body" | shasum -a 256 | cut -d' ' -f1)"
  if [[ "$actual" == "$expected" ]]; then
    echo "OK $meta"; ok=$((ok+1))
  else
    echo "DRIFT $meta (expected=$expected actual=$actual)"
    drift=$((drift+1))
  fi
done < <(find skills/_vendored -name _meta.json | sort)

echo "---"
echo "Summary: OK=$ok DRIFT=$drift UNREACHABLE=$unreachable MISSING_META=$missing"
```

Then:
```bash
chmod +x scripts/sync-check.sh
bash scripts/sync-check.sh | tee scripts/sync-check.first-run.log
```

First-run expected: all directly fetched entries report `OK` because the sha is computed from the vendored file. If any skill used the local-cache fallback, `DRIFT` is acceptable only when `_meta.json.local_notes` records the cache path and the entry is reviewed before public release. Any `UNREACHABLE` → investigate URL and adjust `source_url`.

`scripts/README.md`: describes script, invocation, status word interpretation.

Commit:
```bash
git add scripts/ skills/_vendored/superpowers/*/_meta.json && git commit -m "M9: sync-check.sh and initial sha seal"
```

Acceptance: script runs without crashing; one line per vendored skill; summary shows `MISSING_META=0` and `OK + DRIFT + UNREACHABLE = 13`.

#### M10 — Internal review walkthrough

Goal: walk `archetypes/research-ml.md` as fresh onboarding, run link check, capture findings.

```bash
cd ~/dev/my-way
npx -y markdown-link-check '**/*.md' 2>&1 | tee scripts/link-check.log
# Fallback if no npx: grep -nR -oE '\]\(([^)]+)\)' --include='*.md' . | head -200
```

Verify every relative link in `archetypes/research-ml.md` resolves via `test -f`. Check `last_verified` dates in `mcp/` and `tools/`; refresh any past today. Append findings to this plan's `Surprises & Discoveries`. Append to `~/dev/my-way/CHANGELOG.md` under today's date: list of milestones completed, "Phase A done" note.

Commit:
```bash
git add scripts/link-check.log CHANGELOG.md && git commit -m "M10: internal review and link check"
```

Acceptance: `scripts/link-check.log` exists, no `ERROR` lines for relative paths. External-link failures recorded in `Surprises & Discoveries` for follow-up. CHANGELOG records Phase A completion. All 10 milestones checked in this plan's Progress.

#### Idempotence and recovery

Every step is safe to re-run. `mkdir -p` no-ops on existing dirs. `git init` no-ops on existing repo. Writing identical content produces no diff. Re-vendoring a skill overwrites the local copy and recomputes its sha; unchanged upstream → unchanged `_meta.json`.

If a commit fails (pre-commit hook), fix the underlying issue and create a **new** commit; never amend without explicit user request.

If M5 network fetch fails entirely, stop and ask user. Partial failures fall back per-skill with `local_notes` recording the cache path used.

If `~/dev/my-way` already exists from a prior aborted run: inspect. If git repo + tree matches a known milestone state, resume from next pending milestone. Otherwise stop and ask user. **Never** delete or force-reset existing tree without explicit confirmation.

Publish step is **optional** and **not** part of Phase A acceptance. Documented in Phase C below; runs only on explicit user confirmation.

#### Stable interfaces (contracts for downstream consumers)

Downstream projects link `my-way` files by GitHub-relative URL. The stable contract:

- `my-way/archetypes/<archetype>.md` — per-archetype recommendation document.
- `my-way/principles/<slug>.md` — frontmatter (`name`, `sources`) + 5 sections (Core idea, Why it matters, How to apply, Anti-patterns, References).
- `my-way/mcp/<slug>.md`, `my-way/tools/<slug>.md` — frontmatter (`name`, `type`, `archetypes`, `status_by_archetype`, `last_verified`; MCP also `registry_url` and `registry_status`).
- `my-way/skills/_vendored/<group>/<slug>/{SKILL.md,_meta.json}` — sidecar must include `name`, `source_url`, `upstream_repo`, `upstream_version`, `upstream_sha`, `fetched_at`, `local_notes`.
- `my-way/skills/_refs/<slug>.md` — frontmatter (`name`, `source_url`, `last_verified`).
- `my-way/skills/mine/<slug>/{SKILL.md,_meta.json}` — sidecar must include `name`, `author`, provenance field (`copied_from`, `inspired_by`, ...).
- `my-way/templates/agents-md/<archetype>.md` — maximum 150 lines, 6 sections, 3-tier boundaries, no derivable filler.
- `my-way/templates/claude-md/<archetype>.md` — must contain exactly one standalone `@AGENTS.md` import line.
- `my-way/scripts/sync-check.sh` — emits `OK` / `DRIFT` / `UNREACHABLE` / `MISSING_META` per skill; exit code always 0.

No external services required for any acceptance step. Network access only during M5 fetch and M9 first-run; both have local-cache fallbacks.

### Phase B — Remaining four archetypes
For each of `trading-data`, `agent-workflow`, `docs-pm`, `prototype`:
1. Author `archetypes/<name>.md`.
2. Add MCP/tool entries not yet present (respecting the top-5 cap).
3. Vendor any additional skills referenced (e.g., openspec for `agent-workflow`).
4. Author `templates/agents-md/<name>.md` and `templates/claude-md/<name>.md`.
5. Add `archetypes/README.md` once all five are present, with a one-line selection guide.
6. Confirm `tools/agentlint.md` remains optional generic harness-audit tooling, not a mandatory archetype gate.

### Phase C — Polish and publish
1. Cross-link all docs: archetype → MCP/tool/skill/template paths; skill → archetype it serves.
2. Run `markdown-link-check` (added as a tool entry too) over the whole repo.
3. Run `scripts/sync-check.sh` once to seal initial `_meta.json` shas.
4. Tag `v0.1` and push to GitHub. Public repo, MIT license unless specified otherwise.
5. Append summary to `CHANGELOG.md`.

## Acceptance Criteria
- `~/dev/my-way` exists with the layout above.
- All five archetype documents present and self-contained (no `TODO`/`TK` placeholders left).
- Every skill referenced from an archetype resolves to a real file under `skills/mine/`, `skills/_vendored/`, or `skills/_refs/`.
- `scripts/sync-check.sh` runs without error on a clean checkout.
- `markdown-link-check` passes on the repo.
- `README.md` documents how to consume the repo from another project (link, copy, fork instructions; no `init` CLI required).
- No secrets committed.

## Validation Plan
- Confirm `~/dev/my-way` file tree matches the approved design (manual `tree` diff against the layout above).
- Walk one archetype as a "new project onboarding" and note missing pieces in `Surprises & Discoveries`.
- Run `scripts/sync-check.sh` and verify it prints expected entries.
- Run `markdown-link-check **/*.md`.
- Verify the repo can be linked from another project by referencing `archetypes/<name>.md` directly via GitHub URL.

## Out of Scope For Now
- Bootstrap CLI / `my-way init` (explicitly deferred).
- Success metrics / KPIs for the repo (explicitly deferred).
- Anti-catalog as a separate top-level section (folded into per-entry `Known issues`).
- Multi-format SKILL emission (`.cursor/`, `.continue/`); start with one format and add adapters later if needed.
- Promoting project-local skills (`notion-sync`, `new-epic`, `memory-search`, `notion-curate`, `program-reporting`) into `skills/mine/` — they remain local to their projects.

## Web Research Findings (2026-05-16)

Searched for and reviewed additional public best-practice sources beyond the three user-supplied references. Findings below are integrated into design above; this section preserves citations and any concrete numbers worth keeping.

### Evidence-backed AGENTS.md study (GitHub Blog, 2500 repos)
Source: https://github.blog/ai-and-ml/github-copilot/how-to-write-a-great-agents-md-lessons-from-over-2500-repositories/
- Use this source for practical `AGENTS.md` shape, not for the arXiv AGENTbench cost/success numbers.
- 6 high-impact sections: (1) commands with flags, (2) testing, (3) project structure, (4) code style with real examples, (5) git workflow, (6) explicit boundaries.
- 3-tier boundary framework (always do / ask first / never do) is a strong default.
- Procedural workflows (numbered multi-step) move agents from "unable to complete" to "first-try correct" on individual tasks.
- Decision tables for "two or three reasonable ways" force the choice up front.
- Anti-patterns: vague persona ("you are a helpful coding assistant"), missing version specificity ("React project" vs "React 18 + TypeScript + Vite + Tailwind"), tool names without flags/options, descriptions instead of code samples.

### Evaluating AGENTS.md paper (arXiv, 2026)
Source: https://arxiv.org/abs/2602.11988
- Use this source for the warning that repository context files can reduce task success and increase inference cost when they add unnecessary requirements.
- The paper reports that both LLM-generated and developer-provided context files encourage broader exploration such as more testing and file traversal.
- The actionable takeaway for `my-way`: root context files should be hand-curated and minimal. Include only non-derivable requirements that prevent real mistakes.

### OpenAI Harness Engineering
Source: https://openai.com/index/harness-engineering/
- Use this source for repo-local knowledge as system of record, short `AGENTS.md` as a table of contents, app/log/metric legibility, mechanical architecture constraints, and ongoing entropy cleanup.
- Concrete additions to `my-way`: `principles/mechanical-guardrails.md`, `principles/progressive-disclosure.md`, and explicit validation/audit hooks in archetypes.

### Anthropic Claude Code best practices (official)
Source: https://code.claude.com/docs/en/best-practices
- "Give Claude a way to verify its work" is the single highest-leverage pattern.
- Explore → Plan → Implement → Commit is the recommended 4-phase workflow. Plan mode optional for small scopes.
- CLAUDE.md hygiene: keep short; ask "would removing this cause Claude to make mistakes?" for each line. Bloated CLAUDE.md gets ignored.
- CLAUDE.md placements: `~/.claude/CLAUDE.md` (global), `./CLAUDE.md` (shared), `./CLAUDE.local.md` (personal, .gitignore), parent/child directories auto-loaded.
- Import syntax: `@path/to/import` inside CLAUDE.md — useful for generating thin shims.
- Skill format confirmed: `.claude/skills/<name>/SKILL.md` with YAML frontmatter (`name`, `description`, optional `disable-model-invocation`). Same shape as Codex.
- Subagent format: `.claude/agents/<name>.md` with frontmatter (`name`, `description`, `tools`, `model`).
- 5 failure patterns explicitly catalogued: kitchen sink session, repeated correction, over-specified CLAUDE.md, trust-then-verify gap, infinite exploration.
- Recovery primitives: `Esc`, `Esc+Esc`/`/rewind`, `/clear`, `/compact <instructions>`, `/btw` (overlay answer that doesn't enter context).

### Anthropic effective harnesses deep-dive
Source: https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents
Use as a separate harness reference, not as a replacement for the OpenAI source above. Keep it in `_refs/anthropic-effective-harnesses.md`.

### AGENTS.md open spec
Source: https://github.com/agentsmd/agents.md (21.4k stars, MIT, organization-backed)
Lightweight open format; sections shown are common-not-mandatory: dev environment tips, testing instructions, PR instructions. Useful as the cross-vendor anchor. Codex reads `AGENTS.md`; Claude Code gets the same content through a thin `CLAUDE.md` import shim.

### OpenAI Skills curated catalog
Source: https://github.com/openai/skills
Same `SKILL.md` format (YAML frontmatter + Markdown). Progressive disclosure: agent sees name/description/path first, loads body only on use. Reinforces `my-way` decision to standardize on `SKILL.md` and link to upstream rather than reinvent.

### OpenAI Codex hooks and approvals/security
Sources: https://developers.openai.com/codex/hooks/ and https://developers.openai.com/codex/agent-approvals-security/
Use these sources for deterministic guardrails around agent work: hooks for checks that should run mechanically, approval policy for unsafe/destructive work, and security guidance for prompt-injection and secret exposure risks. Feed these into `principles/mechanical-guardrails.md`.

### Simon Willison's Agentic Engineering Patterns
Source: https://simonwillison.net/2026/Feb/23/agentic-engineering-patterns/
Pattern catalog modeled after Gang of Four. His three daily patterns: red/green TDD, templates, hoarding. Premise "writing code is cheap now" drives the rest. Worth tracking as living reference; `_refs/simonw-agentic-patterns.md`.

### Official MCP Registry
Source: https://registry.modelcontextprotocol.io/ (preview Sept 2025, Anthropic/GitHub/Microsoft-backed)
THE catalog for MCP servers. `my-way/mcp/` should not compete with this; it should curate-and-annotate from it. Each `mcp/<name>.md` gets a `registry_url` field.

### Cursor rules format migration
Primary source: https://docs.cursor.com/en/context
Examples source: https://github.com/PatrickJS/awesome-cursorrules
Legacy `.cursorrules` is deprecated; new format is `.cursor/rules/*.mdc` (MDC with metadata and content). `my-way` templates for Cursor should target `.mdc`, not `.cursorrules`. Community collections are examples only, not canonical guidance.

### AgentLint harness audit
Source: https://www.agentlint.app/
AgentLint audits `AGENTS.md`, `CLAUDE.md`, `.cursor/rules`, GitHub Copilot instructions, CI, hooks, and `.gitignore`. Add `tools/agentlint.md` as optional harness-health tooling. Do not make it mandatory in Phase A acceptance because it is a third-party tool and the repo can still be useful without it.

### Agent memory state of the art (2026)
Sources: https://mem0.ai/blog/state-of-ai-agent-memory-2026, https://github.com/rohitg00/agentmemory, https://machinelearningmastery.com/the-6-best-ai-agent-memory-frameworks-you-should-try-in-2026/
- Memory is now first-class architectural component with benchmark suite (LoCoMo).
- Hybrid memory (vector search + graph traversal) is 2026 state of the art.
- Repo-native behavioral controls (AGENTS.md, skill files, runbooks under source control) > tribal chat memory. Reinforces design direction.
- Worth referencing from `principles/memory-hygiene.md` as upstream evidence. Not adopting any specific framework into `my-way` yet — user's local memory pattern (ark `memory/index.md` + `memory/context.md` + `memory/feedback/` + `memory/knowledge/`) is independent of these and remains the in-project recommendation.

### Concrete design changes resulting from research
1. `principles/` expanded from 5 to 10 entries (added `instruction-minimalism`, `mechanical-guardrails`, `explore-plan-implement`, `progressive-disclosure`, `context-management`).
2. `mcp/<name>.md` schema adds `registry_url` field; `mcp/README.md` defers to Official Registry as source of truth.
3. `templates/agents-md/<archetype>.md` target <=150 lines; ship the 6 evidence-backed sections and 3-tier boundary framework as defaults, while applying instruction minimalism as the stricter rule.
4. `templates/claude-md/<archetype>.md` becomes a thin `@import` shim referencing the canonical AGENTS.md.
5. `skills/_refs/` expanded with primary references for arXiv AGENTS.md evaluation, OpenAI harness engineering, Codex hooks/security, Cursor rules, MCP registry, OpenAI skills, and community pattern catalogs.
6. Anti-patterns explicitly listed in each `archetypes/<name>.md` pitfalls section: LLM-generated AGENTS.md, instruction bloat, vague persona, missing version specificity, bloated CLAUDE.md, the 5 Anthropic failure patterns where applicable.
7. `principles/verification.md` reframed as "highest leverage" rather than one principle among many.
8. `tools/agentlint.md` added as optional harness audit tooling, not a mandatory gate.

## Surprises & Discoveries
- 3 of 8 reference projects live under `~/dev/3lgn/` rather than `~/dev/` directly. Captured in Reference Projects section above.
- `frontend-design` and `code-simplifier` ship as public plugins, not user-authored skills. Reclassified to `_vendored/`.
- OpenSpec and superpowers ship in both Codex and Claude formats in reference projects, creating drift; `my-way` standardizes on one `SKILL.md` format and generates adapters only if needed.
- `mastergptchatflow`, `mastra`, `xlstm-predictor` have empty or stub `.codex/skills/` — cargo-cult pattern to call out in archetype pitfalls.
- `execplan` is a user-authored skill inspired by the OpenAI ExecPlans cookbook; belongs in `skills/mine/`, not `_vendored/`.
- During execution, user requested more durable local content for critical sources. `principles/karpathy-guidelines.md` now includes an archived MIT-licensed local copy, and the plan now distinguishes full local archives from copyrighted-source distillations.
- The literal `markdown-link-check '**/*.md'` command did not work in the local shell. Working command used: `find . -name "*.md" -not -path "./.git/*" -print0 | while IFS= read -r -d "" file; do npx -y markdown-link-check -c .markdown-link-check.json "$file"; done`.
- `skills/mine/execplan/references/execplan-spec.md` contains an intentional `localhost` example link, so `.markdown-link-check.json` ignores localhost URLs.

## Decision Log
- 2026-05-15: Codex-first with adapters chosen over fully tool-neutral approach. Drift to be managed with single `SKILL.md` source.
- 2026-05-15: Manual setup chosen over `my-way init` CLI. Reason: lower maintenance, single source of truth in docs.
- 2026-05-16: MCP/tools/skills/plugins catalog elevated to first-class section after user found it the most novel idea.
- 2026-05-16: Five archetypes (game folded into prototype). Reason: reduce duplication.
- 2026-05-16: `last_verified` date and sha-based sync chosen over semver for now. Lower friction, sufficient for solo use.
- 2026-05-16: Phase A POC on `research-ml` chosen over scaffolding all five at once. Reason: cheaper iteration.
- 2026-05-16: MCP catalog defers to Official MCP Registry as source of truth; `my-way/mcp/` is archetype-annotated curation, not a competing catalog. Reason: registry is Anthropic/GitHub/Microsoft-backed and already exists.
- 2026-05-16: AGENTS.md templates capped at 150 lines and governed by instruction minimalism. Reason: GitHub's guide supports compact practical sections; the arXiv AGENTS.md paper warns that unnecessary context increases exploration/cost and can reduce success.
- 2026-05-16: 3-tier boundary framework (always do / ask first / never do) adopted for all archetype templates. Reason: dominant pattern in high-performing files.
- 2026-05-16: CLAUDE.md templates use exactly one Anthropic `@import` line to shim AGENTS.md. Reason: avoid double-maintenance drift and duplicate context across the two formats.
- 2026-05-16: Principles list expanded from 5 to 10 to capture instruction minimalism, mechanical guardrails, Anthropic playbook patterns, progressive disclosure, and context management. Reason: these are independently load-bearing and reused across archetypes.
- 2026-05-16: 10 principles confirmed. CLAUDE.md `@import` shim approach confirmed. AGENTS.md is the canonical source for Codex and other AGENTS.md-aware tools; Claude Code receives the same content through the shim. mem0/agentmemory excluded from `memory-hygiene.md` (runtime frameworks, not patterns).
- 2026-05-16: Vendored skill provenance now requires license metadata and copied upstream license files when available. Reason: public repo redistribution needs clean provenance.
- 2026-05-16: AgentLint added as optional harness-audit tooling, not a Phase A gate. Reason: useful third-party audit, but the repo should remain usable without it.
- 2026-05-16: Critical-source archival added after user feedback. Reason: if an upstream MIT skill or guideline disappears, `my-way` should still preserve enough local content to be useful.
- 2026-05-16: Research artifacts are file-backed by default. Reason: current project needs do not justify Postgres or another database as artifact infrastructure; database MCP access should follow existing project architecture, not create it.
- 2026-05-16: Created public GitHub repository `rnikitin/my-way` and pushed local `main`. Initial SSH push failed because the local key was not accepted; switched this repo's remote to HTTPS and pushed successfully.
- 2026-05-16: Public README polish requested. Approach: rewrite `~/dev/my-way/README.md` as the repo's public landing page, make every directory README describe local structure and navigation to the next relevant files, and make `_refs/` an annotated catalog rather than a list of blind links. Set a short GitHub repository description.
- 2026-05-16: `frontend-design` gap found during review. Decision: local Codex-home skills that are useful across projects belong in `skills/mine/` with `_meta.json` provenance, not only in a machine-local skill directory. Added `frontend-design` and `code-simplifier`.
- 2026-05-16: AgentLint run requested. Plan: run the current `agentlint-ai` CLI with `npx`, capture findings, evaluate them against local design decisions, and only patch findings that are technically correct for `my-way`.
- 2026-05-17: AgentLint should be generalized after proving useful on `my-way`. Plan: add a `harness-audit` principle, promote AgentLint from optional to recommended across archetypes, and document a run cadence: bootstrap, before public release, and whenever root instructions, skills, hooks, workflows, safety files, or validation commands change.
- 2026-05-17: Extended AgentLint run requested. Core+Deep scored `94/100`; strict Session had no matching `my-way` Claude logs; redacted global Session produced clean `10/10` records but was not project-specific. Deep flagged one dead-weight `AGENTS.md` rule and two vague boundaries; patch valid findings and document Deep/Session behavior.

## Progress
- [x] Create this active plan file.
- [x] Read current repo entrypoint docs relevant to planning.
- [x] Read the supplied local attachment.
- [x] Locate and inspect the listed projects without modifying them.
- [x] Review the linked external articles.
- [x] Identify cross-project patterns, gaps, and useful boilerplate candidates.
- [x] Ask focused clarification questions (brainstorming).
- [x] Present 2-3 repository architecture options and converge on chosen approach.
- [x] Get user approval for the design (turn-by-turn confirmation).
- [x] Write the design spec (this plan).
- [x] Web research for additional useful references beyond the initial three.
- [x] User approval of design refinements driven by web research.
- [x] Expand Phase A into milestone-by-milestone executable steps with concrete commands, file shapes, acceptance, idempotence, and downstream interfaces.
- [x] Phase A execution: M1 (bootstrap skeleton).
- [x] Phase A execution: M2 (principles, 10 files + README).
- [x] Phase A execution: M2a (archive Karpathy guidelines locally after user feedback).
- [x] Phase A execution: M3 (`archetypes/research-ml.md`).
- [x] Phase A execution: M4 (MCP + tools catalog).
- [x] Phase A execution: M5 (vendor 13 superpowers skills).
- [x] Phase A execution: M6 (`skills/_refs/` 17 entries).
- [x] Phase A execution: M7 (`skills/mine/execplan/`).
- [x] Phase A execution: M8 (templates: agents-md, claude-md, execplan).
- [x] Phase A execution: M9 (`scripts/sync-check.sh` + initial sha seal).
- [x] Phase A execution: M10 (internal review + link check).
- [x] Phase A correction: make research artifacts file-backed by default and downgrade Postgres MCP for research-ml.
- [x] Publish current `main` to public GitHub repository `https://github.com/rnikitin/my-way`.
- [x] Improve all README navigation files and GitHub repository description.
- [x] Add missing local maintained skills (`frontend-design`, `code-simplifier`) and make `_refs/openai-skills-catalog.md` navigable.
- [x] Run AgentLint and address valid findings.
- [x] Promote AgentLint to general harness-audit principle and recommendation.
- [x] Run AgentLint Deep + Session and address valid findings.
- [ ] Phase B: author the remaining four archetypes.
- [ ] Phase C: polish, link-check, sync-check, publish v0.1.
