# Rule: LaTeX Conventions

## Custom Style Files
This project uses two custom LaTeX files in `templates/`:
- **`style.sty`** — Beamer style (CambridgeUS theme, custom colors, biblatex authoryear, gray citations)
- **`Class.cls`** — Article class (Times font, 10pt, A4, custom environments, natbib)

Before compiling, copy them into the working directory:
```bash
cp templates/style.sty Presentation/
cp templates/Class.cls Paper/
```

## Beamer Presentations (uses style.sty)

### Document Setup
```latex
\documentclass[aspectratio=169]{beamer}
\usepackage{style}
```
- Theme: CambridgeUS with custom colors
  - Logo1 (dark red): primary palette, structure color
  - Logo3 (dark olive): items, TOC, captions
  - Logo3B (light taupe): shaded TOC sections
- Footline: 3-panel (author | title | date + frame N/total)
- Headline: minimal thin bar
- Itemize: ball items (level 1), blacktriangleright (level 2), circle (level 3)
- Captions: numbered, scriptsize, Logo3 colored labels
- Footnotes: tiny, raggedright

### Citations (biblatex)
- Use `\textcite{}` for in-text, `\parencite{}` for parenthetical
- Both render in **gray** automatically (per style.sty)
- Bibliography: `\printbibliography[heading=none]`
- Bib file: loaded via `\addbibresource{references.bib}` in the .sty
- To add a second bib: `\addbibresource{reff.bib}` in preamble

### Modular Structure
Presentation uses `\input{2-Presentation/...}` for each slide group:
```
Presentation/
├── main.tex
├── style.sty                          (copied from templates/)
└── 2-Presentation/
    ├── 1-Motivation.tex
    ├── 2-This Paper.tex
    ├── 3-Preview.tex
    ├── 4-Contribution & Past Lit.tex
    ├── 5-Data & Sample.tex
    ├── 6A-Descriptive.tex
    ├── 6B-Design.tex
    ├── 7A-Core Results.tex
    ├── 7B-Mechanism.tex
    ├── 8-Robustness.tex
    ├── 9-Heterogeneity.tex
    ├── 10-Conclusion.tex
    └── 11-Appendix.tex
```

### Compile
```bash
cd Presentation/
pdflatex main.tex
bibtex main
pdflatex main.tex
pdflatex main.tex
```

## Journal Articles (uses Class.cls)

### Document Setup
```latex
\documentclass{Class}
\begin{document}
\raggedbottom
```
- Font: Times New Roman (10pt)
- Paper: A4, 9in × 6in text area, 1in margins
- Title: 22pt centered, author in small caps with alphabetic footnotes
- Abstract: italic, indented 0.2in both sides
- Sections: \Large\bfseries, subsections: \large\bfseries
- Hyperlinks: URLBlue color
- Widow/orphan penalty: 10000 (strict)
- Aggressive float placement enabled

### Custom Environments (from Class.cls)
```latex
\begin{abstract} ... \end{abstract}    % Italic, indented
\begin{jelcodes} ... \end{jelcodes}    % Auto-prefixed "JEL codes:"
\begin{keywords} ... \end{keywords}    % Auto-prefixed "Keywords:"
```

### Custom Commands (from Class.cls)
```latex
\floatnote{text}     % "Notes:" in footnotesize below tables/figures
\floatsource{text}    % "Source:" in footnotesize below tables/figures
```

### Custom Column Types
```latex
L{width}  % Left-aligned fixed-width
C{width}  % Center-aligned fixed-width
R{width}  % Right-aligned fixed-width
d         % Decimal-aligned (dcolumn)
```

### Citations (natbib)
- Use `\citet{}` for in-text, `\citep{}` for parenthetical
- Bibliography style: `cje` (Canadian Journal of Economics)
- Bib file: `reff.bib`

### Table Format (REQUIRED PATTERN)
All tables in the article MUST follow this exact structure:
```latex
\begin{table}[H]
\normalsize
\centering
\caption{[Table Title]}\label{Table-[ID]}
\setlength{\tabcolsep}{2pt}
\begin{threeparttable}
\begin{tabular}{@{}lccc@{}}
\toprule
\midrule
         & [Col Header 1]   & [Col Header 2]    & [Col Header 3]    \\
         & (1)  &  (2) &  (3) \\
\midrule
\multicolumn{4}{l}{Panel A: [Panel Title]} \\
\midrule
[Variable name] \textit{([units])}   & [val] & [val] & [val] \\
[Variable name]                      & [val] & [val] & [val] \\
\midrule
\multicolumn{4}{l}{Panel B: [Panel Title]} \\
\midrule
[Variable name] \textit{([units])}   & [val] & [val] & [val] \\
\midrule
\bottomrule
\end{tabular}
\begin{tablenotes}[flushleft]
\item \footnotesize \textit{Note:} [Table notes here. Describe what each column
shows, clustering, significance stars, sample details.]
\end{tablenotes}
\end{threeparttable}
\end{table}
```

