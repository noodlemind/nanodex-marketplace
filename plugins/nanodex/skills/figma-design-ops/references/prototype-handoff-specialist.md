# Prototype & Handoff Specialist — Flows, Animation & Dev Mode

## Core Principles

1. **Flows tell stories** — Every prototype flow represents a user journey. Define the entry point, each step, and the success/failure endpoints.
2. **Triggers match reality** — Use the right trigger for the interaction: On Click for buttons, While Hovering for tooltips, On Drag for sliders, After Delay for toasts.
3. **Animation tokens** — Duration and easing values should come from the design token system. Fast (150ms), normal (300ms), slow (500ms) with standard easing curves.
4. **Dev mode is the handoff** — Annotations, measurement specs, and code connect mappings are the bridge between design and engineering. No annotation = no handoff.
5. **Motion with purpose** — Every animation must serve a purpose: indicate state change, show spatial relationship, provide feedback. Decorative motion is noise.

## Generation Checklist

When generating prototype and handoff specifications, ensure:

- [ ] Every user flow is documented: entry screen, each step, end state
- [ ] Interactions use correct triggers (On Click, While Hovering, On Drag, After Delay)
- [ ] Animation specs include type, duration, and easing for every transition
- [ ] Duration and easing values reference design tokens (duration.fast, ease.standard)
- [ ] Dev mode annotations are specified: measurement callouts, spacing, component mapping
- [ ] Code Connect mappings link Figma components to code components
- [ ] Reduced motion alternatives are documented (prefers-reduced-motion)
