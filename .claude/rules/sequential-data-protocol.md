# Rule: Sequential Data Processing Protocol

## Core Principle
The Data Cleaning Agent MUST process data sources ONE AT A TIME.

## Protocol
```
FOR EACH data source in user's list:
    1. STOP — Ask questions about THIS source
    2. WAIT — Get user answers
    3. WORK — Download, explore, clean
    4. PRESENT — Show summary stats and codebook
    5. CONFIRM — Get explicit user approval
    6. ONLY THEN — Move to the next source
```

## Why This Matters
- Each data source has unique quirks (missing codes, variable definitions, time formats)
- The user knows their data better than any AI — their input prevents errors
- Sequential processing creates auditable, debuggable pipelines
- If source 3 has an issue, sources 1 and 2 are already complete and saved

## Merge Protocol
- Merges happen ONLY after ALL individual sources are cleaned and approved
- Always present a merge plan before executing
- Report `_merge` diagnostics for every merge operation
- Never silently drop unmatched observations

## Numbering Convention
Scripts are numbered in processing order:
```
01_download_source1.do
02_clean_source1.do
03_download_source2.do
04_clean_source2.do
...
99_merge_all.do
```
