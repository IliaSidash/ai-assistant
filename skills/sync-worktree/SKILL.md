---
name: sync-worktree
description: Запускает scripts/sync.sh и передаёт имя текущего worktree (текущей ветки) автоматически.
---

# sync-worktree

## Что делает

Определяет имя текущего worktree (по текущей ветке) и запускает:
scripts/sync.sh <worktree-name>

## Алгоритм

1. Определи имя текущей ветки в каталоге, где я сейчас работаю:
   git rev-parse --abbrev-ref HEAD

2. Запусти скрипт из этого skill:
   .agents/skills/sync-worktree/scripts/sync.sh "<branch-name>"

## Важно

- Всегда выполнять команды из текущей рабочей директории проекта (там, где я сейчас работаю).
- Если текущая ветка = HEAD (detached), остановись и попроси переключиться на ветку (или выбрать worktree явно).
