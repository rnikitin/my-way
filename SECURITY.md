# Security Policy

## Reporting

Report security issues privately to Roman Nikitin. Do not open a public issue for secrets, credential exposure, supply-chain problems, or vulnerabilities that could affect users.

## Scope

This repository is currently documentation-first. The main risks are:

- accidentally committed secrets or private paths
- unsafe setup guidance copied into other projects
- stale links to tooling or security guidance
- vendored skills without clear provenance

## Maintainer Expectations

- Keep `.env` and local credential files ignored.
- Preserve source URLs, licenses, and fetch metadata for vendored material.
- Treat automated recommendations as review input, not authority.
- Prefer narrow, explicit setup instructions over broad install scripts.

