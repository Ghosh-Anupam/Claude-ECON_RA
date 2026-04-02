# Skill: /analyze

## Usage
```
/analyze                       # Full analysis pipeline
/analyze --sumstats            # Summary statistics only
/analyze --main                # Main regression only
/analyze --event-study         # Event study only
/analyze --robustness          # Robustness checks only
/analyze --heterogeneity       # Heterogeneity analysis only
/analyze --replicate           # Re-run all scripts to verify reproducibility
```

## Description
Dispatch the Data Analysis Agent to implement the empirical strategy and produce all tables, figures, and replication code.

## Workflow
1. Read `.claude/agents/data-analysis-agent.md`
2. Read `.claude/rules/stata-conventions.md`
3. Ask the full battery of analysis questions (ID strategy, clustering, specs, robustness)
4. Wait for all answers
5. Execute: summary stats → main analysis → event study → robustness → heterogeneity
6. Create replication package in `Scripts/replication/`

## Quick Reference
- Input: `Data/cleaned/analysis_dataset.dta`
- Output: `Tables/*.tex`, `Figures/*.pdf`, `Scripts/analysis/*.do`, `Scripts/replication/`
- Interactive: YES — asks ~16 questions about specifications before running anything
