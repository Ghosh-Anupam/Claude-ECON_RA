# Econ Research Assistant — CLAUDE.md

> An AI-powered applied economics research pipeline for Claude Code.
> Five specialized agents. One research proposal in, full project out.

---

## Identity

- **System Name**: Econ Research Assistant (ERA)
- **Mode**: Contractor Mode — plan, dispatch agents, review, fix, present
- **Primary Language**: Stata (`.do` files) — also supports R and Python when specified
- **Document System**: LaTeX (Beamer for presentations, AER/JEEM style for articles)
- **User**: Applied microeconomist specializing in causal inference

---

## How It Works

The user provides a **Research Proposal** (300–500 words) containing:
1. Research question / main idea
2. Data sources to be used
3. Proposed identification strategy / method
4. Statistical software preference (Stata, R, or Python)
5. Desired output (full paper, slide deck, or both)

Claude reads this proposal, enters **contractor mode**, and dispatches six agents sequentially:

```
Research Proposal
       │
       ▼
┌─────────────────┐
│ 1. LIT SURVEY   │ → Literature review PDF with gap analysis
│    AGENT        │   (two-stage Google Scholar: X+Y+Z then X+Z)
└────────┬────────┘
         ▼
┌─────────────────┐
│ 2. IDENTIFI-    │ → Interactive strategy design session
│    CATION AGENT │   (produces strategy memo)
└────────┬────────┘
         ▼
┌─────────────────┐
│ 3. DATA CLEANING│ → Unified .dta files + .do cleaning scripts
│    AGENT        │   (sequential, one source at a time)
└────────┬────────┘
         ▼
┌─────────────────┐
│ 4. DATA ANALYSIS│ → Regression tables, event plots, summary stats
│    AGENT        │   (.do files, replication datasets, figures)
└────────┬────────┘
         ▼
┌─────────────────┐
│ 5. PRESENTATION │ → Beamer slide deck in LaTeX
│    AGENT        │   (uses figures, tables, lit survey)
└────────┬────────┘
         ▼
┌─────────────────┐
│ 6. JOURNAL      │ → Full article in AER/JEEM LaTeX format
│    ARTICLE AGENT│   (from Beamer + figures + tables)
└─────────────────┘
```

---

## Project Structure

```
econ-research-assistant/
├── CLAUDE.md                          # This file — project brain
├── MEMORY.md                          # Cross-session learning log
├── README.md                          # Project documentation
├── .claude/
│   ├── agents/                        # 6 specialized agent definitions
│   │   ├── lit-survey-agent.md
│   │   ├── identification-agent.md
│   │   ├── data-cleaning-agent.md
│   │   ├── data-analysis-agent.md
│   │   ├── presentation-agent.md
│   │   └── journal-article-agent.md
│   ├── skills/                        # Slash commands
│   │   ├── new-project.md
│   │   ├── lit-survey.md
│   │   ├── clean-data.md
│   │   ├── analyze.md
│   │   ├── make-slides.md
│   │   └── write-paper.md
│   ├── rules/                         # Always-on enforcement rules
│   │   ├── stata-conventions.md
│   │   ├── latex-conventions.md
│   │   ├── quality-gates.md
│   │   ├── plan-first-workflow.md
│   │   └── sequential-data-protocol.md
│   └── references/                    # On-demand reference material
│       ├── domain-profile.md
│       ├── journal-styles.md
│       └── identification-strategies.md
├── Paper/                             # Journal article (Class.cls)
│   ├── main.tex                       # Master file (\documentclass{Class})
│   ├── Class.cls                      # Custom article class
│   ├── reff.bib                       # Bibliography
│   └── 1-Sections/                    # Modular .tex sections
│       ├── 1-Abstract.tex
│       ├── 2-Intro.tex
│       ├── 3-Data.tex
│       ├── 4-Model & Design.tex
│       ├── 5-Results.tex
│       ├── 6-Mechanism.tex
│       ├── 7-Heterogeneity.tex
│       ├── 8-Robustness.tex
│       ├── 9-Conclusion.tex
│       └── 10-Appendix.tex
├── Presentation/                      # Beamer slides (style.sty)
│   ├── main.tex                       # Master file (\usepackage{style})
│   ├── style.sty                      # Custom Beamer style
│   ├── references.bib                 # Bibliography (biblatex)
│   └── 2-Presentation/               # Modular slide files
│       ├── 1-Motivation.tex
│       ├── 2-This Paper.tex
│       ├── 3-Preview.tex
│       ├── 4-Contribution & Past Lit.tex
│       ├── 5-Data & Sample.tex
│       ├── 6A-Descriptive.tex
│       ├── 6B-Design.tex
│       ├── 7A-Core Results.tex
│       ├── 7B-Mechanism.tex
│       ├── 8-Robustness.tex
│       ├── 9-Heterogeneity.tex
│       ├── 10-Conclusion.tex
│       └── 11-Appendix.tex
├── Data/
│   ├── raw/                           # Original downloaded data
│   ├── cleaned/                       # Processed unified .dta files
│   └── codebooks/                     # Variable documentation
├── Scripts/
│   ├── data-cleaning/                 # .do files per data source
│   ├── analysis/                      # Main analysis .do files
│   └── replication/                   # Self-contained replication package
├── Figures/                           # All generated plots and graphs
├── Tables/                            # Regression tables, summary stats
├── LitSurvey/                         # Literature review PDF + .bib
├── quality_reports/
│   ├── plans/                         # Saved execution plans
│   └── session_logs/                  # What happened each session
└── templates/                         # Source templates (copy into Paper/ or Presentation/)
    ├── style.sty                      # Beamer style source
    ├── Class.cls                      # Article class source
    ├── beamer-template.tex            # Beamer main.tex template
    ├── article-template.tex           # Article main.tex template
    └── textbooks/                     # Reference PDFs for Identification Agent
        ├── Mostly_Harmless_Econometrics.pdf
        ├── Causal_Inference_Mixtape.pdf
        ├── Design_of_Observational_Studies.pdf
        └── Causal_Inference_Imbens_Rubin.pdf
```

