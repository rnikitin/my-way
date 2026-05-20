# {project_name} Docs PM Project

## Commands

- Install/sync docs tooling: `{install_command}`
- Lint docs: `{docs_lint_command}`
- Link check: `{link_check_command}`
- Sync/drift check: `{sync_check_command}`
- Render/export check: `{render_check_command}`
- Harness audit: `npx -y -p agentlint-ai agentlint check --project-dir . --format terminal`

## Testing

- Add or update validation when changing navigation, generated indexes, templates, release notes, public docs, handoff files, or source-card references.
- Check local relative links before publication; document any external-link ignore with the exact reason.
- Treat docs lint, link check, sync check, and render/export checks as separate evidence types.
- Do not claim a spec, release note, or handoff is complete unless its acceptance criteria and validation evidence are recorded.

## Project Structure

```text
docs/
  decisions/
  specs/
  reports/
  releases/
memory/
  index.md
  context.md
plans/
scripts/
templates/
AGENTS.md
CHANGELOG.md
HANDOFF.md
README.md
```

## Documentation Style

- Public docs are written in English unless the repository explicitly says otherwise.
- Keep README files navigational: local structure, when to open each file, and nearby links.
- Prefer dated decisions with status, owner, context, consequences, and follow-up verification.
- Separate facts, assumptions, decisions, open questions, and action items.
- Preserve source provenance for copied or adapted material: URL, license, fetched date, upstream revision when available, and local notes.
- Do not copy long upstream articles; summarize locally and link to the source.
- Keep root instructions compact; move rationale into deeper docs, principles, or source cards.

## Git Workflow

- Check `git status --short` before editing.
- Keep navigation, templates, source cards, and generated artifacts in separate commits when practical.
- Update `CHANGELOG.md` for public-facing structural changes.
- Update `HANDOFF.md` when status, next work, validation conditions, or known tradeoffs change.
- Do not commit private exports, raw transcripts, credentials, or generated validation reports unless explicitly intended as fixtures.
- Do not rewrite shared history unless explicitly requested.

## Boundaries

### Always Do

- Name the source of truth and sync direction before reconciling repo docs with Notion, tickets, or other systems.
- Read the nearest README before editing a docs subdirectory.
- Add acceptance criteria to specs, roadmaps, and release plans.
- Keep generated local outputs out of commits by default.
- Run a harness audit after changing root instructions, validation commands, handoff files, workflows, hooks, skills, security files, or release gates.
- Record what was verified and what remains open.

### Ask First

- Adding CI, release automation, new package managers, hosted docs, or heavyweight dependencies.
- Publishing private docs, syncing to external systems, or changing the declared source of truth.
- Deleting decision history, archiving active plans, or rewriting accepted decisions.
- Exporting private Notion, ticket, customer, or meeting content into the repo.

### Never Do

- Never commit secrets, raw credentials, private datasets, customer records, or unredacted transcripts.
- Never let Notion, tickets, or external docs override repository instructions without explicit reconciliation.
- Never leave blind links in public docs.
- Never present draft notes as accepted decisions.
- Never make AgentLint or any generic audit the only quality gate.
- Never add a database or external storage just to hold documentation artifacts.
