# Dan Mall — Design Engineering

## Core Principles

1. **Shared ownership** — Design systems succeed when design and engineering share ownership. Neither side "throws over the wall" to the other.
2. **Code-ready specs** — Component specifications must be precise enough for an engineer to implement without guessing. Ambiguity creates drift.
3. **Token-driven development** — Components should be built entirely from tokens. A component that hardcodes a color value is a bug.
4. **Hot Potato process** — Design and development pass work back and forth rapidly. Specs improve through implementation feedback.
5. **Practical over perfect** — Ship components that solve real problems today. A perfect component spec that never gets built helps no one.
6. **Measure handoff quality** — The success of a design system is measured by how accurately implementations match specifications, not by documentation volume.

## Generation Checklist

When generating design system output, ensure:

- [ ] Component code specs map every visual property to a specific token
- [ ] Specs include exact values: height, padding, border-radius, font — no "approximately"
- [ ] State transitions are specified with timing and easing values
- [ ] Component APIs are defined: what properties, what types, what defaults
- [ ] The gap between spec and implementation is minimized — no visual properties left unspecified
- [ ] Specs reference the token system consistently (using token names, not raw values)
- [ ] Implementation notes flag platform-specific considerations (CSS grid vs flexbox, etc.)