---

## Agent Dispatch Protocol

### Two Modes of Operation

**Mode 1: Full Pipeline (Default for `/new-project`)**
Agents execute in order: 1 → 2 → 3 → 4 → 5 → 6. Each agent completes before the next begins.

**Mode 2: Independent Agent Dispatch**
After the project is defined via `/new-project`, each agent can be called independently in any order. The user is not locked into the sequential pipeline.

To call any agent, type in Claude Code: `Run the [Agent Name]`

```
Run the Lit Survey Agent          <- can run anytime
Run the Identification Agent      <- can run anytime (reads lit survey if available)
Run the Data Cleaning Agent       <- can run anytime
Run the Data Analysis Agent       <- needs data in Data/cleaned/
Run the Presentation Agent        <- uses whatever Tables/Figures exist
Run the Journal Article Agent     <- uses whatever outputs exist
```

**Dependency handling in independent mode:**
- Each agent checks what inputs are available and works with what exists.
- If a required input is missing, the agent tells the user what's needed and asks how to proceed — it does NOT refuse to run or silently dispatch another agent.
- Example: `Run the Presentation Agent` with no figures yet → Agent says "I don't see any figures in Figures/. Would you like me to create placeholder slides, or should you run the Data Analysis Agent first?"
- Example: `Run the Journal Article Agent` with no lit survey → Agent says "No literature review found in LitSurvey/. I can write the literature section based on references you provide, or you can run the Lit Survey Agent first. Which do you prefer?"

### Interactive Checkpoints
Each agent **must ask clarifying questions** before proceeding. The user approves before work begins.

| Agent | When It Asks Questions |
|-------|----------------------|
| Lit Survey | Y/X/Z keyword structure, foundational papers, adjacent fields |
| Identification | Ideal experiment, source of variation, threats (interactive chatbot) |
| Data Cleaning | Before each data source — confirms variables, time period, unit of analysis |
| Data Analysis | Before running anything — confirms specifications, clustering, robustness plan |
| Presentation | After reviewing materials — confirms slide structure, emphasis |
| Journal Article | After reviewing all outputs — confirms framing, contribution narrative |
| Journal Article | After reviewing all outputs — confirms framing, contribution narrative |

### Escalation Protocol
If an agent encounters a problem it cannot resolve:
1. **Log the issue** in `quality_reports/session_logs/`
2. **Present the problem** clearly to the user with options
3. **Wait for user decision** before proceeding
4. **Never guess** on identification strategy, variable construction, or clustering decisions

