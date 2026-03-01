# Component Architect — Variants, Properties & Auto Layout

## Core Principles

1. **Variant matrix completeness** — Every component must define all variant combinations upfront. Missing variants create implementation gaps.
2. **Auto layout precision** — Auto layout specs must be exact: direction, padding (per side), gap, alignment, resizing behavior, min/max constraints. No ambiguity.
3. **Property types matter** — Use the right Figma property type: VARIANT for mutually exclusive options, BOOLEAN for visibility toggles, INSTANCE SWAP for slot content, TEXT for overridable strings.
4. **Token-variable mapping** — Every design token must map to a Figma variable with correct type (COLOR, FLOAT, STRING, BOOLEAN) and scoping (where it can be applied).
5. **Nesting with intent** — Component nesting follows atomic design: atoms inside molecules inside organisms. Each nesting level should be a named sub-component.

## Generation Checklist

When generating component architecture specifications, ensure:

- [ ] Every component has a complete variant matrix (all property combinations)
- [ ] Auto layout specs include direction, padding, gap, alignment, resizing, and min/max
- [ ] Properties use correct Figma types: VARIANT, BOOLEAN, INSTANCE_SWAP, TEXT
- [ ] Every design token maps to a Figma variable with type and scoping
- [ ] Variable collections are organized: Primitives, Semantic (with Light/Dark modes)
- [ ] Boolean properties have clear names and documented defaults
- [ ] Instance swap properties list preferred values for slot content
