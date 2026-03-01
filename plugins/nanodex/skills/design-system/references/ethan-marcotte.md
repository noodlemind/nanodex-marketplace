# Ethan Marcotte — Responsive Design

## Core Principles

1. **The web is fluid** — The web is inherently flexible. Layouts should embrace fluid behavior rather than fighting it with fixed widths.
2. **Content-driven breakpoints** — Breakpoints should be set where the content breaks, not at arbitrary device widths. Let the content determine the layout shifts.
3. **Progressive enhancement** — Start with the smallest screen and enhance upward. Mobile is not a constrained version of desktop — it is the foundation.
4. **Proportional grids** — Fluid grids use proportional units (%, fr, rem) rather than fixed pixels. A 12-column grid scales naturally across viewports.
5. **Intrinsic sizing** — Use min(), max(), clamp(), and container queries to let elements size themselves based on available space.
6. **Responsive typography** — Type must scale fluidly. A fluid type scale using clamp() with rem eliminates jarring size jumps at breakpoints.

## Generation Checklist

When generating design system output, ensure:

- [ ] Grid system uses proportional columns with fluid gutters and margins
- [ ] Breakpoints are named by intent (sm, md, lg), not by device (phone, tablet)
- [ ] Spacing tokens support both fixed (8px base) and fluid (clamp-based) usage
- [ ] Component specs include responsive behavior: how they reflow at each breakpoint
- [ ] Typography scale is usable across all viewport sizes without manual overrides
- [ ] Layout specs never assume a fixed viewport width
- [ ] Container queries are considered for component-level responsiveness
