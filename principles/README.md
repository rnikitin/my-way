# Principles

Short, durable engineering principles. Each full file has a concrete rule, why it matters, how to apply it, common anti-patterns, and sources.

## Structure

Each principle is a focused Markdown file with frontmatter sources and five sections: core idea, why it matters, how to apply it, anti-patterns, and references. Principles are not templates; link to them from project instructions when the rule is generally useful but too long for `AGENTS.md`.

## Navigation

Use the list below by problem type:

- Start with [Instruction Minimalism](instruction-minimalism.md), [Progressive Disclosure](progressive-disclosure.md), and [Memory Hygiene](memory-hygiene.md) when writing project instructions.
- Start with [Verification](verification.md), [Mechanical Guardrails](mechanical-guardrails.md), [Harness Audit](harness-audit.md), and [Harness Engineering](harness-engineering.md) when improving agent reliability.
- Start with [Simplicity](simplicity.md), [Karpathy Guidelines](karpathy-guidelines.md), and [Explore, Plan, Implement](explore-plan-implement.md) when shaping implementation behavior.
- Start with [Context Management](context-management.md) when a session gets noisy or too broad.

## Index

- [Karpathy Guidelines](karpathy-guidelines.md) - Think before coding, keep changes simple and surgical, and define success in verifiable terms.
- [Harness Engineering](harness-engineering.md) - Treat the repository, logs, tests, and app surfaces as the agent harness rather than relying on chat memory.
- [Simplicity](simplicity.md) - Prefer the smallest observable change that solves the real problem.
- [Verification](verification.md) - Give the agent a way to prove the work, then require it to use that path.
- [Harness Audit](harness-audit.md) - Run regular audits of agent entry files, commands, safety boundaries, handoff state, and verification paths.
- [Instruction Minimalism](instruction-minimalism.md) - Root agent files should contain only non-derivable constraints that prevent real mistakes.
- [Memory Hygiene](memory-hygiene.md) - Durable memory belongs in versioned, indexed project files, not scattered chat transcripts.
- [Mechanical Guardrails](mechanical-guardrails.md) - Repeated feedback should become hooks, tests, linters, schema checks, or approval policy.
- [Explore, Plan, Implement](explore-plan-implement.md) - Separate discovery, design, execution, and closeout for non-trivial work.
- [Progressive Disclosure](progressive-disclosure.md) - Put short maps at the top level and load detailed guidance only when relevant.
- [Context Management](context-management.md) - Treat context as scarce; split unrelated work and reset stale sessions.
