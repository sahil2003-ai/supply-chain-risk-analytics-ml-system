# Supply Chain Risk Analytics & ML System

An end-to-end analytics project for exploring shipment disruption patterns, querying operational KPIs, comparing classification models, and reviewing shipment risk through a Streamlit app and a four-page Power BI report.

<p align="left">
  <img src="https://img.shields.io/badge/Python-Data%20Analysis-3776AB?logo=python&logoColor=white" alt="Python" />
  <img src="https://img.shields.io/badge/SQL-PostgreSQL-336791?logo=postgresql&logoColor=white" alt="SQL" />
  <img src="https://img.shields.io/badge/Machine%20Learning-scikit--learn%20%7C%20XGBoost-F7931E" alt="Machine Learning" />
  <img src="https://img.shields.io/badge/App-Streamlit-FF4B4B?logo=streamlit&logoColor=white" alt="Streamlit" />
  <img src="https://img.shields.io/badge/Dashboard-Power%20BI-F2C811?logo=powerbi&logoColor=black" alt="Power BI" />
</p>

## Project at a glance

| Area | What is included |
|---|---|
| Dataset profiling | Raw and cleaned shipment data, missing-value checks, label distribution |
| Exploratory analysis | Weather, lead time, carrier reliability, ports, product categories, transport modes |
| SQL analytics | Schema, loading scripts, KPI queries, risk breakdowns and monthly trends |
| Machine learning | Logistic Regression, Random Forest and XGBoost comparison with cross-validation tuning |
| Interactive application | Single-shipment and bulk-CSV prediction workflow with downloadable output |
| Business reporting | Four-page Power BI report and documented findings |

> **Important:** The dataset is a project dataset, and its relationships should not be treated as evidence of real-world causality. Model metrics below are the saved results from the repository notebook's 80/20 stratified train/test split (random state 42), not a guarantee of future performance.

## Screenshots

### Streamlit application

The app supports single-record risk scoring and bulk CSV processing.

<p align="center">
  <img src="images/app.png" alt="Supply Chain Risk Prediction Streamlit application" width="85%" />
</p>

<p align="center">
  <img src="images/app2.png" alt="Supply Chain Risk Prediction application details" width="85%" />
</p>

### Power BI dashboard

The repository contains four dashboard screenshots. Together they cover executive KPIs, risk breakdowns, transport and operations, and product/external factors.

<table>
  <tr>
    <td align="center"><strong>Page 1 — Executive Overview</strong><br/><img src="images/page1.png" alt="Power BI dashboard page 1 - executive overview" width="100%" /></td>
    <td align="center"><strong>Page 2 — Risk Analysis</strong><br/><img src="images/page2.png" alt="Power BI dashboard page 2 - risk analysis" width="100%" /></td>
  </tr>
  <tr>
    <td align="center"><strong>Page 3 — Transport & Operations</strong><br/><img src="images/page3.png" alt="Power BI dashboard page 3 - transport and operations" width="100%" /></td>
    <td align="center"><strong>Page 4 — Product & External Factors</strong><br/><img src="images/page4.png" alt="Power BI dashboard page 4 - product and external factors" width="100%" /></td>
  </tr>
</table>

## Business problem

Shipment disruption can affect delivery schedules, carrier decisions and operating costs. This project explores historical shipment attributes to answer questions such as:

- What share of records has a disruption label?
- How do disruption rates vary by weather, origin port, product category and transport mode?
- How do lead time and carrier reliability vary across shipments?
- How well do different classification approaches identify records labelled as disrupted?
- How could an analyst explore a shipment and review a risk score through an interactive interface?

## Dataset

**Raw file:** [`data/raw/global_supply_chain_risk_dataset.csv`](data/raw/global_supply_chain_risk_dataset.csv)  
**Processed file:** [`data/processed/cleaned_supply_chain.csv`](data/processed/cleaned_supply_chain.csv)

