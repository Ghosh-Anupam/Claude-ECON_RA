# Reference: Identification Strategies

## Quick Decision Tree

```
Is treatment randomly assigned?
├── YES → Experimental Design (RCT)
└── NO → Quasi-Experimental
         ├── Is there a sharp cutoff? → RDD
         ├── Is there a plausible instrument? → IV
         ├── Is there a before/after + treated/control? → DiD
         │    ├── Treatment at one time? → Standard DiD
         │    └── Treatment staggered? → Modern DiD Estimators
         ├── Few treated units? → Synthetic Control
         └── Continuous treatment? → Dose-response / Shift-share
```

## Difference-in-Differences (DiD)

### Standard (2×2)
- **Equation**: Y_it = α + β·(Treated_i × Post_t) + μ_i + λ_t + ε_it
- **Key assumption**: Parallel trends in the absence of treatment
- **Test**: Pre-treatment event study should show null effects
- **Stata**: `reghdfe Y treat_post, absorb(unit_id year) vce(cluster unit_id)`

### Staggered DiD
When treatment rolls out at different times, TWFE can be biased.

| Estimator | Stata Command | When to Use |
|-----------|--------------|-------------|
| Callaway & Sant'Anna (2021) | `csdid Y, ivar(id) time(year) gvar(first_treat)` | Binary treatment, staggered timing |
| Sun & Abraham (2021) | `eventstudyinteract Y lead* lag*, cohort(first_treat) control_cohort(never_treated) absorb(id year) vce(cluster state)` | Event study with heterogeneous effects |
| Borusyak et al. (2024) | `did_imputation Y id year first_treat` | Imputation-based, clean event studies |
| de Chaisemartin & D'Haultfoeuille (2020) | `did_multiplegt Y id year treatment` | When treatment can turn on/off |
| Goodman-Bacon (2021) | `bacondecomp Y treatment, ddetail` | Diagnostic: decompose TWFE into 2×2 comparisons |

### Event Study
- Plot coefficients from event-time dummies
- Reference period: t = -1 (last pre-treatment period)
- Look for: flat pre-trends, treatment effect dynamics
- Stata: `eventdd Y controls, timevar(event_time) ci(rcap) method(hdfe, absorb(id year) cluster(state))`

## Instrumental Variables (IV)

- **Equation**: First stage: X_i = π·Z_i + controls + ε. Second stage: Y_i = β·X̂_i + controls + u.
- **Key assumptions**: Relevance (Z predicts X), Exclusion (Z only affects Y through X)
- **Tests**: First-stage F-statistic > 10 (rule of thumb), weak instrument tests
- **Stata**: `ivreghdfe Y (X = Z) controls, absorb(fe_vars) cluster(cluster_var) first`

## Regression Discontinuity (RD)

- **Equation**: Y_i = α + β·D_i + f(X_i) + ε_i (where D = 1 if X ≥ cutoff)
- **Key assumption**: Units cannot precisely manipulate the running variable
- **Tests**: McCrary density test, covariate balance at cutoff
- **Stata**: `rdrobust Y X, c(cutoff) covs(controls)`

## Synthetic Control

- **Use case**: Few treated units, many potential controls
- **Key assumption**: Convex combination of controls can replicate pre-treatment outcome path
- **Stata**: `synth Y Y(pre_years) covariates, trunit(treated_id) trperiod(treat_year)`

## Inference Notes
- Cluster at the treatment assignment level
- If <50 clusters: wild cluster bootstrap (`boottest`)
- Two-way clustering when appropriate: `vce(cluster var1 var2)`
- Randomization inference for small samples: `ritest`
