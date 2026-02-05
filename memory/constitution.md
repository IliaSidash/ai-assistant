# Project Constitution

This document defines the architectural principles, technical stack, and coding standards for the Tradernet project. It serves as the foundational knowledge base for AI agents working with this codebase.

## Architecture Overview

### Feature-Sliced Design (FSD)

The project follows **Feature-Sliced Design** methodology with a clear hierarchical structure:

- **`frontend/fsd/`**: Main FSD-compliant codebase
  - **`app/`**: Application initialization, providers, global styles, routing
  - **`pages/`**: Route-level pages and compositions
  - **`widgets/`**: Composite blocks combining features and entities
  - **`features/`**: User interactions and business logic slices
  - **`entities/`**: Business models and domain logic
  - **`shared/`**: Reusable infrastructure, UI kit, utilities

**Import Rules (Strict)**:

- Lower layers CANNOT import from higher layers
- Layer hierarchy (bottom to top): `shared` → `entities` → `features` → `widgets` → `pages` → `app`
- Slices within the same layer should NOT cross-import

### Legacy Code

- **`frontend/src/`**: Legacy code being incrementally migrated to FSD
- **`public/javascripts/`**: Old legacy code (jQuery, AMD).
  - **Strictly no new files** should be created in this directory.
  - Only support and refactoring of existing code are permitted.
- New features should be built in `fsd/`, not `src/` or `public/javascripts/`
- When modifying legacy code, consider refactoring to FSD structure when feasible

## Tech Stack

### Core Frameworks

- **Vue 3** (`^3.5.12`): Primary UI framework with Composition API
- **Vue 2** (`2.7.16`): Legacy support (being phased out)
- **Pinia** (`^2.1.7`): State management
- **Vue Router** (`^4.5.0`): Client-side routing

### Build & Development

- **Rspack** (`^1.3.13`): Primary bundler (replacing Webpack)
- **Webpack** (`^5.64.2`): Legacy bundler
- **TypeScript** (`^5.4.3`): Type safety
- **Storybook** (`^8.6.14`): Component development and documentation

### Styling

- **TailwindCSS** (`^3.4.14`): Utility-first CSS framework
- **PostCSS** (`^8.4.5`): CSS processing
- **LESS**: Legacy stylesheets (being phased out)

### Testing & Quality

- **Jest** (`^29.5.0`): Unit testing
- **ESLint** (`^8.9.0`): Linting
- **Prettier** (`^3.2.4`): Code formatting

### Charting & Visualization

- **Chart.js** (`4.4.0`): General charting
- **Lightweight Charts** (`^4.2.3`): Financial charts
- **D3**: Data manipulation and scales

## Code Conventions

### Component Structure

**Vue 3 Components** (Preferred):

```vue
<template>
  <!-- Template content -->
</template>

<script setup>
// Composition API with <script setup>
import { ref, computed } from "vue";

// Props
const props = defineProps({
  // ...
});

// Logic
</script>

<style scoped>
/* Component styles */
</style>
```

### Naming Conventions

- **FSD Directory (`fsd/`)**: All files must use **kebab-case** notation (e.g., `user-profile.vue`, `use-environment.js`).
- **Components**: PascalCase (e.g., `UserProfile.vue`) — _Note: Legacy/non-FSD components_
- **Composables**: camelCase with `use` prefix (e.g., `useEnvironment.js`)
- **Utilities**: camelCase (e.g., `formatCurrency.js`)
- **Constants**: UPPER_SNAKE_CASE (e.g., `API_BASE_URL`)

### File Organization

- Each component should have a corresponding `.stories.js` file for Storybook
- Tests should be co-located with source files as `*.test.js` or `*.spec.js`
- Complex features should have their own directory with an `index.js` barrel export

### TypeScript Guidelines

- Prefer explicit typing over `any`
- Use interfaces for object shapes, types for unions/primitives
- Utilize Vue 3's type inference with `<script setup lang="ts">`
- **Never ignore TypeScript errors** (e.g., no `@ts-ignore`, `@ts-nocheck`, or `any` to bypass errors) unless explicitly approved by the user.

### Code Quality

- Run `yarn lint` before committing
- ESLint and Prettier are configured to run on save
- Use `yarn lint-changed` to check only modified files

### Testing

- Run tests with `yarn test`
- Aim for meaningful test coverage on business logic and utilities
- Use `@vue/test-utils` for component testing

## Infrastructure Directories

### `.agent/`

- **Purpose**: AI agent configuration and extensions
- **Key Files**:
  - `constitution.md`: This document
  - `skills/`: Custom AI capabilities
  - `workflows/`: Procedural task definitions
- **Note**: Do not store application code here; it's purely for AI tooling

## Migration Strategy

The project is transitioning from legacy patterns to FSD:

- **New features**: Always implement in `fsd/`
- **Bug fixes in legacy code**: Fix in place, refactor to FSD if time permits
- **Refactoring**: Incrementally move stable features from `src/` to `fsd/`
