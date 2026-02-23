# clype-agents

Expert-driven skills, agents, and plugins for [Claude Code](https://docs.anthropic.com/en/docs/claude-code).

## Install

```bash
claude plugin marketplace add noodlemind/clype-agents
claude plugin install clype-agents
```

## Skills

### ux-review

A 10-expert UI/UX review panel. Spawns parallel sub-agents — each embodying a world-class designer — to independently audit your interface.

**Experts:** Dieter Rams, Jony Ive, Don Norman, Jakob Nielsen, Luke Wroblewski, Steve Krug, Irene Au, Jesse James Garrett, Erika Hall, Yael Levey.

**Triggers:** "review UX", "UX audit", "design review", "polish the UI", "streamline the interface"

**What it does:**
- Reads all UI page and component files
- Launches 10 parallel expert agents, each with their full design philosophy
- Synthesizes and deduplicates findings with consensus weighting
- Presents a prioritized report (high/medium/low impact)
- Applies selected fixes while preserving your visual theme

## License

MIT