The raw data contains **5,000 rows and 14 columns**, with date values spanning **2024–2025**. A direct profile of the raw fields found **zero missing cells**.

| Dataset metric | Value |
|---|---:|
| Shipment records | 5,000 |
| Raw columns | 14 |
| Missing cells in raw fields | 0 |
| Records labelled as disrupted | 3,063 |
| Disruption-label rate | 61.26% |
| Average lead time | 19.36 days |
| Average carrier reliability score | 0.754 |

### Fields in the raw dataset

| Field | Description |
|---|---|
| `Shipment_ID` | Shipment identifier |
| `Date` | Shipment date |
| `Origin_Port`, `Destination_Port` | Route endpoints |
| `Transport_Mode` | Air, Sea, Rail or Road |
| `Product_Category` | Shipment product group |
| `Distance_km`, `Weight_MT` | Shipment distance and weight |
| `Fuel_Price_Index` | Fuel-price index included in the dataset |
| `Geopolitical_Risk_Score` | Numeric geopolitical-risk indicator |
| `Weather_Condition` | Recorded weather category |
| `Carrier_Reliability_Score` | Carrier reliability indicator |
| `Lead_Time_Days` | Recorded lead time |
| `Disruption_Occurred` | Binary target label used for classification |

The processed dataset adds derived fields such as `year`, `month`, `risk_level`, `transport_category`, and `efficiency_score`.

**Interpretation note:** the 61.26% figure is the proportion of positive labels in this dataset, not model accuracy and not an estimate that 61.26% of real-world shipments will be disrupted.

## Exploratory data analysis

The EDA notebook examines label rates and distributions across key operational features, including:

- Weather and disruption labels
- Origin-port and transport-mode comparisons
- Product-category differences
- Lead-time distribution and its relationship with the target label
- Fuel-price index versus lead time
- Numeric-feature correlation
- Potentially critical records with a high derived risk level and low carrier reliability

### Selected descriptive findings

The following values are documented in the repository's recalculated SQL analysis report:

| Segment | Shipment count | Disruption-label rate |
|---|---:|---:|
| Hurricane | 990 | 100.00% |
| Storm | 1,002 | 79.54% |
| Fog | 1,036 | 48.07% |
| Rain | 977 | 41.97% |
| Clear | 995 | 36.98% |

The hurricane result is unusually strong and should prompt checks of how the dataset and target were generated. It does **not** establish that weather caused the label. Transport-mode disruption-label rates are all close to 61% in the documented breakdown, so this analysis does not support claiming one mode is clearly safer based on those values alone.

More findings are available in [`reports/eda_insights.md`](reports/eda_insights.md) and [`reports/sql_analysis.md`](reports/sql_analysis.md).

## Machine-learning approach

The modeling notebook compares three classifiers:

1. **Logistic Regression**
2. **Random Forest**
3. **XGBoost**

The notebook removes shipment ID and date from the feature set, encodes categorical columns with one-hot encoding, uses a stratified 80/20 train/test split with random state 42, and uses three-fold `GridSearchCV` with F1 scoring to tune model candidates.

### Saved holdout results

| Model | Accuracy | Precision | Recall | F1 score | ROC-AUC |
|---|---:|---:|---:|---:|---:|
| Logistic Regression | 0.738 | 0.783 | 0.793 | **0.788** | **0.827** |
| Random Forest | 0.704 | 0.716 | **0.856** | 0.780 | 0.810 |
| XGBoost | 0.731 | 0.777 | 0.786 | 0.782 | 0.821 |

The saved notebook selects **Logistic Regression** by F1 score. In this comparison it has the highest F1 and ROC-AUC, while Random Forest has the highest recall for the positive class.

For the Logistic Regression result, the recorded confusion matrix is:

|  | Predicted: no disruption | Predicted: disruption |
|---|---:|---:|
| Actual: no disruption | 252 | 135 |
| Actual: disruption | 127 | 486 |

