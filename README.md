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

Use the repository's requirements.txt, SQL scripts, notebooks, and app/ entry point; exact commands depend on the checked-in implementation.

## 📊 Results and Insights

### Saved notebook model comparison

| Metric | Logistic Regression | Random Forest | XGBoost |
|---|---:|---:|---:|
| Accuracy | 0.738 | 0.704 | 0.731 |
| Precision | 0.783 | 0.716 | 0.777 |
| Recall | 0.793 | 0.856 | 0.786 |
| F1-score | 0.788 | 0.780 | 0.782 |
| ROC-AUC | 0.827 | 0.810 | 0.821 |

The saved notebook selects **Logistic Regression** by F1-score. Its recorded confusion matrix is `[[252, 135], [127, 486]]` on 1,000 test examples. ROC-AUC is approximately **0.827**; a 0.6 threshold produced a saved F1-score of **0.757**.

The EDA notebook records average carrier reliability of **0.7544** and **285 critical shipments** under the project's rule.

These are saved notebook outputs, not freshly rerun results. Validate split strategy, class balance, target construction, and whether each feature would be available at prediction time before presenting the metrics as final. Higher recall may be useful when missed disruptions are costly, while false alarms also have operational costs.

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

- Metrics are recorded notebook outputs and have not been independently re-executed in this review.
- Confirm label balance, split methodology, and feature availability at prediction time.
- Dataset provenance and redistribution license need documentation.
- Risk predictions are not guarantees of disruption or prevention.

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
