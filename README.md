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

Inspect data/ and sql/ for the source, schema, and whether data is synthetic or externally sourced. Row counts and source are not asserted here.

- **Privacy and licensing:** Check source terms and avoid publishing personal, sensitive, or restricted data.
- **Preprocessing:** Follow the actual SQL/notebook/report implementation; do not assume cleaning steps or row counts that have not been verified.

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

### Key Findings

Earlier README metrics require reproduction before use. Add a verified table with split strategy, baseline, precision, recall, F1, and relevant caveats.

### Evaluation

For analytics projects, reconcile key totals and document metric definitions. For ML projects, report the baseline, split strategy, relevant metrics, and held-out evaluation results. Do not include unverified scores or business impact claims.

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

- Risk scores are not operational guarantees.
- Dataset provenance and model metrics must be verified.
- High scores may reflect data construction or leakage.

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
