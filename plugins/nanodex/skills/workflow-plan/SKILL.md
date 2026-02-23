---
name: workflow-plan
description: >
  Creates structured implementation plans from feature descriptions.
  Reads the codebase, identifies patterns and conventions, and produces
  a detailed plan document in docs/plans/.
  Use when asked to "plan a feature", "create a plan", "write a spec",
  or "plan implementation".
argument-hint: "[feature description or topic]"
allowed-tools: Read, Glob, Grep, Task, Bash, Write
---

# Structured Planning Workflow

Create a well-structured implementation plan from a feature description. The plan explores the codebase, identifies existing patterns and conventions, and produces a detailed plan document.

## Workflow

### Step 1: Understand the Request

1. Read the feature description from `$ARGUMENTS` or the user's message
2. If the description is vague, ask clarifying questions (interactive mode only)
3. Identify the type: feature, bug fix, refactor, or improvement

### Step 2: Explore the Codebase

1. Read the project's CLAUDE.md or README for conventions and patterns
2. Use Glob to find files related to the feature area
3. Use Grep to search for similar implementations or patterns
4. Read key files to understand the existing architecture
5. Note the tech stack, framework, and coding conventions

### Step 3: Research & Context

1. Check `docs/plans/` for existing plans that might be related
2. Look for similar features already implemented in the codebase
3. Identify dependencies and files that will need changes
4. Estimate scope: how many files, what areas of the codebase

### Step 4: Draft the Plan

Create a structured plan document with:

```markdown
---
title: "[Type]: [Brief Description]"
type: [feat|fix|refactor]
status: active
date: YYYY-MM-DD
---

# [Title]

## Overview
[What this plan covers and why]

## Problem Statement
[What problem this solves or what feature this adds]

## Proposed Solution
[High-level approach]

## Implementation Steps

### Step 1: [First logical unit]
- [ ] Task description
- Files: `path/to/file.ext`

### Step 2: [Second logical unit]
- [ ] Task description
- Files: `path/to/file.ext`

## Acceptance Criteria
- [ ] Criterion 1
- [ ] Criterion 2

## Files to Change
- `path/to/file.ext` — description of changes

## Risks & Considerations
[Anything that could go wrong or needs extra attention]
```

### Step 5: Write the Plan

1. Create the plan file at `docs/plans/YYYY-MM-DD-<type>-<name>-plan.md`
2. Use a descriptive filename (e.g., `2026-02-22-feat-user-authentication-plan.md`)

### Step 6: Present & Get Feedback

**Interactive mode** (user invoked directly):
- Present a summary of the plan
- Ask if they want to refine, approve, or start implementing

**Non-interactive mode** (invoked by an agent):
- Return the plan file path for the orchestrating agent to use

## Guidelines

- Follow existing codebase conventions discovered during exploration
- Keep plans actionable — every step should be concrete enough to implement
- Include file paths for every change so implementation is clear
- Don't over-plan: focus on what's needed, not every possible edge case
- Reference existing patterns in the codebase when proposing solutions
