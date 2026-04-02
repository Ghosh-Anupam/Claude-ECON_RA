# Rule: Plan-First Workflow

## Protocol
For ANY non-trivial task:
1. **Plan** — Draft approach, list files to create/modify, identify risks
2. **Save** — Persist plan to `quality_reports/plans/YYYY-MM-DD_description.md`
3. **Present** — Show plan to user for approval
4. **Execute** — Implement with plan as checklist
5. **Log** — Save session log to `quality_reports/session_logs/`

## Plan Template
```markdown
# Plan: [Description]
**Date**: YYYY-MM-DD
**Agent**: [Which agent]
**Status**: DRAFT / APPROVED / IN PROGRESS / COMPLETED

## Goal
[One sentence]

## Approach
[Numbered steps]

## Files to Create/Modify
- [ ] file1.do
- [ ] file2.tex

## Risks
- [What could go wrong]

## Verification
- [How to check success]
```

## Session Logging (3 Triggers)
1. **After plan approval** — create the log
2. **During implementation** — append key decisions
3. **At session end** — summarize accomplishments and open questions

## Context Preservation
- NEVER use `/clear` — rely on auto-compression
- Plans survive context compression because they're saved to disk
- Always reference the plan file when resuming work
