# Skill: /lit-survey

## Usage
```
/lit-survey [topic]
/lit-survey --update       # Update existing review with new papers
/lit-survey --table-only   # Regenerate the literature table only
```

## Description
Dispatch the Lit Survey Agent to conduct a comprehensive literature review.

## Workflow
1. Read `.claude/agents/lit-survey-agent.md`
2. If topic is provided, use it; otherwise ask
3. Follow the agent's interactive questioning protocol
4. Produce outputs in `LitSurvey/`
5. Update `Bibliography.bib`
6. Score and report quality

## Quick Reference
- Input: Research question + topic keywords
- Output: `LitSurvey/literature_review.pdf`, `Bibliography.bib`
- Interactive: YES — agent asks 5 scoping questions before searching
