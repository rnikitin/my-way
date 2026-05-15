---
name: openai-skills-catalog
source_url: https://github.com/openai/skills
last_verified: 2026-05-16
copy_policy: summarize-and-link
license: MIT
---

# OpenAI Skills Catalog

OpenAI's skills catalog demonstrates the `SKILL.md` convention: YAML frontmatter with name and description, followed by Markdown instructions that are loaded only when relevant.

The important design principle is progressive disclosure. Agents first see the skill name, description, and path; they load detailed instructions only when the task triggers the skill.

`my-way` standardizes on this format for authored and vendored skills, then adapts to other tools only when needed.

