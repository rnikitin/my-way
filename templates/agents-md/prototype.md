# {project_name} Prototype Project

## Commands

- Install/sync: `{install_command}`
- Start dev server or runtime: `{dev_command}`
- Build/package check: `{build_command}`
- Run all tests: `{test_command}`
- Run one test: `{single_test_command}`
- Browser or runtime smoke: `{smoke_check_command}`
- Lint: `{lint_command}`
- Format check: `{format_check_command}`
- Type/schema check: `{type_or_schema_check_command}`
- Harness audit: `npx -y -p agentlint-ai agentlint check --project-dir . --format terminal`

## Testing

- Add tests for core state transitions, parsing, rules, data transforms, API contracts, and reusable UI logic.
- Keep the primary user flow covered by a browser, runtime, or manual smoke check that can be repeated.
- For UI changes, check desktop and mobile viewports, console errors, asset loading, focus states, and text overlap.
- Do not claim the prototype works until the relevant test command and primary runtime smoke check have run.

## Project Structure

```text
docs/
  brief.md
  decisions/
  verification/
memory/
  index.md
  context.md
plans/
public/
scripts/
src/
tests/
AGENTS.md
README.md
```

## Code Style

- Follow the existing stack, framework, and design-system conventions before adding new patterns.
- Build the usable experience as the first screen; do not replace it with a marketing page unless explicitly requested.
- Keep components, state, assets, and data fixtures separated enough that fake pieces are visible.
- Prefer small, reversible changes while the product question is still unstable.
- Keep generated assets and screenshots out of commits unless they are intentional fixtures.
- Label fake data, stubs, simulated services, and unsupported paths in code or docs.

## Git Workflow

- Check `git status --short` before editing.
- Keep product surface, test fixtures, generated assets, and documentation changes in separate commits when practical.
- Update README or verification docs when install, run, build, test, or smoke commands change.
- Do not commit `.env`, credentials, private data, production exports, generated screenshots, or heavy run outputs.
- Commit messages should state the user-visible flow, runtime behavior, or verification gate changed.
- Do not rewrite shared history unless explicitly requested.

## Boundaries

### Always Do

- State the prototype goal, target user, first useful flow, and promotion boundary.
- Use the project-native install, dev, build, test, lint, and type commands when they exist.
- Start the local runtime after meaningful UI or interaction changes and verify the primary flow.
- Check responsive behavior for browser UI.
- Preserve existing design-system patterns unless the task explicitly asks for a redesign.
- Run a harness audit after changing root instructions, validation commands, handoff files, workflows, hooks, skills, security files, or release gates.

### Ask First

- Adding large dependencies, new package managers, auth, payments, analytics, storage, background jobs, or hosted infrastructure.
- Connecting to production APIs, customer data, private workspaces, or paid services.
- Publishing or deploying outside the local workspace.
- Expanding scope beyond the first useful flow or changing the promotion criteria.

### Never Do

- Never commit secrets, raw credentials, private datasets, customer records, or production exports.
- Never use real payments, real emails, real orders, or destructive external actions in a prototype without explicit approval.
- Never claim visual or interactive work is complete without opening the target runtime or running the agreed smoke check.
- Never hide fake data, fake auth, or simulated integrations as if they were production behavior.
- Never add a database or external storage just to hold prototype artifacts.
- Never leave the user without the command or URL needed to run the prototype locally.
