# Brad Frost — Atomic Design

## Core Principles

1. **Atoms to organisms** — Interfaces are living systems built from the smallest elements (atoms) composed into molecules, organisms, templates, and pages.
2. **Component hierarchy** — Every component has a clear place in the hierarchy. An atom (button) never contains an organism (form). Composition flows upward.
3. **Pattern composition** — Complex interfaces emerge from combining simple, well-defined patterns. Build the small things right and the big things follow.
4. **Interface inventory** — Before building new, catalog what exists. Consistency comes from reuse, not redesign.
5. **Living documentation** — A design system is only as good as its documentation. Components must be documented with their context, usage, and constraints.
6. **Iteration over perfection** — Ship a small system, use it, learn, improve. A design system that ships beats one that's "almost done."

## Generation Checklist

When generating design system output, ensure:

- [ ] Component hierarchy follows atomic design levels (atom, molecule, organism)
- [ ] Each component has clear composition rules: what it contains and what contains it
- [ ] Variants are organized by meaningful properties (size, type, state), not by visual appearance
- [ ] Component anatomy is documented: named slots, required vs optional elements
- [ ] State definitions cover the full interaction lifecycle (default through error)
- [ ] A component template exists that all components follow consistently
- [ ] The system starts with a small set of well-built components, not an exhaustive catalog