Key conventions:
- `[H]` float placement (forces "here")
- `\normalsize` before `\centering`
- Caption and `\label{}` ABOVE the table body
- `\setlength{\tabcolsep}{2pt}` for tight columns
- `@{}` at both ends of column spec to suppress outer padding
- Panels separated by `\multicolumn{N}{l}{Panel X: Title}` with `\midrule` above and below
- Variable units in `\textit{([unit])}` after the name
- `\toprule` then `\midrule` at top; `\midrule` then `\bottomrule` at bottom
- Notes in `\begin{tablenotes}[flushleft]` with `\footnotesize \textit{Note:}`

### Figure Format (REQUIRED PATTERN)
All figures in the article MUST follow this exact structure:

**Single figure:**
```latex
\begin{figure}[htbp]
\caption{[Figure Title]}\label{Fig:[ID]}
\centering
\includegraphics[width=\textwidth]{Figures/[filename].pdf}
    \begin{minipage}{0.98\textwidth}
    \footnotesize
    \raggedright
    \textit{Note:} [Figure notes here.]
    \end{minipage}
\end{figure}
```

**Side-by-side subfigures (preferred for event studies):**
```latex
\begin{figure}[htbp]
\caption{[Overall Figure Title]}\label{Fig:[ID]}
\centering
    \begin{subfigure}[b]{0.49\textwidth}
        \centering
        \caption{[Panel (a) Title] \textit{([units])}}\label{Fig:[ID]a}
        \includegraphics[width=\textwidth]{Figures/[filename_a].png}
    \end{subfigure}
    \hfill
    \begin{subfigure}[b]{0.49\textwidth}
        \centering
        \caption{[Panel (b) Title] \textit{([units])}}\label{Fig:[ID]b}
        \includegraphics[width=\textwidth]{Figures/[filename_b].png}
    \end{subfigure}
    \begin{minipage}{0.98\textwidth}
    \footnotesize
    \raggedright
    \textit{Note:} [Figure notes. Reference the equation, describe normalization,
    confidence intervals, clustering.]
    \end{minipage}
\end{figure}
```

Key conventions:
- `[htbp]` float placement for figures (not `[H]`)
- Caption and `\label{}` ABOVE the figure content (before `\centering` image)
- Subfigures at `0.49\textwidth` with `\hfill` between them
- Subfigure captions include units in `\textit{([units])}`
- Notes in `\begin{minipage}{0.98\textwidth}` (NOT `\floatnote{}`)
- Notes use `\footnotesize`, `\raggedright`, `\textit{Note:}` prefix
- Save figures as both `.png` and `.pdf`; use `.png` in subfigures, `.pdf` for full-width

### Modular Structure
Article uses `\input{1-Sections/...}` for each section:
```
Paper/
├── main.tex
├── Class.cls                          (copied from templates/)
├── reff.bib
└── 1-Sections/
    ├── 1-Abstract.tex
    ├── 2-Intro.tex
    ├── 3-Data.tex
    ├── 4-Model & Design.tex
    ├── 5-Results.tex
    ├── 6-Mechanism.tex
    ├── 7-Heterogeneity.tex
    ├── 8-Robustness.tex
    ├── 9-Conclusion.tex
    └── 10-Appendix.tex
```

### Appendices (Multiple)
The .cls provides automatic counter resets for multi-appendix documents:
```latex
\appendices
\section{Additional Results}    % → Appendix A
\section{Data Appendix}         % → Appendix B
```
Figures/tables/equations numbered A.1, B.1, etc. automatically.

### Compile
```bash
cd Paper/
pdflatex main.tex
bibtex main
pdflatex main.tex
pdflatex main.tex
```

## General Rules (Both)
- Use `booktabs` — NEVER use `\hline`. Use `\toprule`, `\midrule`, `\bottomrule`
- Rule widths: 0.5pt (set in Class.cls)
- All cross-references use `\label{}` and `\ref{}`
- Save figures as `.pdf` (vector) and `.png` (raster backup)
- `\adjustbox{max width=\textwidth}` for tables that may overflow in Beamer
