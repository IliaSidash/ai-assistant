---
description: Migrate legacy mobile component to FSD (Vue 2.7)
---

This workflow automates the migration of legacy mobile components to the new FSD architecture.

### Trigger

Usage: `/migrate-v2 [TD-ID]` (e.g., `/migrate-v2 TD-MIG-102`)

### Steps

1. **Analysis & Planning**
   - Read the target task from `.agent/memory/tech-debt-backlog.md` using the provided `[TD-ID]`.
   - Locate the legacy JS file in `public/javascripts/app/mobile/components/`.
   - Locate its template in `application/views/scripts/_helper/mobile/mobile-components.phtml`.
   - Identify props, slots, and logic.

2. **FSD Implementation**
   - Create the new component: `frontend/fsd/shared/ui/mobile/[name].mobile.vue`.
   - Use **Vue 2.7 Composition API** standards established in `.agent/memory/migration-guide.md`.
   - Use `$slots` directly in the template for optional slots (e.g., `v-if="$slots.header"`).
   - Use minimal `<script setup>` for event emissions and essential logic.
   - Register the component in `frontend/fsd/app/vue-plugins/mobile-components-registry/index.ts`.

3. **Legacy Cleanup**
   - Delete the legacy `.js` file from `public/javascripts/app/mobile/components/`.
   - Delete the `<script id="...">` template block from `application/views/scripts/_helper/mobile/mobile-components.phtml`.
   - Remove the component from `public/javascripts/app/require-config.js`.

4. **Dependency Refactoring**
   - Search for all files that list this component as a dependency in AMD `define()` calls:
     ```bash
     grep -r "define(.*['\"]COMPONENT_NAME['\"]" public/javascripts/app/mobile
     ```
   - In each found file, remove the component from the dependency array and the factory function arguments.

5. **Tracking & Documentation**
   - Update the status in `.agent/memory/tech-debt-backlog.md` to `Done` and update the `Source/Location` column.
   - Summarize the work in a `walkthrough.md`.
