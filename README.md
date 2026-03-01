# nanodex-marketplace

Expert-driven skills, agents, and hooks for [Claude Code](https://docs.anthropic.com/en/docs/claude-code).

## Install

```bash
claude plugin marketplace add noodlemind/nanodex-marketplace
claude plugin install nanodex-plugin
```

## Skills

### `/nanodex:ux-review`

A 10-expert UI/UX review panel. Spawns parallel sub-agents — each embodying a world-class designer — to independently audit your interface.

**Experts:** Dieter Rams, Jony Ive, Don Norman, Jakob Nielsen, Luke Wroblewski, Steve Krug, Irene Au, Jesse James Garrett, Erika Hall, Yael Levey.

**Triggers:** "review UX", "UX audit", "design review", "polish the UI", "streamline the interface"

**What it does:**
- Scopes review to changed files by default (or specify a page/component)
- Spawns 10 expert agents in two rounds (7 + 3)
- Synthesizes and deduplicates findings with consensus weighting
- Presents a prioritized report (high/medium/low impact)
- Applies selected fixes while preserving your visual theme

### `/nanodex:code-review`

A multi-agent code review panel with security, performance, and architecture reviewers.

**Triggers:** "review code", "code review", "check code quality", "audit the code"

**What it does:**
- Scopes review to changed files, specific paths, or a PR number
- Spawns 3 specialized agents in parallel (security, performance, architecture)
- Checks plan compliance if a plan document exists in `docs/plans/`
- Synthesizes findings into a prioritized report with concrete fixes

### `/nanodex:brand-identity`

A 5-expert creative director panel that generates complete brand identity systems.

**Experts:** Paula Scher, Michael Bierut, Massimo Vignelli, Saul Bass, Jessica Walsh.

**Triggers:** "brand identity", "brand strategy", "logo direction", "build a brand"

**What it does:**
- Collects a brand brief (name, industry, audience, value proposition)
- Spawns 5 expert agents in parallel, each generating a complete brand direction
- Clusters outputs into 2 distinct brand directions by archetype affinity
- Produces strategy (archetypes, voice metrics, messaging), visual identity (logo, color, typography), and applications (imagery, iconography)
- Writes output to `docs/brand-identity/` with manifest.json for pipeline chaining

### `/nanodex:design-system`

A 6-expert principal designer panel that generates design system foundations.

**Experts:** Brad Frost, Jina Anne, Nathan Curtis, Ethan Marcotte, Hayley Hughes, Dan Mall.

**Triggers:** "design system", "design tokens", "component specs", "build foundations"

**What it does:**
- Auto-detects tech stack and consumes brand identity output when available
- Spawns 6 expert agents in parallel, each covering a foundation area
- Converges to a single specification through expert consensus
- Produces W3C DTCG design tokens (primitives, semantic, component), grid/spacing/typography foundations, and component specs (button, input, card, badge, alert)
- Writes output to `docs/design-system/` with manifest.json for pipeline chaining

### `/nanodex:figma-design-ops`

A 3-specialist panel that converts design descriptions into Figma-ready specifications.

**Specialists:** Figma Structure, Component Architect, Prototype & Handoff.

**Triggers:** "Figma specs", "Figma setup", "design ops", "dev handoff"

**What it does:**
- Consumes design system tokens and brand identity when available
- Spawns 3 specialists in parallel with selective context (each gets only relevant data)
- Produces file structure, component architecture (variants, auto layout, variables), prototype flows (interactions, animations), and developer handoff specs
- Writes output to `docs/figma-specs/` with manifest.json

### `/nanodex:workflow-plan`

Creates structured implementation plans from feature descriptions.

**What it does:**
- Explores the codebase for patterns and conventions
- Produces a detailed plan document in `docs/plans/`
- Works both interactively and when orchestrated by other agents

## Agents

| Agent | Focus | Tools |
|-------|-------|-------|
| `security-reviewer` | OWASP Top 10, secrets, injection, auth | Read, Grep, Glob |
| `performance-analyzer` | Complexity, N+1 queries, memory, bundles | Read, Grep, Glob |
| `architecture-reviewer` | SOLID, coupling, cohesion, patterns | Read, Grep, Glob |

## Hooks

### post-edit-lint

Fires after every `Edit`, `Write`, or `MultiEdit` operation. Detects the project's linter (ESLint, RuboCop, or Ruff) and runs it on the edited file.

## License

MIT
