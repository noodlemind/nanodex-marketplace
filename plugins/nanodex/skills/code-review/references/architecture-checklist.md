# Architecture Review Checklist

## SOLID Principles

### Single Responsibility
- [ ] Each class/module has one clear reason to change
- [ ] Methods do one thing and do it well
- [ ] No "god classes" with unrelated responsibilities

### Open/Closed
- [ ] New behavior can be added without modifying existing code
- [ ] Extension points exist where variability is expected
- [ ] Configuration preferred over code changes for toggleable behavior

### Liskov Substitution
- [ ] Subtypes can replace base types without breaking behavior
- [ ] No type-checking or casting to determine subtype behavior
- [ ] Overridden methods maintain the contract of the parent

### Interface Segregation
- [ ] No client forced to depend on methods it doesn't use
- [ ] Large interfaces split into focused ones
- [ ] Adapter pattern used to bridge incompatible interfaces

### Dependency Inversion
- [ ] High-level modules don't depend on low-level implementation details
- [ ] Dependencies injected rather than instantiated internally
- [ ] Abstractions owned by the consumer, not the provider

## Coupling & Cohesion

- [ ] Modules communicate through well-defined interfaces
- [ ] No circular dependencies between modules
- [ ] Related functionality lives together (high cohesion)
- [ ] Unrelated functionality is separated (low coupling)
- [ ] Changes to one module don't cascade to unrelated modules

## Design Patterns

- [ ] New code follows existing patterns in the codebase
- [ ] Pattern usage is appropriate (not forced or over-applied)
- [ ] No anti-patterns: God class, spaghetti code, shotgun surgery
- [ ] Abstractions are justified (not premature or unnecessary)

## Structural Consistency

- [ ] Directory structure matches existing project conventions
- [ ] File naming follows established patterns
- [ ] Import/require organization matches codebase style
- [ ] Public API surface is intentional and minimal
- [ ] Error handling follows project conventions
