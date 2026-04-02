# Claude-ECON_RA

**An AI-powered applied economics research pipeline for Claude Code.**

Six specialized agents. One research proposal in, full project out.

---

## What This Is

An open-source [Claude Code](https://docs.anthropic.com/en/docs/claude-code) workflow that turns your terminal into a full-service applied economics research assistant — from literature review to journal submission.

**Inspired by:**
- [Hugo Sant'Anna's Clo-Author](https://hsantanna.org/clo-author/) — multi-agent research architecture
- [Pedro Sant'Anna's claude-code-my-workflow](https://github.com/pedrohcgs/claude-code-my-workflow) — academic Claude Code template

**Tailored for:** Applied microeconomists using Stata, LaTeX, and causal inference methods.

---

## Quick Start

```bash
# 1. Clone this repo
git clone https://github.com/Ghosh-Anupam/Claude-ECON_RA.git
cd Claude-ECON_RA

# 2. Start Claude Code
claude
```

Then type:

> I am starting a new applied economics research project.
> Read CLAUDE.md and help me set up the project.
> Here is my research proposal:
>
> [PASTE YOUR 300-500 WORD PROPOSAL]

---

## The Six Agents

| # | Agent | What It Does | Key Output |
|---|-------|-------------|------------|
| 1 | **Lit Survey** | Two-stage Google Scholar search (X+Y+Z joint, then X+Z relaxed) with gap analysis | PDF with literature table, ID strategy comparison |
| 2 | **Identification** | Interactive causal inference advisor — brainstorm, refine, and stress-test your research design | Strategy memo with estimating equation, assumptions, threats |
| 3 | **Data Cleaning** | Sequential download, clean, merge of data sources (one at a time) | Unified `.dta` files + `.do` scripts per source |
| 4 | **Data Analysis** | Full empirical analysis with replication package | Tables, figures, event plots, robustness checks |
| 5 | **Presentation** | Beamer LaTeX slide deck using custom `style.sty` | Seminar/job market/conference presentation |
| 6 | **Journal Article** | Complete manuscript using custom `Class.cls` | Publication-ready LaTeX article |

### How They Work

Each agent can be run **independently** or as part of the **full pipeline**.

**Full pipeline** (sequential):
```
Agents run 1 → 2 → 3 → 4 → 5 → 6
```

**Independent** (any order, any time after project setup):
```
Run the Lit Survey Agent          ← runs anytime, no dependencies
Run the Identification Agent      ← runs anytime (reads lit survey if available)
Run the Data Cleaning Agent       ← runs anytime, no dependencies
Run the Data Analysis Agent       ← needs data in Data/cleaned/
Run the Presentation Agent        ← uses whatever Tables/Figures exist
Run the Journal Article Agent     ← uses whatever outputs exist
```

Each agent checks what inputs are available and works with what exists. If something is missing, it tells you what's needed and asks how to proceed — it never refuses to run or silently triggers another agent.

---

## Lit Survey: Two-Stage Search Protocol

The Lit Survey Agent uses a structured keyword approach built around three components:

- **Y** = Outcome variable (e.g., "Migration Rate")
- **X** = Treatment / shock (e.g., "Natural Disasters")
- **Z** = Unit of analysis (e.g., "US County level")

**Stage 1 (Strict):** Searches `"Y" "Impact of X" "Z"` jointly — finds papers studying the same treatment, outcome, and unit. Fewer results, but most directly relevant.

**Stage 2 (Relaxed):** Searches `"Impact of X" "Z"` only — finds all papers studying the treatment at the same unit level, regardless of outcome. Captures the broader literature.

Both stages include synonym expansion, targeted journal searches (AER, NBER, SSRN), and citation chaining.

---

## Identification Agent: Interactive Causal Inference Advisor

Unlike other agents, the Identification Agent operates as a **chatbot**. It:

1. Asks about your ideal experiment and source of variation
2. Maps your design to a strategy (DiD, IV, RDD, synthetic control, etc.)
3. Explains **why** the strategy works in plain English before any equations
4. Shows **how** to implement it in Stata step by step
5. Stress-tests your design against threats a referee would raise
6. Compares your approach to what the literature survey found
7. Saves a strategy memo when you're satisfied

Reference textbooks (place PDFs in `templates/textbooks/`):
- *Mostly Harmless Econometrics* — Angrist & Pischke (2008)
- *Causal Inference: The Mixtape* — Cunningham (2021)
- *Design of Observational Studies* — Rosenbaum (2010)
- *Causal Inference for Statistics, Social, and Biomedical Sciences* — Imbens & Rubin (2015)

---

## Project Structure

```
Claude-ECON_RA/
├── CLAUDE.md              # Project configuration (the brain)
├── MEMORY.md              # Cross-session learning
├── .claude/
│   ├── agents/            # 6 agent definitions
│   ├── skills/            # 6 slash commands
│   ├── rules/             # 5 always-on rules
│   └── references/        # On-demand reference docs
├── Paper/                 # Journal article (Class.cls)
│   └── 1-Sections/        # Modular .tex sections
├── Presentation/          # Beamer slides (style.sty)
│   └── 2-Presentation/    # Modular slide files
├── Data/                  # Raw + cleaned datasets
├── Scripts/               # All .do files
├── Tables/                # Regression output
├── Figures/               # Plots and graphs
├── LitSurvey/             # Literature review PDF
├── quality_reports/       # Plans, session logs, strategy memos
└── templates/             # LaTeX templates + textbooks
    ├── style.sty           # Custom Beamer style
    ├── Class.cls           # Custom article class
    └── textbooks/          # Reference PDFs (local only, not uploaded)
```

---

## Key Design Principles

### Interactive by Design
Every agent asks questions before doing work. You never get a 50-page output that misses the point.

### Plain English First
The Identification Agent explains causal inference concepts in plain English before showing equations or code.

### Sequential Data Processing
Data sources are cleaned one at a time. You approve each one before moving to the next.

### Stata-First (Flexible)
Default output is `.do` files, but R and Python are supported when specified.

### Custom LaTeX Integration
Uses your own `style.sty` (Beamer) and `Class.cls` (article) with modular `\input{}` structure.

### Quality Gates
Scoring thresholds (80/90/95) prevent low-quality outputs from advancing through the pipeline.

### Reproducibility Built In
Every analysis produces a self-contained replication package that runs from raw data to final outputs.

---

## Prerequisites

| Tool | Required For | Install |
|------|-------------|---------|
| [Claude Code](https://docs.anthropic.com/en/docs/claude-code) | Everything | `npm install -g @anthropic-ai/claude-code` |
| Stata | Analysis & data cleaning | [stata.com](https://www.stata.com/) |
| TeX Live / MiKTeX | LaTeX compilation | [tug.org/texlive](https://tug.org/texlive/) |

Optional: R (with `fixest`, `modelsummary`), Python (with `pandas`, `statsmodels`)

---

## Daily Workflow

```bash
# Start of day
cd "path/to/your/Claude-Econ RA"
claude

# Inside Claude Code
Run the Lit Survey Agent on: [your topic]
Run the Identification Agent
Run the Data Cleaning Agent
# ... etc.

# End of day (after exiting Claude Code with Ctrl+C)
git add .
git commit -m "End of day: [what you accomplished]"
git push
```

---

## License

MIT License. Fork it, customize it, make it yours.

---

## Acknowledgments

This project is inspired by and builds upon:
- [The Clo-Author](https://github.com/hugosantanna/clo-author) by Hugo Sant'Anna
- [claude-code-my-workflow](https://github.com/pedrohcgs/claude-code-my-workflow) by Pedro Sant'Anna

The multi-agent architecture, quality gates, and plan-first workflow patterns originate from those projects.
