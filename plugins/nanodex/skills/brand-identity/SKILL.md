---
name: brand-identity
description: >
  Pentagram-level creative director panel generating complete brand identity
  systems. Spawns 5 expert agents for brand strategy, logo direction, color,
  typography, imagery. Use for "brand identity", "brand strategy", "logo
  direction", or "build a brand".
argument-hint: "[name=Company industry=SaaS audience=developers value-prop='Ship faster']"
disable-model-invocation: true
allowed-tools: Read, Glob, Grep, Task, Bash, Edit, Write
---

# Brand Identity — 5-Expert Creative Director Panel

Generate a complete brand identity system by spawning 5 parallel sub-agents, each embodying a Pentagram-level creative director. Each expert independently generates a brand direction through their unique design philosophy, then directions are clustered and presented as 2 distinct options.

## Constraints

- DO NOT produce visual assets (images, logos) — output is creative direction briefs only
- DO NOT change existing brand assets unless explicitly asked
- DO NOT introduce dependencies on external APIs or services
- All color specifications use hex and RGB (no Pantone/CMYK unless `constraints="include-print"`)
- All text/background color pairs must meet WCAG AA (4.5:1 contrast)
- Typography recommendations must use freely available or commonly licensed typefaces
- Output must work for both light and dark mode contexts

## Workflow

Read `references/workflow.md` for the full detailed workflow. Below is a summary of each step.

### Step 1: Gather Brand Brief

**Scope-first architecture** — collect only what's needed before spawning agents.

1. Parse `$ARGUMENTS` for key=value pairs: `name`, `industry`, `audience`, `value-prop`
2. If required keys are missing, gather interactively one question at a time
3. Check for optional inputs: `competitors`, `constraints`, `scope`, `personality`
4. Auto-detect context: read project README, package.json, or equivalent
5. Scan repo for existing brand assets (logo files, color definitions, brand docs)
6. Sanitize all user inputs before including in agent prompts:
   - Strip markdown formatting that could alter prompt structure
   - Limit input lengths (name: 100 chars, industry: 200 chars, value-prop: 500 chars)
   - Escape template-like patterns (`${}`, `{{}}`)

### Step 2: Launch Expert Sub-Agents

Read `references/workflow.md` for the complete agent prompts and spawn instructions.

**Round 1** — Spawn 5 agents in parallel using the Task tool:
1. Paula Scher (references/paula-scher.md)
2. Michael Bierut (references/michael-bierut.md)
3. Massimo Vignelli (references/massimo-vignelli.md)
4. Saul Bass (references/saul-bass.md)
5. Jessica Walsh (references/jessica-walsh.md)

**Partial failure handling:** Proceed with synthesis if at least 3 of 5 experts complete successfully. Note any failed experts in the final report.

### Step 3: Synthesize into 2 Directions

After all expert agents complete (or minimum 3):

1. Collect all brand directions from every completed expert
2. Cluster by archetype affinity — group experts whose proposed archetypes share a motivation axis (Stability/Independence/Mastery/Belonging)
3. Select the 2 most differentiated clusters
4. For each direction, merge contributing experts' strongest elements
5. Document clustering rationale in synthesis-report.md

### Step 4: Write Output

Write deliverables to `docs/brand-identity/<date>-<brand-name>/`:

```
manifest.json                     # Machine-readable output metadata
context.md                        # Human-readable summary and usage guide
brand-brief.md                    # Input context summary
direction-1/
  strategy.md                     # Archetype, voice metrics, messaging hierarchy
  visual-identity.md              # Logo direction, color system, typography
  applications.md                 # Brand applications, imagery style
direction-2/
  strategy.md
  visual-identity.md
  applications.md
synthesis-report.md               # Expert panel summary, clustering rationale
brand-book-template.md            # Recommended brand book structure
```

**Path safety:** Slugify brand name for directory (lowercase, alphanumeric + hyphens only).

### Step 5: Present Directions

Present both directions side-by-side with a summary table.

**Interactive mode** (user invoked directly):
- Ask the user: "Which direction should we proceed with?"
- Options: "Direction 1", "Direction 2", "Neither — refine further"
- Write selection to manifest.json as `selected_direction`

**Non-interactive mode** (`$ARGUMENTS` specifies `direction=1` or `direction=2`):
- Write selection to manifest.json and proceed

## Required Output Content

Each direction must include all of the following:

**Strategy:**
- Primary and secondary brand archetypes (from Jung's 12) with rationale
- Motivation axis placement
- Voice metrics (4 dimensions scored 0-10) with do/don't examples
- Messaging hierarchy: tagline, 3 value pillars, proof points, boilerplate

**Visual Identity:**
- Logo direction brief: concept, mark type, form language, 6 variations, usage rules, 4 responsive tiers
- Color system: primary (3-5), secondary (2-3), accent (1-2), neutral (4-6) with hex, RGB, role, rationale
- Typography: primary + secondary typeface, 9-level responsive scale, accessibility compliance

**Applications:**
- Photography direction, illustration style, iconography specs
- Brand application guidance across digital touchpoints

## Success Criteria

- 2 distinct brand directions generated from 5 expert inputs
- All required output sections present in each direction
- Color pairs meet WCAG AA contrast
- Type scale includes minimum 16px body text
- manifest.json written with expert completion status
- Output directory uses safe slugified path
