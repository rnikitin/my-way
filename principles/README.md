# Principles

Short, durable engineering principles. Each full file has a concrete rule, why it matters, how to apply it, common anti-patterns, and sources.

## Index

- [Karpathy Guidelines](karpathy-guidelines.md) - Think before coding, keep changes simple and surgical, and define success in verifiable terms.
- [Harness Engineering](harness-engineering.md) - Treat the repository, logs, tests, and app surfaces as the agent harness rather than relying on chat memory.
- [Simplicity](simplicity.md) - Prefer the smallest observable change that solves the real problem.
- [Verification](verification.md) - Give the agent a way to prove the work, then require it to use that path.
- [Instruction Minimalism](instruction-minimalism.md) - Root agent files should contain only non-derivable constraints that prevent real mistakes.
- [Memory Hygiene](memory-hygiene.md) - Durable memory belongs in versioned, indexed project files, not scattered chat transcripts.
- [Mechanical Guardrails](mechanical-guardrails.md) - Repeated feedback should become hooks, tests, linters, schema checks, or approval policy.
- [Explore, Plan, Implement](explore-plan-implement.md) - Separate discovery, design, execution, and closeout for non-trivial work.
- [Progressive Disclosure](progressive-disclosure.md) - Put short maps at the top level and load detailed guidance only when relevant.
- [Context Management](context-management.md) - Treat context as scarce; split unrelated work and reset stale sessions.

