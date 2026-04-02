# Reference: Journal Styles

## AER (American Economic Review) — Default

```latex
\documentclass[12pt]{article}
\usepackage[margin=1in]{geometry}
\usepackage{setspace}\doublespacing
\bibliographystyle{aer}
```
- Double-spaced, 12pt, 1-inch margins
- Abstract ≤ 150 words
- JEL codes required
- Tables/figures at end of document
- Notes below tables with significance stars
- Author footnote for acknowledgments

## JEEM (Journal of Environmental Economics and Management)

```latex
\documentclass[12pt]{article}
\usepackage[margin=1in]{geometry}
\usepackage{setspace}\doublespacing
\bibliographystyle{elsarticle-harv}
```
- Elsevier journal — follows their submission guidelines
- Structured abstract (≤ 100 words)
- JEL codes + Keywords required
- Highlights (3-5 bullet points) sometimes required
- Numbered sections

## JHR (Journal of Human Resources)

```latex
\documentclass[12pt]{article}
\usepackage[margin=1in]{geometry}
\usepackage{setspace}\doublespacing
\bibliographystyle{aer}
```
- Similar to AER style
- Emphasis on identification and policy relevance
- Strong preference for clear writing
- Data availability statement required

## Common Elements Across All Journals

### Table Format
```latex
\begin{table}[htbp]
\centering
\caption{Title of Table}
\label{tab:tablename}
\begin{tabular}{lcccc}
\toprule
 & (1) & (2) & (3) & (4) \\
 & Outcome 1 & Outcome 1 & Outcome 2 & Outcome 2 \\
\midrule
Treatment & 0.045*** & 0.038** & 0.072*** & 0.065*** \\
 & (0.012) & (0.015) & (0.018) & (0.020) \\
\midrule
Controls & No & Yes & No & Yes \\
Unit FE & Yes & Yes & Yes & Yes \\
Year FE & Yes & Yes & Yes & Yes \\
Observations & 50,000 & 48,500 & 50,000 & 48,500 \\
R-squared & 0.45 & 0.52 & 0.38 & 0.44 \\
Mean Dep. Var & 0.320 & 0.320 & 0.150 & 0.150 \\
\bottomrule
\end{tabular}
\begin{tablenotes}
\small
\item \textit{Notes}: Standard errors clustered at the county level in parentheses.
*** p<0.01, ** p<0.05, * p<0.10.
\end{tablenotes}
\end{table}
```

### Figure Format
```latex
\begin{figure}[htbp]
\centering
\includegraphics[width=\textwidth]{Figures/event_study.pdf}
\caption{Event Study: Effect of Treatment on Outcome}
\label{fig:event_study}
\begin{figurenotes}
\small
\item \textit{Notes}: Figure plots coefficient estimates from equation (1).
The dashed vertical line indicates the treatment year.
95\% confidence intervals shown. Standard errors clustered at the county level.
\end{figurenotes}
\end{figure}
```
