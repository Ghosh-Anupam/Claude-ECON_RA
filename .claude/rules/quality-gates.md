# Rule: Quality Gates

## Scoring Thresholds

| Score | Gate | Action |
|-------|------|--------|
| < 80 | **Block** | Do not save. Fix issues first. |
| 80–89 | **Commit** | Save work. Flag issues for user review. |
| 90–94 | **Review-Ready** | Present to user with confidence. |
| ≥ 95 | **Submission** | Publication-quality. Ready for journal. |

## Per-Agent Minimum Scores

Each agent must meet these minimums before the next agent can begin:

| Agent | Minimum Score | Key Criterion |
|-------|--------------|---------------|
| Lit Survey | 80 | At least 20 relevant papers, gap identified |
| Data Cleaning | 85 | All .do files run without errors, IDs unique |
| Data Analysis | 85 | All specs run, tables and figures generated |
| Presentation | 80 | LaTeX compiles, all content accurate |
| Journal Article | 90 | Compiles, all refs resolve, no placeholders |

## Automatic Checks

Before scoring, verify:
1. All code files execute without errors
2. All LaTeX files compile without fatal errors
3. All file references are valid (no broken paths)
4. All output files exist and are non-empty

## Escalation

If an agent scores below 80 after 3 revision attempts:
1. Log the persistent issues
2. Present them to the user
3. Ask for guidance before proceeding
4. NEVER skip a quality gate
