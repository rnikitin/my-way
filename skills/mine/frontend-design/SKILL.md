---
name: frontend-design
description: Create distinctive, production-grade frontend interfaces with high design quality and a clear aesthetic direction. Use when the user asks to build or redesign web UI components, pages, dashboards, landing pages, or full front-end apps.
---

# Frontend Design

Create distinctive, production-grade frontend interfaces that avoid generic "AI slop" aesthetics. Implement real working code with exceptional attention to typography, composition, motion, and detail.

## Workflow

1. Confirm the brief.
   - Purpose: what problem does this UI solve?
   - Audience: who uses it and on what devices?
   - Tone: choose a concrete aesthetic direction.
   - Constraints: framework, performance, accessibility, existing design system.
   - Differentiation: what is the one memorable thing?
2. Commit to one coherent aesthetic direction and execute it with precision.
3. Implement with production discipline: match the existing stack, preserve local design-system patterns, use tokens, and build responsive layouts first.

If missing brief details would change the build, ask one to three focused questions. Otherwise, state assumptions and proceed.

## Aesthetic Directions

Pick one direction instead of drifting into generic defaults:

- brutally minimal
- editorial or magazine-like
- retro-futuristic
- art deco or geometric
- industrial or utilitarian
- organic or natural
- playful or toy-like
- maximalist collage
- luxury or refined
- brutalist or raw

Write a short design north star describing the direction, typography mood, and primary visual motif.

## Typography

- Avoid generic fonts unless the project already uses them.
- Prefer a distinctive display face plus a readable body face.
- Use typographic contrast as a primary design tool: size, weight, line-height, and spacing.
- Choose fonts intentionally for the concept rather than reusing the same pair everywhere.
- Keep code and mono text intentionally styled.

## Color And Theme

- Commit to a dominant palette with sharp accents.
- Do not default to purple gradients on white backgrounds.
- Avoid dark mode by default unless requested or already native to the product.
- Keep color choices tokenized with CSS variables or the existing design system.

## Composition

- Avoid cookie-cutter landing page structure.
- Use asymmetry, overlap, or grid-breaking moments when appropriate.
- Use negative space deliberately; density should feel controlled.
- Match display text to its container: compact panels need compact type, not hero-scale headings.

## Motion

- Prefer a few meaningful animations over many micro-motions.
- Add clear hover, focus, and active states.
- Respect `prefers-reduced-motion`.
- Keep interactions snappy and reversible.

## Engineering Guardrails

- Accessibility: semantic HTML, visible focus states, keyboard navigation, readable contrast.
- Performance: avoid heavy new dependencies, optimize images, avoid blocking font loads.
- Maintainability: prefer small components and local conventions.
- Consistency: when inside an existing design system, elevate it rather than rebranding it.

## Anti-Patterns

- Generic hero plus three cards plus testimonial strip unless deliberately subverted.
- Overused font families and default component kits without customization.
- Purple-on-white startup gradients.
- Design-by-library: adding multiple UI libraries when one stack already exists.
- In-app text that explains obvious UI functionality instead of making the UI self-evident.

## Done Checklist

- Responsive on narrow and wide viewports.
- Keyboard reachable controls and visible focus.
- Motion respects reduced motion.
- Typography hierarchy is intentional.
- Background and detail support the concept.
- Build and relevant UI checks run.

