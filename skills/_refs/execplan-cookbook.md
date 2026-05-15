---
name: execplan-cookbook
source_url: https://developers.openai.com/cookbook/articles/codex_exec_plans
last_verified: 2026-05-16
copy_policy: summarize-and-link
---

# OpenAI ExecPlans Cookbook

The ExecPlans cookbook describes a self-contained plan format that lets an agent resume and execute multi-step work without relying on hidden chat history. A good ExecPlan includes purpose, progress, discoveries, decisions, concrete steps, validation, and recovery notes.

The key idea for `my-way`: long-running work needs a durable execution artifact, not just a short checklist. The plan should be readable by a capable engineer with no prior context and should include exact commands and expected outcomes.

This reference informs [`../mine/execplan/SKILL.md`](../mine/execplan/SKILL.md) and [`../../templates/execplan/EXECPLAN.md`](../../templates/execplan/EXECPLAN.md).

