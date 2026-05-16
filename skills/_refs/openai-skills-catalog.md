---
name: openai-skills-catalog
source_url: https://github.com/openai/skills
last_verified: 2026-05-16
copy_policy: summarize-and-link
license: MIT
---

# OpenAI Skills Catalog

OpenAI's skills catalog is the upstream example for the `SKILL.md` convention: a skill is a folder with YAML frontmatter, Markdown instructions, and optional supporting resources. Codex discovers the skill by name, description, and path, then loads the full body only when the task triggers it.

## Why Go Upstream

Open this source when you need to:

- check the current Codex skill folder shape
- find installable public skills
- compare naming, frontmatter, and description style
- decide whether a workflow should become a skill rather than more `AGENTS.md` prose
- inspect how OpenAI separates system, curated, and tool-specific skills

Do not use it as a dumping ground. A skill belongs in `my-way` only when it is repeatedly useful across projects or important enough to preserve locally.

## Upstream Structure

| Upstream area | What it contains | How `my-way` uses it |
|---------------|------------------|----------------------|
| `skills/.system/` | Built-in Codex skills such as `openai-docs`, `skill-creator`, and `skill-installer`. | Reference only; these should usually stay installed through Codex rather than copied. |
| `skills/.curated/` | Public reusable skills for products and workflows: GitHub, Figma, Notion, Playwright, deployment providers, OpenAI docs, security, notebooks, PDFs, and media utilities. | Source of candidates for `_refs/` or future vendoring when a skill becomes part of a stable archetype. |
| skill directories | `SKILL.md` plus optional supporting files. | Confirms that `SKILL.md` should remain the canonical local skill format. |
| per-skill licenses | License files inside individual skill folders. | Reminder to preserve provenance before vendoring anything. |

## Relevant Skill Families To Watch

| Family | Examples | Why it matters |
|--------|----------|----------------|
| GitHub workflow | `gh-address-comments`, `gh-fix-ci`, `yeet` | Useful for PR review, CI repair, and publishing flows. |
| Browser and UI verification | `playwright`, `playwright-interactive`, `screenshot` | Useful for frontend/prototype archetypes and visual checks. |
| Product knowledge connectors | `notion-*`, `linear` | Useful for docs/PM and product implementation workflows. |
| Frontend/design tooling | `figma-*` | Useful when a project needs design-to-code or design-system work. |
| OpenAI/product docs | `openai-docs`, `chatgpt-apps`, `migrate-to-codex` | Useful when implementation depends on current OpenAI APIs or Codex behavior. |
| Security | `security-best-practices`, `security-ownership-map`, `security-threat-model` | Useful for hardening agent-created apps and public repos. |

## Local Decision

`my-way` standardizes on `SKILL.md` for authored and vendored skills, then adapts to other tools only when needed. The local catalog currently keeps personal skills in [`../mine/`](../mine/), vendored public skills in [`../_vendored/`](../_vendored/), and source cards in this directory.

For example, `frontend-design` is not from this OpenAI catalog; it is a locally maintained skill now stored at [`../mine/frontend-design/SKILL.md`](../mine/frontend-design/SKILL.md).

