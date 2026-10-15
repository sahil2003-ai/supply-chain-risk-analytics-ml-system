# Supply Chain Risk Analytics ML System

An end-to-end project combining Python, SQL, machine learning, Streamlit, and Power BI to analyze shipment disruption patterns and explore risk-classification workflows.

![Python](https://img.shields.io/badge/Python-Analytics-blue) ![SQL](https://img.shields.io/badge/SQL-Analytics-336791) ![Streamlit](https://img.shields.io/badge/App-Streamlit-FF4B4B) ![Power%20BI](https://img.shields.io/badge/BI-Power%20BI-F2C811)

## Contents
- [Overview](#overview)
- [Business Questions](#business-questions)
- [Dataset](#dataset)
- [Workflow and Architecture](#workflow-and-architecture)
- [Results and Metrics](#results-and-metrics)
- [Screenshots](#screenshots)
- [Technology Stack](#technology-stack)
- [Repository Structure](#repository-structure)
- [Run the Project](#run-the-project)
- [Limitations and Next Steps](#limitations-and-next-steps)

## Overview
This project brings together data cleaning, exploratory analysis, SQL, risk-classification experiments, a Streamlit prediction interface, and a Power BI report. It is designed to explore shipment disruption signals and support risk review.

## Business Questions
- How common are disruption labels in the available dataset?
- How do shipment and transport attributes vary across records?
- Which features are associated with the disruption label?
- Can a classification workflow provide a useful signal beyond a simple baseline?

## Dataset
Recalculated from `data/raw/global_supply_chain_risk_dataset.csv`:

| Metric | Result |
|---|---:|
| Rows | 5,000 |
| Columns | 14 |
| Missing cells | 0 |
| Disruption-labeled records | 3,063 |
| Overall disruption-label rate | 61.26% |
| Source date coverage | 2024–2025 |

Fields include date, origin/destination ports, transport mode, product category, distance, shipment weight, fuel-price index, geopolitical-risk score, weather, carrier reliability, lead time, and `Disruption_Occurred`.

## Workflow and Architecture
1. Profile source data and validate date formats, missing values, and label balance.
2. Clean and engineer features using the notebooks.
3. Load/query data using the SQL schema, load, and analysis scripts.
4. Explore the data and define the classification target.
5. Train and evaluate models against an appropriate baseline.
6. Export predictions and review the Streamlit app and Power BI report.

## Results and Metrics
The source dataset contains 5,000 rows, 14 columns, and no missing cells. There are 3,063 records labeled with a disruption, a label rate of **61.26%**.

This label rate describes the supplied dataset; it is not the accuracy of a model or a forecast of real-world disruption probability. Model results should be reported with the evaluation split, class-wise precision/recall/F1, confusion matrix, and baseline comparison from a fresh run.

## Screenshots
The repository includes app/report images:

| Screenshot | Preview |
|---|---|
| App | ![Streamlit app](images/app.png) |
| App detail | ![Streamlit app detail](images/app2.png) |
| Dashboard page 1 | ![Dashboard page 1](images/page1.png) |
| Dashboard page 2 | ![Dashboard page 2](images/page2.png) |
| Dashboard page 3 | ![Dashboard page 3](images/page3.png) |
| Dashboard page 4 | ![Dashboard page 4](images/page4.png) |

## Technology Stack
- Python, pandas, and ML libraries used by the notebooks
- SQL schema, data loading, and analytical queries
- Streamlit application
- Power BI report
- CSV data and exported predictions

## Repository Structure
```text
supply-chain-risk-analytics-ml-system/
├── app/app.py
├── data/raw/global_supply_chain_risk_dataset.csv
├── data/processed/cleaned_supply_chain.csv
├── images/
├── models/best_model.pkl
├── models/scaler.pkl
├── notebooks/
├── outputs/bulk_predictions.csv
├── powerbi/Supply_chain_risk.pbix
├── reports/
├── sql/
└── README.md
```

## Run the Project
1. Create a Python environment and install the repository's dependency file.
2. Follow the schema and data-loading scripts in `sql/`.
3. Run the notebooks in order: cleaning, EDA, then modeling.
4. Validate model performance on a held-out set and compare with a baseline.
5. Launch the Streamlit app from its `app/` directory after confirming model paths.
6. Open the Power BI report and reconcile its measures with verified outputs.

## Limitations and Next Steps
- Validate model metrics and avoid leakage from predictors unavailable at prediction time.
- Document source-data provenance and licensing.
- Confirm app preprocessing matches the model's training features.
- Reconcile SQL, notebook, Streamlit, and Power BI results.
- Record dependency versions and add repeatable setup instructions.

## Skills Demonstrated
Data cleaning, EDA, SQL analytics, classification workflow, model evaluation, Streamlit, Power BI, and results communication.

## Author
**Sahil Gaikwad** · [GitHub](https://github.com/sahil2003-ai) · [LinkedIn](https://www.linkedin.com/in/sahil-gaikwad-a76b7224a/)
