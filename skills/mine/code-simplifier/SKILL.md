---
name: code-simplifier
description: Simplify and refine code for clarity, consistency, and maintainability while preserving exact behavior. Use for safe refactors and cleanup, especially on recently modified code or a provided diff.
---

# Code Simplifier

Simplify code without changing what it does. Prefer explicit, readable code over compact or clever code.

## Scope

1. If the user specifies files, modules, or a diff, only work within that scope.
2. Otherwise, focus on recently modified code using `git diff` and `git status`.
3. Do not expand the scope unless the user explicitly asks.

## Non-Negotiables

- Do not change external behavior, outputs, side effects, error semantics, or public APIs.
- Do not change logging or telemetry semantics unless explicitly requested.
- Avoid broad formatting churn.
- Do not introduce clever abstractions; optimize for maintainability and debuggability.

## Apply Project Standards

1. Locate and follow repo conventions such as `AGENTS.md`, `README.md`, `.editorconfig`, formatters, linters, and adjacent patterns.
2. Keep naming, file layout, and import style consistent with the surrounding codebase.
3. If conventions conflict with this skill, defer to the repository's conventions.

## Refactoring Heuristics

- Reduce nesting with guard clauses and early returns.
- Replace nested ternaries with clear branches.
- Prefer clear, specific names.
- Consolidate duplicated logic only when it improves readability.
- Remove redundant comments; keep comments that explain intent or invariants.
- Prefer straightforward control flow over indirection when it improves traceability.
- Use mechanical refactors when possible.

## TypeScript And React Preferences

Apply these only when they match the repository style:

- Keep ES module imports tidy and consistently ordered.
- Prefer explicit exported function/component names.
- Use explicit props types for React components.
- Avoid adding new `try/catch` blocks when the local pattern relies on error propagation.
- Keep exported function return types explicit when established locally.

## Verification

1. Run the narrowest relevant checks for the touched area.
2. If the repo has a standard command, use it.
3. If checks cannot run, state what should be run and why.

## Output Expectations

- Summarize only the changes that matter for review.
- List touched files.
- Call out non-obvious risk areas even if behavior is intended to be unchanged.

