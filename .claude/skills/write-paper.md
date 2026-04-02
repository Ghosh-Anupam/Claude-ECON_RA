# Skill: /write-paper

## Usage
```
/write-paper                       # Full journal article
/write-paper --style aer           # AER format (default)
/write-paper --style jeem          # JEEM format
/write-paper --style jhr           # JHR format
/write-paper --section intro       # Write/rewrite introduction only
/write-paper --section results     # Write/rewrite results only
```

## Description
Dispatch the Journal Article Agent to produce a complete manuscript.

## Workflow
1. Read `.claude/agents/journal-article-agent.md`
2. Read `.claude/rules/latex-conventions.md`
3. Review all materials (presentation, tables, figures, lit survey)
4. Ask framing and style questions
5. Write the complete article
6. Compile and verify

## Quick Reference
- Input: `Presentation/`, `Tables/`, `Figures/`, `LitSurvey/`, `Bibliography.bib`
- Output: `Paper/main.tex`, `Paper/main.pdf`, `Paper/sections/*.tex`
- Interactive: YES — confirms journal style, contribution framing, and structure
