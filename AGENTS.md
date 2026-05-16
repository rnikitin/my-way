# My Way Agent Instructions

This project is a public documentation repository for reusable AI-agent project practices.

## Project Description

`my-way` is a public documentation repository for reusable AI-agent project practices. It contains archetypes, `AGENTS.md` templates, skills, MCP notes, tool notes, memory guidance, and verification habits that can be copied or linked from other projects.

This repository is docs-first. It does not ship a bootstrap CLI, application runtime, package manifest, or test suite.

## Commands

- Test: `make test`
- Lint docs: `make lint`
- Sync check: `make sync-check`
- Link check: `make link-check`
- AgentLint audit: `npx -y -p agentlint-ai agentlint check --project-dir . --format terminal`

There is no build command because this repository has no runtime application.

## Local test

Run these checks before committing documentation, templates, skills, or references:

```bash
bash tests/docs-check.test.sh
make test
```

Run AgentLint as a harness audit at bootstrap, before public release, and when changing root instructions, skills, hooks, workflows, validation commands, handoff files, or security files:

```bash
npx -y -p agentlint-ai agentlint check --project-dir . --format terminal
```

## Conditional Loading Guidance

Load only the section needed for the task:

- If a task changes a specific directory, read that directory's `README.md` before editing files there.
- Use `archetypes/` when applying `my-way` to a real project type.
- Use `templates/` when copying starter files such as `AGENTS.md`, `CLAUDE.md`, or `EXECPLAN.md`.
- Use `skills/` when reviewing reusable `SKILL.md` workflows.
- Use `skills/_refs/` when checking the source rationale behind a local rule.
- Use `principles/` when evaluating whether a rule belongs in a root instruction file or deeper reference.
- Use `mcp/` and `tools/` when deciding runtime setup.
- Use `HANDOFF.md` for current repo status and verification conditions.

## Documentation Rules

- Keep public docs in English.
- Keep each README navigational: describe local structure, explain how to choose the next file, and link to nearby entries.
- Do not leave blind links.
  Because: reference files should explain why the source matters and when to open it.
- Keep root instructions compact. Move long explanations into principles, archetypes, skills, or references.
- Preserve source provenance for copied or adapted material: source URL, license, fetched date, upstream SHA when available, and local notes.
- Do not copy copyrighted sources wholesale.
  Because: distillation plus a source link keeps the repo useful without redistributing protected text.
- Open-licensed sources may be archived locally when source durability matters.

## Specific Rules

- Do not add a bootstrap CLI.
  Because: the current design is intentionally docs-first and low-maintenance.
- Do not copy long upstream articles.
  Because: copyright and source drift make short local distillations safer.
- Do not make AgentLint the only quality gate.
  Because: local project intent can be more specific than generic audit rules.
- Do not add a database for artifacts.
  Because: file-backed artifacts are the current repository policy.

## Skill Rules

- Use `SKILL.md` as the canonical skill format.
- Put locally maintained skills under `skills/mine/`.
- Put copied public skills under `skills/_vendored/` with `_meta.json` and upstream license metadata.
- Put source cards under `skills/_refs/` when the upstream source should remain canonical elsewhere.
- Do not silently edit vendored skill content.
  Because: local divergence must be visible in `_meta.json`.

## Artifact Rules

- Store validation reports outside the repo unless a README, principle, template, or test fixture links to them as durable examples.
- Keep generated local outputs out of commits by default.
- Do not add databases or external storage just to hold research artifacts.
  Because: local file-backed artifacts are the default until a project has a real storage requirement.

## Safety Rules

- Never commit secrets, tokens, private datasets, or raw credentials.
- Never add broad auto-install or bootstrap scripts without an explicit maintenance reason.
- Never rewrite public git history unless explicitly requested.
- Ask before adding CI, new package managers, release automation, or heavyweight dependencies.

## Commit Rules

- Update `CHANGELOG.md` for public-facing structural changes.
- Re-run the local checks after changing root instructions, README navigation, skills, templates, or link-heavy reference files.
