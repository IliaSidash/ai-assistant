---
name: directory-constitution-updater
description: Updates the project's constitution with architectural insights and infrastructure documentation. Use sparingly for documenting core architectural layers, design patterns, or tooling directories. NOT for individual feature/page directories—those should use inline README.md files instead.
---

# Directory Constitution Updater

## Overview

This skill helps maintain the project's "constitution" (`.agent/memory/constitution.md`) by documenting **architectural principles** and **infrastructure directories**. The constitution focuses on high-level patterns, not detailed directory descriptions.

## When to Use This Skill

**✅ Use for:**

- Documenting new **architectural layers** (e.g., a new FSD layer)
- Adding **infrastructure/tooling directories** (e.g., `.agent/`, `scripts/`, build configs)
- Updating **tech stack** changes (e.g., switching bundlers, adding new frameworks)
- Recording **coding conventions** or **import rules**

**❌ Do NOT use for:**

- Individual feature directories (e.g., `features/user-profile`)
- Page-level directories (e.g., `pages/dashboard`)
- Widget or entity slices
- Regular application code directories

**Instead:** For application code, create a `README.md` within that directory to document its purpose.

## Workflow

### 1. Determine if Constitution Update is Needed

Ask yourself:

- Is this an **architectural** change or a **feature** change?
- Will this affect how developers/AI understand the **entire project structure**?
- Is this **infrastructure** or **tooling** that won't change frequently?

If the answer is "no" to all, **create a README.md** in the directory instead.

### 2. Explore the Subject Matter

- Use `list_dir`, `view_file`, `grep_search` to understand the changes
- Identify if it's a new layer, pattern, or tech stack change

### 3. Update Constitution

- **Read Constitution**: Always read `.agent/memory/constitution.md` first
- **Identify Section**: Determine which section to update:
  - `Architecture Overview`: For FSD layers, import rules, design patterns
  - `Tech Stack`: For framework/library changes
  - `Code Conventions`: For new naming or organizational standards
  - `Infrastructure Directories`: For tooling directories only
- **Update Concisely**: Add only essential information

### 4. Deprecate the Template

The old template for directory descriptions is no longer used. Focus on architectural principles instead.

## Guidelines

- **Conciseness**: The constitution should be scannable. Avoid verbose descriptions.
- **Stability**: Only document things that are stable and won't change frequently.
- **Architectural Focus**: Prioritize "why" and "how" over "what".
