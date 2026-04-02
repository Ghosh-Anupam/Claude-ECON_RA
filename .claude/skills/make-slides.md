# Skill: /make-slides

## Usage
```
/make-slides                       # Full presentation
/make-slides --format job-market   # 45-60 min job market talk
/make-slides --format seminar      # 30-45 min seminar (default)
/make-slides --format conference   # 15-20 min short talk
/make-slides --format lightning    # 5-10 min lightning talk
```

## Description
Dispatch the Presentation Agent to create a Beamer LaTeX slide deck.

## Workflow
1. Read `.claude/agents/presentation-agent.md`
2. Read `.claude/rules/latex-conventions.md`
3. Catalog all available tables and figures
4. Ask format and emphasis questions
5. Build, compile, and verify the deck

## Quick Reference
- Input: `Tables/`, `Figures/`, `LitSurvey/`, analysis scripts
- Output: `Presentation/presentation.tex`, `Presentation/presentation.pdf`
- Interactive: YES — confirms format and emphasis before building
