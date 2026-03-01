---
name: design-system
description: >
  Principal designer panel establishing design system foundations. Spawns 6
  expert agents for color tokens, grid, spacing, components with states,
  anatomy, accessibility, code specs. Use for "design system", "design
  tokens", "component specs", or "build foundations".
argument-hint: "[stack=nextjs scope=full brand-dir=path/to/direction]"
disable-model-invocation: true
allowed-tools: Read, Glob, Grep, Task, Bash, Edit, Write
---

# Design System — 6-Expert Principal Designer Panel

Generate a complete design system specification by spawning 6 parallel sub-agents, each embodying a principal designer with deep expertise in a specific foundation area. Unlike brand identity (which presents alternatives), design system output **converges to a single specification** through expert consensus.

## Constraints

- DO NOT generate visual assets — output is specification documents and design tokens
- DO NOT introduce new frameworks or dependencies
- DO NOT override existing design tokens or CSS variables without explicit permission
- Design tokens use W3C DTCG stable format (v2025.10) with hex string values
- All color pairs must meet WCAG AA contrast (4.5:1 text, 3:1 UI components)
- Component specifications must include keyboard, screen reader, and touch target accessibility
- Output must support both light and dark mode

## Workflow

Read `references/workflow.md` for the full detailed workflow. Below is a summary of each step.

### Step 1: Gather Context

1. Parse `$ARGUMENTS` for key=value pairs: `stack`, `scope`, `brand-dir`, `a11y`, `platforms`
2. Auto-detect tech stack from package.json, Gemfile, pyproject.toml
3. Auto-detect brand identity output: read `manifest.json` from most recent `docs/brand-identity/` directory, check `selected_direction` field
4. Scan for existing design tokens or CSS variables in the project
5. If `brand-dir` points to a brand identity direction, read its `visual-identity.md` for color and typography inputs
6. Determine scope: "full" (default), "just-tokens", "just-components", "just-foundations"

### Step 2: Launch Expert Sub-Agents

Read `references/workflow.md` for the complete agent prompts and spawn instructions.

**Round 1** — Spawn 6 agents in parallel using the Task tool:
1. Brad Frost (references/brad-frost.md) — **Required**
2. Jina Anne (references/jina-anne.md) — **Required**
3. Nathan Curtis (references/nathan-curtis.md)
4. Ethan Marcotte (references/ethan-marcotte.md)
5. Hayley Hughes (references/hayley-hughes.md)
6. Dan Mall (references/dan-mall.md)

**Partial failure handling:** Proceed if at least 5 of 6 experts complete. Frost and Anne are required — if either fails, retry once before proceeding. If fewer than 5 complete, report failure and ask user to retry.

### Step 3: Converge to Single Specification

After all expert agents complete (or minimum 5):

1. Collect all specifications from every completed expert
2. For each foundation area, identify consensus:
   - **Agreement** (majority): use the majority specification directly
   - **Contested values**: select the choice with strongest accessibility/standards backing
   - **Unresolved conflicts**: flag for user decision
3. Merge into a single coherent design system
4. Validate: all semantic tokens reference valid primitives, all component tokens reference valid semantics
5. Generate W3C DTCG token files from the converged specification

### Step 4: Write Output

Write deliverables to `docs/design-system/<date>-<project-name>/`:

```
manifest.json                     # Machine-readable output metadata
context.md                        # Human-readable summary and usage guide
tokens/
  primitives.tokens.json          # W3C DTCG format: raw values
  semantic.tokens.json            # Aliases: bg.primary, text.error, etc.
  component.tokens.json           # Component-scoped: button.bg, input.border
foundations/
  color-system.md                 # Full color spec with light/dark mode
  grid-system.md                  # 12-column grid, breakpoints, gutters
  spacing-system.md               # 8px scale with token names
  typography-system.md            # Type scale, pairing rules
components/
  component-template.md           # Anatomy, states, usage, accessibility, code spec
  [component-name].md             # Per-component spec
synthesis-report.md               # Expert panel summary, decisions made
```

### Step 5: Present Report

Present the converged specification summary:
- Token count and structure
- Color system overview (light/dark)
- Grid and spacing summary
- Components specified
- Any conflicts requiring user decision

**Interactive mode:** Ask if the user wants to adjust any values.
**Non-interactive mode:** Write output and complete.

## Required Output Content

**Color System:**
- Three-tier token architecture: primitives → semantic → component
- Light and dark mode values for all semantic tokens
- Contrast validation table for all text/background pairs
- Dark mode strategy: remapped semantics, reduced saturation, layered surfaces

**Grid System:**
- 12-column grid with per-breakpoint specs (4/8/12 columns)
- 8px spacing scale with 11 named tokens (space.050 through space.1200)
- 6 named breakpoints (xs through 2xl)

**Typography:**
- Type scale with rem values and line heights
- Pairing rules and weight usage

**Components:**
- Anatomy, variants, states, accessibility, code spec per component
- Minimum: button, input, card, badge, alert

**Design Tokens:**
- W3C DTCG v2025.10 format with `$value`, `$type`, `$description`
- Three files: primitives, semantic, component
- Hex string values for colors

## Success Criteria

- Single converged design system specification
- All token files validate as valid JSON with DTCG schema
- All color pairs meet WCAG AA contrast
- Grid, spacing, and type scale are internally consistent
- manifest.json written with expert completion status
- Brand identity colors consumed correctly when available
