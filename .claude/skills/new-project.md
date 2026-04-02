# Skill: /new-project

## Usage
```
/new-project
```

## Description
Initialize a new research project from a research proposal. This is the entry point for the entire pipeline.

## Workflow

### 1. Accept Research Proposal
Ask the user to provide their research proposal (300–500 words) containing:
1. Research question / main idea
2. Data sources
3. Proposed identification strategy
4. Statistical software preference (Stata/R/Python)
5. Desired output (paper, slides, or both)

### 2. Parse and Confirm
Extract and confirm:
- **Research Question**: [restate clearly]
- **Data Sources**: [list each one]
- **Method**: [identification strategy]
- **Software**: [Stata/R/Python]
- **Output**: [paper/slides/both]

Ask: "Is this correct? Any changes before I begin?"

### 3. Set Up Project
- Update `MEMORY.md` with project metadata
- Create `quality_reports/plans/[date]_project_setup.md`
- Verify directory structure exists

### 4. Dispatch Pipeline
Present the execution plan:
```
Phase 1: Lit Survey Agent    → Literature review PDF
Phase 2: Data Cleaning Agent → Unified datasets + .do files
Phase 3: Data Analysis Agent → Tables, figures, replication code
Phase 4: Presentation Agent  → Beamer slide deck
Phase 5: Journal Article Agent → AER/JEEM-style paper
```

Ask: "Ready to begin with Phase 1 (Literature Survey)?"

### 5. Begin Phase 1
Dispatch the Lit Survey Agent with the research proposal as input.