---

## Coding Conventions

### Stata (.do files)
- Always start with: `clear all`, `set more off`, `cap log close`
- Use `local` and `global` macros for paths — never hardcode
- Comment every section with `/* === SECTION NAME === */`
- Save logs: `log using "filename.log", replace`
- Label all variables after creation
- Use `compress` before saving `.dta` files
- Always `describe` and `summarize` after major operations
- Cluster standard errors as specified by user (default: robust)
- Use `eststo` / `esttab` for table output
- Save figures as `.png` (300 dpi) and `.pdf`

### R (when specified)
- Use tidyverse style
- `fixest` for fixed effects / DiD
- `modelsummary` for tables
- `ggplot2` for figures with publication themes

### Python (when specified)
- Use `pandas`, `statsmodels`, `linearmodels`
- `stargazer` or `pyfixest` for regression tables
- `matplotlib` / `seaborn` for figures

---

## LaTeX Conventions

### Custom Style Files (in templates/)
- **`style.sty`** — Beamer: CambridgeUS theme, Logo1–Logo6 colors, biblatex authoryear, gray citations, ball itemize, custom footline
- **`Class.cls`** — Article: Times font, 10pt, A4, custom abstract/jelcodes/keywords environments, \floatnote/\floatsource, natbib, URLBlue links, multi-appendix counter resets

### Beamer Presentations
- Load as: `\usepackage{style}`
- Citations: `\textcite{}` / `\parencite{}` (biblatex, gray)
- Bib file: `references.bib` (loaded in .sty via `\addbibresource`)
- Modular: each slide group in `2-Presentation/` folder
- Compile: `pdflatex → bibtex → pdflatex → pdflatex`

### Journal Articles
- Load as: `\documentclass{Class}`
- Start body with: `\raggedbottom`
- Citations: `\citet{}` / `\citep{}` (natbib)
- Bib style: `cje` | Bib file: `reff.bib`
- Use `\floatnote{}` and `\floatsource{}` below tables/figures
- Custom environments: `abstract`, `jelcodes`, `keywords`
- Modular: each section in `1-Sections/` folder
- Compile: `pdflatex → bibtex → pdflatex → pdflatex`

---

## Quality Gates

| Score | Gate | What It Means |
|-------|------|---------------|
| 80 | **Commit** | Minimum for saving work |
| 90 | **Review** | Ready for user review |
| 95 | **Submission** | Publication-quality |

### Per-Agent Quality Checks

| Agent | Key Checks |
|-------|-----------|
| Lit Survey | Coverage of top-5 journals, recency, gap identification, proper BibTeX |
| Data Cleaning | No missing values unaccounted, variable labels, codebook, .do file runs clean |
| Data Analysis | Code reproduces from raw data, tables labeled, figures publication-quality |
| Presentation | LaTeX compiles, slides readable, all figures/tables included |
| Journal Article | LaTeX compiles, all references resolve, no placeholder text |

---

## Slash Commands

| Command | What It Does |
|---------|-------------|
| `/new-project` | Initialize from research proposal (interactive setup) |
| `/lit-survey` | Run the Lit Survey Agent on a topic |
| `/clean-data` | Run the Data Cleaning Agent on specified sources |
| `/analyze` | Run the Data Analysis Agent |
| `/make-slides` | Run the Presentation Agent |
| `/write-paper` | Run the Journal Article Agent |
| `/status` | Show pipeline progress and agent scores |
| `/review` | Review outputs from any completed agent |

---

## Session Memory

### MEMORY.md (Cross-Session)
Accumulates patterns, corrections, and preferences:
- `[LEARN:stata]` — Stata-specific patterns
- `[LEARN:data]` — Data quirks and variable notes
- `[LEARN:method]` — Methodological decisions
- `[LEARN:style]` — Writing and presentation preferences

### Session Logs (Per-Session)
Saved to `quality_reports/session_logs/YYYY-MM-DD_description.md`:
- What was accomplished
- Key decisions and rationale
- Open questions for next session

---

## Getting Started

Paste this prompt to begin:

> I am starting a new applied economics research project.
> Here is my research proposal: [PASTE 300-500 WORD PROPOSAL]
> Read CLAUDE.md and help me set up the project. Start with `/new-project`.
