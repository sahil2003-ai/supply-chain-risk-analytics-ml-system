# SQL Supply Chain Analysis — Recalculated Findings

## Dataset and reproducibility

Metrics in this report were recalculated directly from `data/raw/global_supply_chain_risk_dataset.csv` (5,000 rows, 14 columns, zero blank cells in the raw fields). They are not a claim that the SQL script was executed in PostgreSQL. Run the SQL after loading the fact table to cross-check these values.

## Executive KPIs

| KPI | Recalculated value |
|---|---:|
| Total shipments | 5,000 |
| Disruption rate | 61.26% |
| Average lead time | 19.36 days |
| Average carrier reliability | 0.754 |

## Weather and disruption

| Weather | Shipments | Disruption rate |
|---|---:|---:|
| Hurricane | 990 | 100.00% |
| Storm | 1,002 | 79.54% |
| Fog | 1,036 | 48.07% |
| Rain | 977 | 41.97% |
| Clear | 995 | 36.98% |

The 100% hurricane disruption rate warrants a check of dataset generation and label construction. It may indicate a strong built-in relationship; it should not be presented as proof of causality.

## Transport modes

| Mode | Shipments | Avg. lead time | Disruption rate |
|---|---:|---:|---:|
| Air | 1,320 | 1.64 days | 61.74% |
| Rail | 1,185 | 19.95 days | 61.18% |
| Road | 1,214 | 16.45 days | 61.04% |
| Sea | 1,281 | 39.80 days | 61.05% |

The disruption rates are very similar across modes. It would be misleading to claim that sea has a materially lower disruption rate based on this table alone. Air has the shortest average lead time and sea the longest, as expected for this dataset.

## Product categories and origin ports

- Textiles: 64.85% disruption rate (1,010 shipments).
- Electronics: 59.55% disruption rate (1,016 shipments).
- Hamburg: 62.48% disruption rate (597 shipments).
- Singapore: 62.27% disruption rate (599 shipments).

## SQL/schema validation notes

- `weather_condition` is selected by the weather-impact query and is now included in `sql/Schema.sql`.
- The source CSV uses `DD-MM-YYYY` dates. Load into a text staging column and parse with `TO_DATE(date_text, 'DD-MM-YYYY')` rather than relying on the database's default date format.
- The model comparison in the notebook remains a saved output, not independently rerun in a clean Python environment.
- Document dataset provenance/license and verify that predictors are available at the time a disruption risk is predicted.
