# CLAUDE.md Templates

This directory contains thin Claude Code shims by archetype. The default pattern is to keep `AGENTS.md` canonical and make `CLAUDE.md` import it once.

## Structure

Each file should be very small, usually a single `@AGENTS.md` import line plus no duplicated instructions. This prevents drift between Codex and Claude Code guidance.

## How To Navigate

First copy the matching [AGENTS.md template](../agents-md/) into the target project. Then copy the corresponding shim from this directory only if Claude Code is used in that project.

Available templates:

- [research-ml.md](research-ml.md)

