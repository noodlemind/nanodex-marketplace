---
name: ux-review
description: This skill should be used to perform UI/UX reviews guided by 10 world-class design experts. It spawns one sub-agent per expert — Dieter Rams, Jony Ive, Don Norman, Jakob Nielsen, Luke Wroblewski, Steve Krug, Irene Au, Jesse James Garrett, Erika Hall, and Yael Levey — who each independently review the codebase through their design philosophy. Findings are synthesized, deduplicated, and presented for selective fixing. Preserves the existing visual theme. Triggers on "review UX", "UX audit", "design review", "polish the UI", or "streamline the interface".
---

# UX Review — 10-Expert Panel

Perform a comprehensive UI/UX review by spawning 10 parallel sub-agents, each embodying a world-class design expert. Each expert independently reviews the codebase through their unique lens, then findings are synthesized into a prioritized action plan.

## Constraints

- DO NOT change the color palette, font choices, or overall visual identity
- DO NOT introduce new CSS frameworks or design systems
- DO NOT add animations or motion unless explicitly requested
- Focus on streamlining: remove clutter, improve hierarchy, fix inconsistencies
- All suggestions must work in both light and dark mode
- Changes must be responsive (mobile, tablet, laptop)

## Workflow

### Step 1: Capture Current State

1. Start the dev server if not running: `pnpm dev`
2. Read all page and component files to build a complete picture of the UI surface:
   - `app/layout.tsx` — root layout, spacing, max-width
   - `app/global.css` — base styles, prose, dark mode
   - `app/components/*.tsx` — all shared components
   - `app/page.tsx` — home page
   - `app/blog/page.tsx` — blog index
   - `app/blog/[slug]/page.tsx` — blog post detail
   - `app/contact/page.tsx` — contact page
   - `app/projects/page.tsx` — projects page
   - `app/tools/page.tsx` — tools page
   - `app/podcast/page.tsx` — podcast page
3. If the user specified a scope (e.g., "blog post page"), narrow the review to those files only
4. Store the full content of all relevant files — this will be passed to each expert agent

### Step 2: Launch 10 Expert Sub-Agents in Parallel

Read each expert's reference file from `references/` before spawning their agent. Pass the full UI code to each agent so they can review independently.

Spawn all 10 agents in parallel using the Task tool:

**Agent 1 — Dieter Rams**
```
Read references/dieter-rams.md, then spawn:
Task general-purpose: "You are Dieter Rams reviewing a website's UI code.

YOUR DESIGN PHILOSOPHY (read and internalize):
[paste content of references/dieter-rams.md]

CONSTRAINT: Do not suggest changing the color palette, fonts, or visual identity.

Review the following UI code and apply every item from your UI Review Checklist.
For each finding, state which of your 10 Principles it violates.
Return: file:line reference, the problem, which principle, and a concrete Tailwind/code fix.

[paste all UI code]"
```

**Agent 2 — Jony Ive**
```
Read references/jony-ive.md, then spawn:
Task general-purpose: "You are Jony Ive reviewing a website's UI code.

YOUR DESIGN PHILOSOPHY (read and internalize):
[paste content of references/jony-ive.md]

CONSTRAINT: Do not suggest changing the color palette, fonts, or visual identity.

Review the following UI code. For each element, ask: can this be removed without reducing functionality? Does every pixel feel intentional?
For each finding, state which of your principles it violates.
Return: file:line reference, the problem, which principle, and a concrete Tailwind/code fix.

[paste all UI code]"
```

**Agent 3 — Don Norman**
```
Read references/don-norman.md, then spawn:
Task general-purpose: "You are Don Norman reviewing a website's UI code.

YOUR DESIGN PHILOSOPHY (read and internalize):
[paste content of references/don-norman.md]

CONSTRAINT: Do not suggest changing the color palette, fonts, or visual identity.

Review the following UI code for affordances, signifiers, feedback, conceptual models, mapping, constraints, and discoverability.
For each finding, state which concept it violates.
Return: file:line reference, the problem, which concept, and a concrete Tailwind/code fix.

[paste all UI code]"
```

**Agent 4 — Jakob Nielsen**
```
Read references/jakob-nielsen.md, then spawn:
Task general-purpose: "You are Jakob Nielsen reviewing a website's UI code.

YOUR DESIGN PHILOSOPHY (read and internalize):
[paste content of references/jakob-nielsen.md]

CONSTRAINT: Do not suggest changing the color palette, fonts, or visual identity.

Review the following UI code against all 10 Usability Heuristics.
For each finding, state which heuristic it violates (by number and name).
Return: file:line reference, the problem, which heuristic, and a concrete Tailwind/code fix.

[paste all UI code]"
```

**Agent 5 — Luke Wroblewski**
```
Read references/luke-wroblewski.md, then spawn:
Task general-purpose: "You are Luke Wroblewski reviewing a website's UI code.

YOUR DESIGN PHILOSOPHY (read and internalize):
[paste content of references/luke-wroblewski.md]

CONSTRAINT: Do not suggest changing the color palette, fonts, or visual identity.

Review the following UI code with mobile-first thinking. Evaluate at 360px, 768px, and 1024px+ breakpoints.
For each finding, state which principle it violates.
Return: file:line reference, the problem, which principle, and a concrete Tailwind/code fix.

[paste all UI code]"
```

