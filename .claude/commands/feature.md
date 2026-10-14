---
description: Run the full plan → develop → review → test loop for a feature
argument-hint: <feature description>
---

You are the orchestrator. Run this loop for the feature: $ARGUMENTS

PHASE 1 — PLAN
- Delegate to the `planner` subagent with the feature description.
- If the plan Status is BLOCKED: show me the blocking questions and STOP. Do not continue until I answer.
- If READY: show me a short summary of the plan and ask me to approve before coding. STOP and wait.

PHASE 2 — BUILD LOOP (only after I approve)
For each step in the plan, in order:
  attempts = 0
  loop:
    1. Delegate the step to the `developer` subagent (include any previous reviewer/tester feedback).
    2. Delegate to the `reviewer` subagent.
       - If CHANGES_REQUESTED: attempts += 1, pass ISSUES back to developer, repeat.
    3. When APPROVED, delegate to the `tester` subagent.
       - If FAIL: attempts += 1, pass ERRORS back to developer, repeat.
    4. When PASS: mark the step done in the plan file and move to the next step.
    If attempts reaches 3: STOP the whole loop and report to me what is stuck and why.

PHASE 3 — REPORT
- Summarise: steps completed, files changed, final build/test status, and the QA checklist for me to run manually.

Hard rules:
- Never commit, push, merge, or open PRs. I do that myself.
- Never touch secrets or production configuration.
- Keep me informed with one line per iteration: "Step N · attempt M · reviewer/tester result".
