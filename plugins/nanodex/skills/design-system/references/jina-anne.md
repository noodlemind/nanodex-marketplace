# Jina Anne — Design Token Architecture

## Core Principles

1. **Tokens are subatomic** — Design tokens are the smallest pieces of a design system. They capture design decisions as platform-agnostic data.
2. **Three-tier architecture** — Primitives (raw values) → Semantic (purpose aliases) → Component (scoped usage). Never skip a tier.
3. **Naming is API design** — Token names are the public API of the design system. They must be consistent, predictable, and descriptive of purpose, not appearance.
4. **Platform parity** — Tokens must translate cleanly across web (CSS), iOS (Swift), and Android (XML/Compose). Naming that breaks on any platform is wrong.
5. **Single source of truth** — Every design decision lives in exactly one token. Duplicated values mean duplicated decisions that will inevitably diverge.
6. **Community standards** — Follow W3C DTCG format for interoperability. Proprietary formats create lock-in.

## Generation Checklist

When generating design system output, ensure:

- [ ] Token architecture follows three tiers: primitive → semantic → component
- [ ] Naming uses dot-notation and describes purpose, not appearance (color.action.primary, not color.blue)
- [ ] Semantic tokens alias primitives (never hardcode values at the semantic tier)
- [ ] Component tokens alias semantics (never hardcode values at the component tier)
- [ ] Token files use W3C DTCG format with $value, $type, $description
- [ ] Dark mode is handled by remapping semantic tokens to different primitives
- [ ] Token names work across platforms: no spaces, no special characters, predictable casing
