---
description: Open existing branch in isolated worktree (local or remote)
---

1. Ask the user for the branch name (e.g., "feature/user-auth" or "origin/feature/user-auth").

2. Detect project name: project=$(basename "$(git rev-parse --show-toplevel)")

3. Create .worktrees dir if missing: mkdir -p ../${project}-worktrees

4. Check if worktree exists: git worktree list | grep ${branch-name}

5. If exists: "Worktree already exists. Open it? (y/n)" — if y, cd ../${project}-worktrees/${branch-name}

6. Fetch latest: git fetch origin

7. Add worktree: git worktree add ../${project}-worktrees/${branch-name} ${branch-name}

8. cd ../${project}-worktrees/${branch-name}

9. Pull latest: git pull origin ${branch-name} (if remote)

10. Report: "Opened ${branch-name} in worktree. Ready for work."