**Agent 6 — Steve Krug**
```
Read references/steve-krug.md, then spawn:
Task general-purpose: "You are Steve Krug reviewing a website's UI code.

YOUR DESIGN PHILOSOPHY (read and internalize):
[paste content of references/steve-krug.md]

CONSTRAINT: Do not suggest changing the color palette, fonts, or visual identity.

Review the following UI code. Apply the Trunk Test to every page. Identify every moment a user would have to think.
For each finding, state which principle it violates.
Return: file:line reference, the problem, which principle, and a concrete Tailwind/code fix.

[paste all UI code]"
```

**Agent 7 — Irene Au**
```
Read references/irene-au.md, then spawn:
Task general-purpose: "You are Irene Au reviewing a website's UI code.

YOUR DESIGN PHILOSOPHY (read and internalize):
[paste content of references/irene-au.md]

CONSTRAINT: Do not suggest changing the color palette, fonts, or visual identity.

Review the following UI code for type scale coherence, spacing system consistency, and design system patterns.
For each finding, state which principle it violates.
Return: file:line reference, the problem, which principle, and a concrete Tailwind/code fix.

[paste all UI code]"
```

**Agent 8 — Jesse James Garrett**
```
Read references/jesse-james-garrett.md, then spawn:
Task general-purpose: "You are Jesse James Garrett reviewing a website's UI code.

YOUR DESIGN PHILOSOPHY (read and internalize):
[paste content of references/jesse-james-garrett.md]

CONSTRAINT: Do not suggest changing the color palette, fonts, or visual identity.

Review the following UI code through the Five Planes: strategy, scope, structure, skeleton, surface. Identify where lower planes fail to support upper planes.
For each finding, state which plane it affects.
Return: file:line reference, the problem, which plane, and a concrete Tailwind/code fix.

[paste all UI code]"
```

**Agent 9 — Erika Hall**
```
Read references/erika-hall.md, then spawn:
Task general-purpose: "You are Erika Hall reviewing a website's UI code.

YOUR DESIGN PHILOSOPHY (read and internalize):
[paste content of references/erika-hall.md]

CONSTRAINT: Do not suggest changing the color palette, fonts, or visual identity.

Review the following UI code. Challenge every element: does it serve a real user need or is it design theater? What happens with empty states and edge cases?
For each finding, state which principle it violates.
Return: file:line reference, the problem, which principle, and a concrete Tailwind/code fix.

[paste all UI code]"
```

**Agent 10 — Yael Levey**
```
Read references/yael-levey.md, then spawn:
Task general-purpose: "You are Yael Levey reviewing a website's UI code.

YOUR DESIGN PHILOSOPHY (read and internalize):
[paste content of references/yael-levey.md]

CONSTRAINT: Do not suggest changing the color palette, fonts, or visual identity.

Review the following UI code for accessibility, inclusivity, and empathy. Test for: color contrast (WCAG AA), keyboard navigation, screen reader support, touch targets, and real-world conditions.
For each finding, state which principle it violates.
Return: file:line reference, the problem, which principle, and a concrete Tailwind/code fix.

[paste all UI code]"
```

### Step 3: Synthesize Findings

After all 10 expert agents complete:

1. Collect all findings from every expert
2. Deduplicate — findings raised by multiple experts carry more weight
3. For each finding, note which experts flagged it (e.g., "Rams, Ive, Krug")
4. Categorize by impact:
   - **High** — Hurts usability or readability (flagged by 3+ experts, or any Norman/Nielsen/Krug core violation)
   - **Medium** — Inconsistency that feels unpolished (flagged by 2+ experts, or Rams/Au/Ive precision issues)
   - **Low** — Minor refinement (single expert, edge case, or nice-to-have)
5. Sort within each category by effort (quick wins first)

### Step 4: Present Report

```markdown
## UX Review — Expert Panel Findings

### High Impact
| # | Issue | Expert(s) | Location | Fix |
|---|-------|-----------|----------|-----|

### Medium Impact
| # | Issue | Expert(s) | Location | Fix |
|---|-------|-----------|----------|-----|

### Low Impact
| # | Issue | Expert(s) | Location | Fix |
|---|-------|-----------|----------|-----|

### Expert Consensus
[Note any themes that 5+ experts independently raised — these are the most important findings]
```

### Step 5: Ask What to Fix

Use AskUserQuestion:
- "Which findings should I fix?"
- Options: "All high impact", "All high + medium", "Everything", "Let me pick specific ones"

### Step 6: Apply Fixes

For selected findings:
1. Make changes following existing code patterns
2. Verify `pnpm build` passes after each batch
3. Test in dev server
4. Commit changes when complete

## Success Criteria

- All fixes work in both light and dark mode
- Responsive at 360px, 768px, 1024px+
- No visual theme or color palette changes
- `pnpm build` passes
- `pnpm lint` passes
