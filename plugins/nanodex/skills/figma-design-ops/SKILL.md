---
name: figma-design-ops
description: >
  Figma design ops specialist converting design descriptions into Figma-ready
  specs. Spawns 3 sub-specialists for frame structure, component architecture,
  and prototype handoff. Use for "Figma specs", "Figma setup", "design ops",
  or "dev handoff".
argument-hint: "[scope=full design-dir=path/to/design-system]"
disable-model-invocation: true
allowed-tools: Read, Glob, Grep, Task, Bash, Edit, Write
---

# Figma Design Ops — 3-Specialist Panel

Convert design descriptions and design system specifications into Figma-ready specifications by spawning 3 parallel sub-specialists. Each specialist covers a distinct, non-overlapping layer of the Figma specification: file structure, component architecture, and prototype handoff.

## Constraints

- DO NOT produce Figma files — output is specification documents for Figma implementation
- DO NOT assume specific Figma plugins or third-party tools
- Specifications target Figma's 2025-2026 feature set (variables, auto layout v5, dev mode)
- All variable mappings must use Figma-native types: COLOR, FLOAT, STRING, BOOLEAN
- Component architecture must use Figma-native features: variants, boolean properties, instance swap, text properties
- Auto layout specs must be precise enough for exact reproduction

## Workflow

Read `references/workflow.md` for the full detailed workflow. Below is a summary of each step.

### Step 1: Gather Context

1. Parse `$ARGUMENTS` for key=value pairs: `scope`, `design-dir`, `brand-dir`
2. Auto-detect design system output: read `manifest.json` from most recent `docs/design-system/` directory
3. Auto-detect brand identity: read `manifest.json` from most recent `docs/brand-identity/` directory
4. Scan for existing component inventory in the codebase
5. Determine scope: "full" (default), "structure-only", "components-only", "prototype-only"

**Selective context passing** — Each specialist only receives their relevant subset:
- Structure Specialist: grid-system.md, spacing-system.md
- Component Architect: tokens/*.tokens.json, component specs, color-system.md
- Prototype Specialist: component specs (for interaction states), typography-system.md

### Step 2: Launch Specialist Sub-Agents

Read `references/workflow.md` for the complete agent prompts and spawn instructions.

**Round 1** — Spawn 3 agents in parallel using the Task tool:
1. Figma Structure Specialist (references/figma-structure-specialist.md)
2. Component Architect (references/component-architect.md)
3. Prototype & Handoff Specialist (references/prototype-handoff-specialist.md)

**Partial failure handling:** All 3 are required (each covers a non-overlapping domain). On failure, retry the specific agent once. If retry fails, report which specialist failed and deliver partial output.

### Step 3: Assemble Figma Specification

After all specialist agents complete:

1. Collect specifications from all 3 specialists
2. Verify consistency: variable names in component specs match token mapping, frame names in prototypes match structure spec
3. Cross-reference: component architecture references correct grid specs, prototype flows use correct component variant names
4. Resolve any naming conflicts

### Step 4: Write Output

Write deliverables to `docs/figma-specs/<date>-<project-name>/`:

```
manifest.json                     # Machine-readable output metadata
context.md                        # Human-readable summary and usage guide
file-structure.md                 # Pages, frames, naming conventions
grid-and-layout.md                # Grid specs, constraints, responsive rules
component-architecture.md         # Variants, properties, auto layout specs
design-tokens-mapping.md          # Figma variable collections, modes, scoping
prototype-flows.md                # Triggers, animations, transitions
developer-handoff.md              # Annotations, measurement specs, code connect
```

### Step 5: Present Report

Present the Figma specification summary:
- File structure overview (page count, frame naming)
- Component count with variant matrix
- Variable collection summary
- Prototype flow count
- Any cross-reference issues found

## Required Output Content

**File Structure:**
- Page organization with section dividers
- Frame naming conventions (Device/Flow/Screen, Component/Name/Variant)
- Grid specifications per breakpoint applied to frames
- Constraint rules per element type

**Component Architecture:**
- Auto layout specification per component (direction, padding, gap, alignment, resizing, min/max)
- Variant properties with types, values, defaults
- Boolean properties for visibility toggles
- Instance swap properties with preferred values
- Text properties with defaults and max lengths

**Design Token Mapping:**
- Primitives collection: variable name, type, value, scoping
- Semantic collection with Light/Dark modes: variable name, values per mode, scoping
- Code syntax mapping: Figma variable → CSS / iOS / Android names

**Prototype Flows:**
- Screen flow diagrams
- Interaction table: from, trigger, to, animation, duration, easing
- Animation tokens: duration.fast/normal/slow, easing curves

**Developer Handoff:**
- Dev mode annotation specs
- Measurement and spacing callouts
- Code Connect mapping (Figma component → code component)

## Success Criteria

- All 3 specialist outputs assembled into coherent specification
- Variable names are consistent across all spec documents
- Component variant names match between architecture and prototype specs
- Frame naming follows documented conventions
- manifest.json written with specialist completion status
