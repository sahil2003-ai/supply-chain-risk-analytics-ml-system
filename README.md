# Supply Chain Risk Analytics ML System

An end-to-end portfolio project combining Python, SQL, machine learning, Streamlit, and Power BI to analyze shipment disruption patterns and explore risk-classification workflows.

## Repository structure

- `data/raw/global_supply_chain_risk_dataset.csv`: source shipment records
- `data/processed/cleaned_supply_chain.csv`: processed data
- `notebooks/`: data cleaning, EDA, and ML modeling
- `sql/`: schema, loading, and analytics queries
- `app/app.py`: Streamlit application
- `models/`: saved estimator and scaler
- `outputs/bulk_predictions.csv`: exported predictions
- `powerbi/Supply_chain_risk.pbix`: dashboard
- `reports/`: EDA, SQL, ML, dashboard, and final reports
- `images/`: application/report screenshots

## Verified raw dataset profile

Recalculated from `data/raw/global_supply_chain_risk_dataset.csv`:

| Metric | Result |
|---|---:|
| Rows | 5,000 |
| Columns | 14 |
| Missing cells | 0 |
| Disruption-labeled records | 3,063 |
| Overall disruption-label rate | 61.26% |
| Date coverage in the source records | 2024–2025 |

Fields include date, origin/destination ports, transport mode, product category, distance, shipment weight, fuel-price index, geopolitical-risk score, weather, carrier reliability, lead time, and `Disruption_Occurred`.

## Descriptive findings in the raw dataset

| Segment | Records | Disrupted records | Disruption-label rate |
|---|---:|---:|---:|
| Hurricane | 990 | 990 | 100.0% |
| Storm | 1,002 | 797 | 79.5% |
| Fog | 1,036 | 498 | 48.1% |
| Rain | 977 | 410 | 42.0% |
| Clear | 995 | 368 | 37.0% |

Transport-mode label rates are comparatively similar in this dataset: Air 61.7%, Rail 61.2%, Road 61.0%, and Sea 61.0%. The Textiles category has a 64.9% label rate; Pharmaceuticals 61.1%, Automotive 60.5%, Perishables 60.3%, and Electronics 59.5%.

These are descriptive associations in the supplied dataset, not proof that weather or transport mode independently causes disruptions. The exact pattern—especially a 100% disruption label for all Hurricane records—should be checked against how the dataset and target were generated.

## Workflow

1. Profile source data and validate date formats, missing values, and label balance.
2. Apply the cleaning and feature-engineering workflow in the notebooks.
3. Load/query the data using the SQL scripts.
4. Review the EDA, then confirm the ML target and the time at which each predictor would be available.
5. Evaluate models on a held-out set with an appropriate baseline.
6. Use the Streamlit app for single/bulk predictions and compare Power BI measures with validated data totals.

## Saved model results: verification required

The existing report files document logistic regression, random forest, and XGBoost experiments and report an F1 score around 0.78 for logistic regression. This is a stored project result, not an independently reproduced current score. Before treating it as validated model performance, rerun the notebook and confirm the target definition, feature list, split strategy, confusion matrix, precision/recall, and baseline. The result should be described as classification of the available label, not a guaranteed forecast of future disruptions.

## Reproduce

1. Create an environment and install `requirements.txt`.
2. Follow the schema and data-loading scripts in `sql/`.
3. Run the notebooks in sequence: cleaning, EDA, then modeling.
4. Validate model performance with a held-out split and compare it with a baseline.
5. Launch the Streamlit app from the confirmed entry point.
6. Open the Power BI report and reconcile its KPIs with verified outputs.

## Limitations

- The raw dataset has no missing cells in the supplied CSV, but target-generation methodology and the extreme weather-label relationship need documentation.
- Saved model scores have not been independently reproduced in this review.
- Historical relationships are descriptive and do not establish causality.
- Document the dataset source/license and verify the processed row count before asserting end-to-end data-preparation integrity.

## Skills demonstrated

Data profiling, EDA, SQL/PostgreSQL, feature engineering, classification evaluation, model serving, bulk inference, Power BI, and careful interpretation of model results.

## Author

Sahil Gaikwad · [GitHub](https://github.com/sahil2003-ai) · [LinkedIn](https://www.linkedin.com/in/sahil-gaikwad-a76b7224a/)