These are results on the notebook's 1,000-record held-out test split. They are not a production validation result. Model performance can change with a new split, updated data, feature changes or a different environment.

### Features associated with the model output

The Logistic Regression notebook's largest absolute coefficients included:

- `weather_condition_Hurricane`
- `weather_condition_Storm`
- `geopolitical_risk_score`
- `lead_time_days`
- `carrier_reliability_score`

These are model associations in this dataset, not causal effects. Feature availability at the moment a real prediction would be made should be reviewed before deployment.

Modeling details: [`notebooks/03_ml_model.ipynb`](notebooks/03_ml_model.ipynb) · [`reports/ml_insights.md`](reports/ml_insights.md)

## SQL analytics

The `sql/` directory contains a schema, data-loading SQL and analytical queries intended for PostgreSQL-style analysis.

Queries cover:

- Executive KPI summary: shipment count, disruption-label rate, average lead time and carrier reliability
- Disruption rate by weather condition, transport mode and product category
- Highest-label-rate origin ports
- Fuel-price buckets and delivery performance
- Fast, moderate and slow delivery groupings
- High-geopolitical-risk records with lower carrier reliability
- Monthly shipment volumes and disruption-label trends
- A KPI summary view for dashboard use

**Reproducibility note:** the metrics in the SQL analysis report were recalculated directly from the CSV. They are not represented as proof that the SQL scripts were executed against a live PostgreSQL instance. Re-run the scripts against a loaded database to reconcile the query outputs.

Useful files: [`sql/Schema.sql`](sql/Schema.sql) · [`sql/load_data.sql`](sql/load_data.sql) · [`sql/queries.sql`](sql/queries.sql) · [`reports/sql_analysis.md`](reports/sql_analysis.md)

## Streamlit application

The application in [`app/app.py`](app/app.py) provides two modes:

- **Single Prediction:** enter shipment attributes and view a classification result with a probability-style display.
- **Bulk Prediction:** upload a CSV, preview input records, generate predictions, and download the output as CSV.

A saved batch output is available at [`outputs/bulk_predictions.csv`](outputs/bulk_predictions.csv).

> The app and saved prediction file are project artifacts, not proof of production deployment or validated real-world risk probabilities. Before using the UI for decisions, verify that the input fields, category values, encodings and preprocessing exactly match the training pipeline. In particular, audit the app's feature ranges and scaling behavior against the notebook before treating its displayed probabilities as calibrated.

## Power BI report

The report file is [`powerbi/Supply_chain_risk.pbix`](powerbi/Supply_chain_risk.pbix). The project documentation describes four pages:

| Page | Intended focus |
|---|---|
| Executive Overview | Total shipments, disruption-label rate, average lead time, risk/reliability indicators and time trends |
| Risk Analysis | Label rate by risk level and weather, origin-port risk, shipment-level details |
| Transport & Operations | Lead time, reliability, efficiency and monthly volume by transport mode |
| Product & External Factors | Product category, weather, fuel-price index and external risk indicators |

Dashboard description: [`reports/dashboard_explanation.md`](reports/dashboard_explanation.md)

## Workflow

```text
Raw CSV
  │
  ├── Data cleaning and validation
  │      └── Processed shipment dataset
  │
  ├── Exploratory data analysis
  │      └── Descriptive findings and charts
  │
  ├── SQL schema + load + analytical queries
  │      └── Operational KPI summaries
  │
  ├── Model comparison and evaluation
  │      └── Saved model and scaler
  │
  ├── Streamlit interface
  │      └── Single and bulk prediction workflow
  │
  └── Power BI report
         └── Four-page business reporting view
```

## Repository structure

