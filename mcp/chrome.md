---
name: chrome
type: mcp
archetypes: [research-ml, prototype, agent-workflow]
status_by_archetype:
  research-ml: recommended
  prototype: recommended
  agent-workflow: recommended
last_verified: 2026-05-16
registry_url: null
registry_status: not-found-2026-05-16
sources:
  - https://developer.chrome.com/docs/devtools/agents
  - https://github.com/ChromeDevTools/chrome-devtools-mcp
---

# Chrome DevTools

**Purpose.** Let agents inspect and validate real browser behavior through Chrome DevTools.

**Install.** For Codex-style clients, use `codex mcp add chrome-devtools -- npx chrome-devtools-mcp@latest`. For Claude Code, use `claude mcp add chrome-devtools --scope user npx chrome-devtools-mcp@latest`.

**Config.** Use local browser sessions carefully. Avoid authenticated pages unless the user explicitly approves.

**When to use.** Use for visual verification, performance traces, Lighthouse audits, form checks, screenshots, and browser console/network investigation.

**When to skip.** Skip for pure unit tests, static docs edits, or simple API work where browser state adds no evidence.

**Cost.** Browser snapshots and traces can consume context. Prefer narrow verification prompts.

**Conflicts.** For cross-browser testing, Playwright MCP may be a better fit than Chrome-only DevTools.

**Known issues / when not to use.** Do not use browser automation to bypass auth, scrape private data, or operate user accounts without explicit scope.

**References.** Chrome DevTools for agents.

