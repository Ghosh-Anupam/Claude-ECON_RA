# Econ Research Assistant (ERA)

**An AI-powered applied economics research pipeline for Claude Code.**

Five specialized agents. One research proposal in, full project out.

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
git clone https://github.com/YOUR_USERNAME/econ-research-assistant.git
cd econ-research-assistant

# 2. Start Claude Code
claude
```

Then paste:

> I am starting a new applied economics research project.
> Read CLAUDE.md and help me set up the project.
> Here is my research proposal:
>
> [PASTE YOUR 300-500 WORD PROPOSAL]

---

## The Five Agents

| # | Agent | What It Does | Key Output |
|---|-------|-------------|------------|
| 1 | **Lit Survey** | Comprehensive literature review with gap analysis | PDF with literature table, ID strategy comparison |
| 2 | **Data Cleaning** | Sequential download, clean, merge of data sources | Unified `.dta` files + `.do` scripts per source |
| 3 | **Data Analysis** | Full empirical analysis with replication package | Tables, figures, event plots, robustness checks |
| 4 | **Presentation** | Beamer LaTeX slide deck | Seminar/job market/conference presentation |
| 5 | **Journal Article** | Complete manuscript in AER/JEEM style | Publication-ready LaTeX article |

### How They Work

Each agent can be run **independently** or as part of the **full pipeline**.

**Full pipeline** (sequential):
```
/new-project → agents run 1 → 2 → 3 → 4 → 5
```

**Independent** (any order, any time after project setup):
```
/lit-survey          ← runs anytime, no dependencies
/clean-data          ← runs anytime, no dependencies
/analyze             ← needs data in Data/cleaned/
/make-slides         ← uses whatever tables/figures exist
/write-paper         ← uses whatever outputs exist
```

Each agent checks what inputs are available and works with what exists. If something is missing, it tells you what's needed and asks how to proceed — it never refuses to run or silently triggers another agent.

---

## Project Structure

```
econ-research-assistant/
├── CLAUDE.md              # Project configuration (the brain)
├── MEMORY.md              # Cross-session learning
├── .claude/
│   ├── agents/            # 5 agent definitions
│   ├── skills/            # 6 slash commands
│   ├── rules/             # 5 always-on rules
│   └── references/        # On-demand reference docs
├── Paper/                 # Journal article LaTeX
├── Presentation/          # Beamer slides
├── Data/                  # Raw + cleaned datasets
├── Scripts/               # All .do files
├── Tables/                # Regression output
├── Figures/               # Plots and graphs
├── LitSurvey/             # Literature review PDF
└── quality_reports/       # Plans and session logs
```

---

## Slash Commands

| Command | Description |
|---------|------------|
| `/new-project` | Initialize from research proposal |
| `/lit-survey [topic]` | Run literature survey |
| `/clean-data` | Process data sources (sequential) |
| `/analyze` | Run empirical analysis |
| `/make-slides` | Create Beamer presentation |
| `/write-paper` | Write journal article |

---

## Key Design Principles

### Interactive by Design
Every agent asks questions before doing work. You never get a 50-page output that misses the point.

### Sequential Data Processing
Data sources are cleaned one at a time. You approve each one before moving to the next.

### Stata-First (Flexible)
Default output is `.do` files, but R and Python are supported when specified.

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

## Customizing for Your Research

1. **Fill in `CLAUDE.md`** — Replace placeholders with your project details
2. **Edit the domain profile** (`.claude/references/domain-profile.md`) — Your field's journals, data sources, and methods
3. **Run `/new-project`** — The interactive setup walks you through everything

---

## License

MIT License. Fork it, customize it, make it yours.

---

## Acknowledgments

This project is inspired by and builds upon:
- [The Clo-Author](https://github.com/hugosantanna/clo-author) by Hugo Sant'Anna
- [claude-code-my-workflow](https://github.com/pedrohcgs/claude-code-my-workflow) by Pedro Sant'Anna

The multi-agent architecture, quality gates, and plan-first workflow patterns originate from those projects.
