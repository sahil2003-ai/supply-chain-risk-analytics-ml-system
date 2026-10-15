# Supply Chain Risk Analytics and Disruption Prediction

> End-to-end portfolio project combining shipment analytics, SQL data modelling, machine learning, Power BI, and Streamlit.

![Status](https://img.shields.io/badge/Status-Portfolio--Project-blue)

## 📌 Table of Contents

- [Overview](#overview)
- [Problem Statement](#problem-statement)
- [Objectives](#objectives)
- [Features](#features)
- [Dataset](#dataset)
- [Tech Stack](#tech-stack)
- [Project Workflow](#project-workflow)
- [Repository Structure](#repository-structure)
- [Installation](#installation)
- [Usage](#usage)
- [Results and Insights](#results-and-insights)
- [Screenshots](#screenshots)
- [Challenges and Solutions](#challenges-and-solutions)
- [Limitations](#limitations)
- [Future Improvements](#future-improvements)
- [What I Learned](#what-i-learned)
- [Author](#author)
- [License](#license)

## 📖 Overview

End-to-end portfolio project combining shipment analytics, SQL data modelling, machine learning, Power BI, and Streamlit. This README documents the intended workflow and the files available in the repository. Verify all outputs against the current code and data before using them as evidence.

## 🎯 Problem Statement

Supply-chain teams need to summarize shipment patterns and evaluate whether available attributes can help identify disruption risk.

## 🎯 Objectives

- Explore shipment patterns and risk indicators.
- Evaluate implemented classification models with leakage controls.
- Communicate insights through a dashboard and application.

## ✨ Features

- SQL/schema and data folders.
- Notebook and model artifacts folders.
- Power BI assets and Streamlit app assets.
- Existing screenshots in images/.

## 📂 Dataset

The saved cleaning notebook reports **5,000 shipments × 14 raw columns** and **5,000 rows × 19 columns** after adding engineered fields. It reports zero missing values in the raw 14 columns.

- **Raw file:** `data/raw/global_supply_chain_risk_dataset.csv`
- **Processed file:** `data/processed/cleaned_supply_chain.csv`
- **Target:** `disruption_occurred`
- **Raw fields:** shipment ID, date, origin/destination ports, transport mode, product category, distance, weight, fuel-price index, geopolitical risk score, weather, carrier reliability, lead time, and disruption label.
- **Provenance/license:** Document the original data publisher and redistribution terms; repository presence alone does not establish these.

## 🛠️ Tech Stack

| Technology | Purpose |
|---|---|
| SQL/PostgreSQL | Data model and querying |
| Python/pandas | Preparation and analysis |
| scikit-learn/XGBoost | Models where implemented |
| Power BI | Dashboard |
| Streamlit/Plotly | Interactive app |

## 🔄 Project Workflow

1. Inspect data/, sql/, notebooks/, models/, outputs/, reports/, app/, and requirements.txt.
2. Review the schema and confirm fact/dimension relationships.
3. Validate missing values, duplicates, date coverage, class balance, and disruption definition.
4. Follow the actual SQL scripts to prepare tables and load data.
5. Run notebooks to explore delays and available operational factors.
6. Train only the models implemented in the repository and record their configuration.
7. Evaluate against a baseline on held-out data; inspect target leakage and prediction-time availability.
8. Open Power BI assets and validate KPI measures.
9. Inspect the app entry point and follow the actual setup instructions.
10. Publish only reproducible results and describe limitations.

## 🗂️ Repository Structure

```text
supply-chain-risk-analytics-ml-system/
├── app/
├── data/
├── images/
├── models/
├── notebooks/
├── outputs/
├── powerbi/
├── reports/
├── sql/
└── requirements.txt
└── README.md
```

The list above highlights known project files and folders; inspect the repository for the complete current structure.

## ⚙️ Installation

### Prerequisites

- Install the tools listed in the Tech Stack that apply to this project.
- For Python projects, use a Python version compatible with the dependencies actually imported by the code.
- For Power BI projects, use Power BI Desktop.

### Setup

Create a Python environment and install requirements.txt. Review SQL scripts and app/ to confirm any database setup and actual application entry point before running commands.

Do not run generic commands that do not match the files in this repository. Confirm the data paths, database dialect, and package versions before execution.

## ▶️ Usage

For PostgreSQL, run `sql/Schema.sql` first, then run `sql/load_data.sql` from the repository root with `psql -d YOUR_DATABASE -f sql/load_data.sql`. The loader uses a text staging column for the source date and parses it with `TO_DATE(date_text, 'DD-MM-YYYY')`. Then run the analytical queries in `sql/queries.sql`. The CSV-derived KPI values in this README provide the expected cross-checks.

## 📊 Results and Insights

### Independently recalculated dataset KPIs

I recalculated these metrics from the current raw CSV (`data/raw/global_supply_chain_risk_dataset.csv`), not just the saved notebook output.

| KPI | Result |
|---|---:|
| Shipments | 5,000 |
| Raw columns | 14 |
| Missing values in raw columns | 0 |
| Disruption rate | 61.26% |
| Average lead time | 19.36 days |
| Average carrier reliability | 0.754 |

### Segment findings

| Group | Shipments | Disruption rate |
|---|---:|---:|
| Hurricane | 990 | 100.00% |
| Storm | 1,002 | 79.54% |
| Clear weather | 995 | 36.98% |
| Textiles | 1,010 | 64.85% |
| Electronics | 1,016 | 59.55% |

By origin port, Hamburg has a 62.48% disruption rate (597 shipments), while Singapore has 62.27% (599 shipments). Across transport modes, disruption rates are close together: Air 61.74%, Rail 61.18%, Road 61.04%, and Sea 61.05%. Air has the shortest average lead time (1.64 days) and Sea the longest (39.80 days).

The 100% hurricane disruption rate is a strong signal to inspect how the data/labels were generated and whether weather is effectively encoding the target. These are associations in this dataset, not proof that weather alone causes a disruption.

### Saved model evaluation (not independently rerun)

| Metric | Logistic Regression | Random Forest | XGBoost |
|---|---:|---:|---:|
| Accuracy | 0.738 | 0.704 | 0.731 |
| Precision | 0.783 | 0.716 | 0.777 |
| Recall | 0.793 | 0.856 | 0.786 |
| F1-score | 0.788 | 0.780 | 0.782 |
| ROC-AUC | 0.827 | 0.810 | 0.821 |

The saved notebook selects Logistic Regression by F1-score. Its recorded confusion matrix is `[[252, 135], [127, 486]]` on 1,000 test examples. These model metrics remain saved notebook results; they have not been independently reproduced in a clean runtime.

### SQL status

The fact-table schema was updated to include `weather_condition`, which is queried in `sql/queries.sql`. **The SQL workflow has not been executed against a live PostgreSQL instance here.** The raw CSV uses dates in `DD-MM-YYYY` format, so the load process must explicitly parse dates (for example, through a text staging table and `TO_DATE(date_text, 'DD-MM-YYYY')`) rather than relying on the database's default date style.

## 🖼️ Screenshots

![Supply chain application overview](images/app.png)

![Supply chain application details](images/app2.png)

| Dashboard page 1 | Dashboard page 2 |
|---|---|
| ![Page 1](images/page1.png) | ![Page 2](images/page2.png) |
| ![Page 3](images/page3.png) | ![Page 4](images/page4.png) |

## 🧩 Challenges and Solutions

| Challenge | Solution / validation approach |
|---|---|
| Risk labels can be imbalanced or derived from input fields | Inspect target construction, leakage, class balance, and prediction-time availability. |

## ⚠️ Limitations

- Raw-data KPIs and group rates above were independently recalculated from the repository CSV; the SQL scripts and saved model metrics were not executed/reproduced in PostgreSQL or a clean Python environment.
- Hurricane has a 100% observed disruption rate in this dataset; investigate possible synthetic label construction or target leakage before treating the pattern as operational evidence.
- The CSV date format requires explicit parsing during SQL import.
- Document the original data source and redistribution license.
- Descriptive group differences do not prove causality.

## 🚀 Future Improvements

- [ ] Add exact setup commands and data dictionary.
- [ ] Publish verified evaluation results and a model card.
- [ ] Document data provenance and dashboard KPI definitions.

## 📚 What I Learned

- End-to-end analytical workflow.
- Model evaluation and dashboard communication.

## 👤 Author

**Sahil Gaikwad**

- GitHub: [sahil2003-ai](https://github.com/sahil2003-ai)
- LinkedIn: [Sahil Gaikwad](https://www.linkedin.com/in/sahil-gaikwad-a76b7224a/)

## 📄 License

Check dataset, model, and repository licensing before reuse.
