# Rule: Stata Conventions

## Always Active — Applies to All `.do` Files

### File Header (Required)
Every `.do` file MUST begin with:
```stata
/* ============================================================ */
/* Project: [PROJECT NAME]                                       */
/* Script:  [SCRIPT PURPOSE]                                     */
/* Input:   [INPUT FILE(S)]                                      */
/* Output:  [OUTPUT FILE(S)]                                     */
/* Author:  ERA [Agent Name]                                     */
/* Date:    [YYYY-MM-DD]                                         */
/* ============================================================ */
```

### Initialization Block (Required)
```stata
clear all
set more off
set maxvar 10000
cap log close
log using "[script_name].log", replace
```

### Path Management
NEVER hardcode paths. Always use globals:
```stata
global root "/path/to/project"
global data "$root/Data"
global raw "$data/raw"
global clean "$data/cleaned"
global scripts "$root/Scripts"
global tables "$root/Tables"
global figures "$root/Figures"
```

### Variable Management
- ALWAYS label variables after creation: `label variable [var] "[description]"`
- Use value labels for categorical variables
- ALWAYS `compress` before saving
- ALWAYS `describe` after major operations

### Output Standards
- Tables: use `esttab` with `booktabs` option
- Figures: save both `.png` (width 2400) and `.pdf`
- Always `graph export`, never rely on graph window
- Include observation counts, R-squared, and dep var mean in all tables

### Code Style
- Use `///` for line continuation in long commands
- Indent consistently (1 tab = 4 spaces)
- Section headers: `/* === SECTION NAME === */`
- Comment non-obvious operations
- Use `local` for within-script variables, `global` for cross-script paths only

### Error Handling
- Use `cap` (capture) only when you expect and handle the error
- Use `assert` for data integrity checks: `assert !missing(fips)`
- Use `isid` to verify unique identification
- Check `_merge` after every merge and handle appropriately

### End of File
```stata
log close
exit
```
