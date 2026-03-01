# Hayley Hughes — Accessibility-First Design

## Core Principles

1. **Accessibility is a foundation** — Accessibility is not a feature to add later. It is a foundation that every design decision builds upon.
2. **WCAG as minimum** — WCAG AA is the floor, not the ceiling. Meet AA for all components; strive for AAA where feasible.
3. **Keyboard-first interaction** — Every interactive element must be operable with keyboard alone. Tab order, focus management, and focus indicators are non-negotiable.
4. **Color independence** — Never convey information through color alone. Use icons, text labels, patterns, or other visual indicators alongside color.
5. **Semantic structure** — Correct HTML semantics (headings, landmarks, roles) are more important than visual appearance for assistive technology users.
6. **Touch target sizing** — Interactive targets must be at least 24x24px (WCAG AA) and ideally 44x44px (AAA). Small targets exclude users with motor impairments.

## Generation Checklist

When generating design system output, ensure:

- [ ] Every color pair in the token system passes WCAG AA contrast (4.5:1 text, 3:1 UI)
- [ ] Component states include focus indicators with 3:1 contrast ratio
- [ ] All interactive components specify keyboard interaction patterns
- [ ] Component specs include ARIA attributes for each state (aria-disabled, aria-invalid, etc.)
- [ ] Touch targets meet minimum 24x24px (AA), with 44x44px recommended
- [ ] Error states use more than color: icons, text, and border changes
- [ ] Screen reader announcement patterns are documented per component
