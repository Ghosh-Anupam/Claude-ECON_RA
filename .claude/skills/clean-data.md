# Skill: /clean-data

## Usage
```
/clean-data                    # Process all listed data sources sequentially
/clean-data --source [name]    # Process a single specific source
/clean-data --merge            # Run the merge step only (all sources already clean)
/clean-data --verify           # Re-run all cleaning scripts to verify reproducibility
```

## Description
Dispatch the Data Cleaning Agent. Processes data sources ONE AT A TIME with interactive questioning.

## Workflow
1. Read `.claude/agents/data-cleaning-agent.md`
2. Read `.claude/rules/sequential-data-protocol.md`
3. Present the list of data sources from the research proposal
4. For each source: question → download → explore → clean → approve → next
5. After all sources clean: present merge plan → execute merge → final dataset

## Quick Reference
- Input: Data source URLs, file paths, or connector references
- Output: `Data/cleaned/*.dta`, `Scripts/data-cleaning/*.do`, `Data/codebooks/*.md`
- Interactive: YES — asks detailed questions per source; never skips ahead
