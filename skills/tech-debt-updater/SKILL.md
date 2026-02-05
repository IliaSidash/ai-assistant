---
name: tech-debt-updater
description: "Automates the tracking and management of technical debt in `.agent/memory/tech-debt-backlog.md`. Use this skill when: (1) You encounter legacy code that needs refactoring, (2) You see 'TODO' or 'FIXME' comments that should be tracked, (3) You identify architectural inconsistencies or outdated patterns, (4) You want to view or prioritize existing technical debt."
---

# Tech Debt Updater

This skill enables the systematic tracking of technical debt within the project. It ensures that identified issues are not forgotten and provides a central location for prioritizing modernization efforts.

## Target File

All technical debt is recorded in: [tech-debt-backlog.md](file:///Users/iliasidash/web/tradernet/tn/.agent/memory/tech-debt-backlog.md)

## Workflow

### 1. Identifying Technical Debt

Technical debt can be identified during code review, development, or refactoring. Common sources include:

- Hardcoded values or "magic numbers".
- Lack of test coverage for critical logic.
- Outdated libraries or frameworks.
- Complex, "spaghetti" code that is difficult to maintain.
- Divergence from the project's [constitution](file:///Users/iliasidash/web/tradernet/tn/.agent/memory/constitution.md) or architectural patterns.

### 2. Recording a New Item

When technical debt is identified, add a new row to the `Active Tasks` table in `tech-debt-backlog.md`.

**Fields:**

- **ID**: A unique identifier (e.g., TD-001). Increment based on the last ID in the table.
- **Task Description**: A concise summary of the issue and what needs to be fixed.
- **Source/Location**: File path and line numbers where the debt exists.
- **Priority**: Low, Medium, or High based on impact and urgency.
- **Status**: Default to `Pending`.

### 3. Updating Existing Items

If a task is currently being addressed, update its status to `In Progress`. If a task has been completed by the user or as part of a current task, move it to the `Completed Tasks` section.

## Guidelines for Descriptions

- Be specific: instead of "Refactor code", use "Refactor `AccountMargin` logic to remove dependency on global `imAmRunningInWorker`".
- Include "Why": brieflyMention the benefit of fixing the debt (e.g., "to improve testability" or "to reduce coupling").

## Example Usage

- "I found some legacy logic in `jNTOrder.js`. I'll add it to the tech debt backlog using the `tech-debt-updater` skill."
- "What are the high-priority technical debt items I should focus on?"
- "I've completed the refactoring of `terminal-trading-panel.js`. I'll update the tech debt backlog to mark it as completed."
