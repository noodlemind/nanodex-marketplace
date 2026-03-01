# nanodex Plugin Conventions

## Directory Structure

```
plugins/nanodex/
  .claude-plugin/plugin.json    # Plugin metadata (name: nanodex-plugin)
  CLAUDE.md                     # This file
  skills/                       # User-facing skills (SKILL.md files)
    ux-review/                  # 10-expert UX review panel
    code-review/                # 3-agent code quality review
    workflow-plan/              # Structured planning workflow
    brand-identity/             # 5-expert brand identity panel
    design-system/              # 6-expert design system panel
    figma-design-ops/           # 3-specialist Figma design ops
  agents/                       # Subagent definitions (.md files)
    review/                     # Review-focused agents
  hooks/                        # Lifecycle hooks
    hooks.json                  # Hook configuration (NOT in plugin.json)
    post-edit-lint.sh           # Auto-lint after file edits
```

## Naming Conventions

- **Skills:** kebab-case directories with a `SKILL.md` inside
- **Agents:** kebab-case `.md` files in categorized subdirectories
- **Hooks:** `hooks.json` for config, shell scripts for execution
- **References:** supporting docs in a `references/` subdirectory within each skill

## Adding a New Skill

1. Create `skills/<skill-name>/SKILL.md` with YAML frontmatter:
   - `name`: skill identifier (matches directory name)
   - `description`: under 300 chars, include trigger phrases
   - `argument-hint`: autocomplete hint for arguments
   - `allowed-tools`: comma-separated tool list
   - `disable-model-invocation: true` if the skill has side effects (commits, deploys)
2. Add reference files in `skills/<skill-name>/references/` if needed
3. Keep SKILL.md under 500 lines; extract detailed workflows to `references/workflow.md`

## Adding a New Agent

1. Create `agents/<category>/<agent-name>.md` with YAML frontmatter:
   - `name`: agent identifier
   - `description`: what it does and when to use it
   - `tools`: tool list (NO Bash for review-only agents)
   - `model`: preferred model (sonnet for most review tasks)
2. Include prompt injection protection in the system prompt body
3. Define a clear output format

## Key Rules

- **Hooks go in `hooks/hooks.json`**, never in plugin.json
- **Review-only agents never get Bash access** — prevents prompt injection via code under review
- **Plugin name (`nanodex-plugin`) differs from directory name (`nanodex`)** — avoids EXDEV bug
- **Keep skill descriptions under 300 chars** — they share a 2% context budget (~16,000 chars)
- **Skills must support both interactive and non-interactive modes** — check for `$ARGUMENTS`
- **Generative skills use behavioral anchors** — not sentinel markers — for prompt injection protection
- **Sub-agents get Read/Glob/Grep only** — orchestrator SKILL.md controls all writes
- **Output directories include manifest.json** — machine-readable metadata for pipeline chaining
- **Design pipeline order:** brand-identity → design-system → figma-design-ops (each reads prior output via manifest.json)
