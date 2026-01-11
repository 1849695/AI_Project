# Autonomous Space Rover Planning (PDDL)

This repository contains a PDDL model of a **Space Rover Exploration** planning problem and three instances with increasing complexity.  
The PDDL problems are intended to be executed using the **PDDL Editor / planning.domains** interface.

## Repository structure

- `report/`
  - `report.pdf` (final report)
  - `report.tex` (LaTeX source, optional)
- `pddl/`
  - `rover-domain.pddl`
  - `rover-istance1.pddl`
  - `rover-istance2.pddl`
  - `rover-istance3.pddl`
- `results/` (optional but recommended)
  - saved plans / outputs from the runs (e.g., `BFWS_LAMA_1.txt`, `BFWS_LAMA_2.txt`, `LAMA_3.txt`, `BFWS_3.txt`)


## PDDL domain overview

The domain models:
- rover navigation on a graph of locations (`connected`)
- energy management (discrete energy levels)
- recharging in sunny locations (`sunny`)
- sample collection (`sample-at`, `has-sample`)
- obstacle handling (`obstacle`, destroy action)

## How to run (planning.domains / PDDL Editor)

1. Open the PDDL Editor / planning.domains solver page.
2. Upload (or paste) the files:
   - Domain: `pddl/rover-domain.pddl`
   - Problem: choose one of:
     - `pddl/rover-istance1.pddl`
     - `pddl/rover-istance2.pddl`
     - `pddl/rover-istance3.pddl`
3. Select a planner:
   - **LAMA**
   - **BFWS--FF (Parser Version)**
4. Run the planner.
5. Save:
   - the returned plan (sequence of actions)
   - any available statistics shown by the interface (if provided)

Repeat for each instance and (optionally) for both planners to reproduce the comparisons discussed in the report.

## Expected results (from our runs)

From the saved plans in `results/`:

- **Instance 1**: plan length = 5 actions  
- **Instance 2**: plan length = 13 actions  
- **Instance 3**:
  - LAMA: plan length = 29 actions
  - BFWS--FF: plan length = 28 actions

The plans include navigation (`move`), energy management (`recharge`), obstacle removal (`destroy-obstacle`), and sample collection (`collect-sample`).

## Notes on reproducibility

- If your output differs slightly (especially on Instance 3), it may be due to different tie-breaking choices inside the planner.
- If the platform provides additional metrics (runtime, expanded states, etc.), you can record them and include them in the report tables.


## Authors

- Giovanni Recchi
