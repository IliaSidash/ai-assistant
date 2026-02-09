---
description: Run a structured code review
---

## Steps

### 1) Generate Diff (MANDATORY)

- Run:
  - git diff -U3 --no-color origin/develop...HEAD
- Capture the full output as the review input.
- If diff is empty:
  - report: "No changes detected vs origin/main...HEAD" and stop.

### 2) Interpret Changes

- Summarize the diff intent in 3–6 bullets:
  - what changed,
  - why (if inferable),
  - key files/modules touched.

### 3) Review Rules (ONLY DIFF SCOPE)

IMPORTANT:

- You MUST review only what is in the diff.
- Do NOT invent context from other files unless explicitly present in the diff.
- If missing context blocks review, state "needs context" explicitly.

Review categories:

- Correctness / edge cases
- Code quality / maintainability
- Architecture / design boundaries
- Security & privacy
- Performance & reliability
- Tests & observability
- Consistency with existing patterns (only if visible from diff)

**Project-specific rules (from `.agent/memory/constitution.md`):**

- **defineEmits**: Must use object syntax `defineEmits({ event: null })`, not array syntax
- **Icons**: Must use `<FFIcon name="..." />` instead of direct icon components
- **No Magic Strings/Numbers**: Extract values into constants, prefer deriving from types
- **DRY**: No duplicated code — extract into reusable helper functions

### 4) Output (MANDATORY FORMAT)

Return the review in this structure:

#### ✅ Summary

- 3–6 bullets on what the diff changes

#### 🧱 Blockers (must fix)

- [file path] (function/class if possible): issue → why it matters → suggested fix

#### ⚠️ Non-blockers (should fix)

- [file path] issue → suggested fix

#### 💡 Suggestions (nice to have)

- improvements, refactors, readability

#### 🧪 Tests / Coverage Notes

- missing tests + what cases to add

#### 🔐 Security / Privacy Notes

- risks + mitigations

#### 🚀 Performance / Reliability Notes

- hotspots + mitigations

#### ✅ Final Verdict

- Approve / Request Changes
- Confidence: High / Medium / Low
- Risks to monitor after merge

### 5) Optional: Provide PR Comment Draft

- Provide a ready-to-paste PR comment summarizing the review.
