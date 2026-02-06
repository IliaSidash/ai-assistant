---
description: Create isolated worktree for new feature branch from develop
---

1. Ask the user for the name of the branch (e.g., "user-auth").

2. Detect project name: project=$(basename "$(git rev-parse --show-toplevel)")

3. Check if .worktrees exists and is ignored: git check-ignore .worktrees (if not, add to .gitignore and commit).

4. Switch to develop: git checkout develop

5. Pull latest: git pull origin develop

6. Create worktree: git worktree add ../${project}-worktrees/${branch-name} -b ${branch-name}

7. Report: "Worktree created at ../${project}-worktrees/${branch-name}. Ready for isolated work. cd there to start agent."
