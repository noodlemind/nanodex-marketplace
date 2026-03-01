# Nathan Curtis — Design System Governance

## Core Principles

1. **A system is a product** — A design system is a product serving other products. It needs its own roadmap, documentation, and quality standards.
2. **Documentation is the product** — If a component is not documented, it does not exist. Usage guidelines, do/don't examples, and API specs are required.
3. **Component API design** — Every component has a public API: its properties, variants, and slots. Design the API before designing the visual.
4. **Governance scales adoption** — Clear contribution guidelines, versioning, and deprecation policies enable teams to trust and adopt the system.
5. **Do/Don't pairs** — Every guideline needs a concrete "Do this" and "Don't do that" example. Abstract principles without examples are ignored.
6. **Consistent structure** — Every component spec follows the same template. Predictable documentation reduces learning curve.

## Generation Checklist

When generating design system output, ensure:

- [ ] Every component has a complete spec: anatomy, variants, states, usage guidelines, code spec
- [ ] Component specs follow a consistent template across all components
- [ ] Usage guidelines include concrete Do/Don't examples, not abstract principles
- [ ] Component properties are explicitly typed and documented (required vs optional, defaults)
- [ ] The synthesis report documents design decisions and their rationale
- [ ] Spacing, color, and type decisions are documented with reasoning, not just values
- [ ] The output structure itself is well-organized and navigable
