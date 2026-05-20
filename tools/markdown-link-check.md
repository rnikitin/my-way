---
name: markdown-link-check
type: tool
archetypes: [docs-pm]
status_by_archetype:
  docs-pm: mandatory
last_verified: 2026-05-19
sources:
  - https://github.com/tcort/markdown-link-check
---

# markdown-link-check

**Purpose.** Check Markdown links so public docs, plans, templates, and handoff files do not accumulate dead local references or stale external links.

**Install.** Use `npx -y markdown-link-check` for ad hoc checks, or add the package as a dev dependency when the target project already has a Node toolchain.

**Config.** Keep project-specific ignores in a committed config file such as `.markdown-link-check.json`. Document every broad ignore pattern with the reason it is safe.

**When to use.** Use for docs-first repos, product specs, public READMEs, link-heavy reference files, release notes, and generated documentation that must stay navigable.

**When to skip.** Skip for private scratch notes, generated local artifacts, or offline work where network checks would be noisy. Local relative links should still be checked before publication.

**Cost.** Network checks can be slow and occasionally flaky. Prefer explicit ignore patterns for known live sites that the checker cannot reach reliably.

**Conflicts.** Some sites block automated clients or return transient status `0` even when `curl` can fetch them. Verify those cases manually before ignoring them.

**Known issues / when not to use.** Do not treat ignored links as permanently healthy. Revisit ignores when source sites, docs hosts, or package versions change.

**References.** Upstream GitHub repository.