```text
supply-chain-risk-analytics-ml-system/
├── app/
│   └── app.py
├── data/
│   ├── raw/
│   │   └── global_supply_chain_risk_dataset.csv
│   └── processed/
│       └── cleaned_supply_chain.csv
├── images/
│   ├── app.png
│   ├── app2.png
│   ├── page1.png
│   ├── page2.png
│   ├── page3.png
│   └── page4.png
├── models/
│   ├── best_model.pkl
│   └── scaler.pkl
├── notebooks/
│   ├── 01_data_cleaning.ipynb
│   ├── 02_eda_analysis.ipynb
│   └── 03_ml_model.ipynb
├── outputs/
│   └── bulk_predictions.csv
├── powerbi/
│   └── Supply_chain_risk.pbix
├── reports/
│   ├── dashboard_explanation.md
│   ├── eda_insights.md
│   ├── final_report.md
│   ├── ml_insights.md
│   └── sql_analysis.md
├── sql/
│   ├── Schema.sql
│   ├── load_data.sql
│   └── queries.sql
├── requirements.txt
└── README.md
```

## Run locally

### 1. Clone and create a virtual environment

```bash
git clone https://github.com/sahil2003-ai/supply-chain-risk-analytics-ml-system.git
cd supply-chain-risk-analytics-ml-system

python -m venv .venv
```

Activate the environment:

```bash
# Windows PowerShell
.venv\Scripts\Activate.ps1

# macOS / Linux
source .venv/bin/activate
```

### 2. Install dependencies

```bash
pip install -r requirements.txt
```

### 3. Explore the analysis

Open Jupyter and run the notebooks in order, checking their relative file paths:

```bash
jupyter notebook
```

1. `notebooks/01_data_cleaning.ipynb`
2. `notebooks/02_eda_analysis.ipynb`
3. `notebooks/03_ml_model.ipynb`

The repository's notebook cells use relative paths such as `../data/processed/cleaned_supply_chain.csv`; run them from a working directory consistent with those paths.

### 4. Launch the Streamlit application

The app loads model artifacts and data from paths relative to `app/app.py`:

```bash
streamlit run app/app.py
```

If you retrain a model or change preprocessing, update the app so its feature ordering, categorical levels and scaling path remain consistent with the model pipeline.

### 5. Review SQL and Power BI

Use a PostgreSQL database to run the schema, load and analysis scripts after adapting the file path and import method to your environment. Open `powerbi/Supply_chain_risk.pbix` in Power BI Desktop to inspect the report pages and reconcile the figures against the source data.

## Limitations and next steps

- **Dataset provenance:** document the dataset's source, generation method and licence.
- **Target construction:** investigate unusually strong label patterns (including the hurricane group) for potential synthetic-rule leakage.
- **Evaluation:** record a baseline, per-class metrics, cross-validation variability and probability calibration.
- **Leakage review:** confirm all features are available at the time the prediction would be made; `lead_time_days` may not be known at shipment dispatch.
- **App/model consistency:** centralize preprocessing in a saved pipeline rather than recreating encodings separately in the app.
- **Data validation:** add schema and range checks for uploaded CSVs, plus automated tests for missing columns and unexpected categories.
- **Reproducibility:** pin dependency versions and add a clean-environment setup/test run.
- **Reporting reconciliation:** compare Python, SQL, Streamlit and Power BI metrics using the same definitions and data version.

## Skills demonstrated

Python · pandas · exploratory data analysis · data cleaning · SQL · PostgreSQL · scikit-learn · Logistic Regression · Random Forest · XGBoost · model evaluation · feature encoding · Streamlit · Plotly · Power BI · business reporting

## Project files

- [Final report](reports/final_report.md)
- [EDA insights](reports/eda_insights.md)
- [Machine-learning insights](reports/ml_insights.md)
- [SQL analysis](reports/sql_analysis.md)
- [Dashboard explanation](reports/dashboard_explanation.md)

## Author

**Sahil Gaikwad**  
[GitHub](https://github.com/sahil2003-ai) · [LinkedIn](https://www.linkedin.com/in/sahil-gaikwad-a76b7224a/)
