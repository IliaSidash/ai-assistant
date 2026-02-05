# Migration Guide: Legacy Mobile Components to FSD

This guide outlines the process and standards for migrating legacy mobile components (from `public/javascripts/app/mobile/components`) to the new FSD architecture.

## Target Directory

All shared mobile components should be placed in:
`frontend/fsd/shared/ui/mobile/`

## Component Standards

### 1. File Naming

- Use kebab-case with `.mobile.vue` suffix.
- Example: `card.mobile.vue`, `button.mobile.vue`.

### 2. Technology Stack

- **Vue 2.7**: Compatible with both legacy and new environments.
- **Composition API**: Use `<script setup>` where possible.
- **Tailwind CSS**: Use Tailwind for new styles (when refactoring styles). For initial migration, retain legacy classes if required.

### 3. Implementation Patterns

#### Minimal Script

If the component only requires basic slot check or event emission, use a minimal `<script setup>`.

#### Slot Verification

Use `$slots` directly in the template to check for slot existence (especially for optional headers/footers).

```vue
<template>
  <div class="component-wrapper">
    <div v-if="$slots.header" class="header">
      <slot name="header" />
    </div>
    <slot />
  </div>
</template>
```

#### Event Emission

Emit events directly from the template using `$emit`.

```vue
<template>
  <div @click="$emit('click', $event)">...</div>
</template>
```

## Migration Workflow

1.  **Analyze**: Locate the legacy `.js` file and its corresponding template in `mobile-components.phtml`.
2.  **Plan**: Identify slots, props, and events.
3.  **Implement**: Create the `.mobile.vue` file in `frontend/fsd/shared/ui/mobile/`.
4.  **Verify**: Ensure the component structure matches legacy requirements.
5.  **Track**: Update `tech-debt-backlog.md` status to `Done` and update the location.

## Example (Card Component)

Refer to [card.mobile.vue](file:///Users/iliasidash/web/tradernet/tn/frontend/fsd/shared/ui/mobile/card.mobile.vue) for a reference implementation.
