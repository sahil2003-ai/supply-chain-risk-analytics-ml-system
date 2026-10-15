# Supply Chain Risk Analytics ML System

An end-to-end portfolio project combining Python, SQL, machine learning, Streamlit, and Power BI to analyze supply-chain shipment risk.

## Project overview

The repository includes raw and processed shipment datasets, cleaning and EDA notebooks, an ML notebook, SQL scripts, a Streamlit application, a Power BI report, model artifacts, prediction outputs, and written reports.

## Repository map

- `data/raw/`: source dataset
- `data/processed/`: cleaned/derived dataset
- `notebooks/`: cleaning, EDA, and model workflow
- `sql/`: schema, loading, and analytics queries
- `app/app.py`: application entry point
- `models/`: saved estimator and scaler
- `outputs/bulk_predictions.csv`: exported predictions
- `powerbi/`: dashboard
- `reports/`: findings and project documentation

## Dataset and workflow

The written project report describes approximately 5,000 shipments and features such as transport mode, product category, distance, weight, fuel index, geopolitical risk, weather, carrier reliability, and lead time. Recalculate the exact raw/processed row counts from the current CSV files before publishing them as definitive dataset metrics.

The workflow is organized around:
1. Data profiling and cleaning.
2. EDA and operational risk comparisons.
3. SQL-based shipment and risk summaries.
4. Classification model experiments.
5. Single and bulk prediction through Streamlit.
6. Dashboard reporting in Power BI.

## Reported model results — validation needed

The report files record approximately 0.78 F1 for logistic regression, random forest, and XGBoost, with logistic regression described as the selected model. These values are copied from saved project documentation and have **not been independently reproduced in this README review**. Treat them as documented results, not independently verified current performance, until the ML notebook is rerun and the split strategy, label definition, and confusion matrix are checked.

The report also describes a disruption rate of approximately 61% and several weather/transport patterns. Those business values likewise require reproducible recalculation from the current data and queries before being treated as verified findings.

## Reproduce

1. Create an environment and install `requirements.txt`.
2. Follow the SQL schema and loading scripts in `sql/`.
3. Run notebooks in order: data cleaning, EDA, then ML modeling.
4. Verify the train/test split and compute classification metrics from held-out predictions.
5. Launch the Streamlit app using the confirmed application entry point.
6. Open the Power BI report and reconcile its KPIs with the validated outputs.

## Evaluation checklist

- Confirm the actual target definition and class balance.
- Report precision, recall, F1, ROC-AUC, and confusion matrix from the same held-out set.
- Check for target leakage and confirm predictors are available at prediction time.
- Compare against a baseline.
- Recompute all summary statistics and document the formulas.
- Do not imply that recommendations have reduced disruptions without measured business outcomes.

## Limitations

The narrative reports include rounded estimates and qualitative interpretations. Dataset dimensions, disruption rates, and model scores should be refreshed from the repository's executable workflow before being used as claims of verified performance. Historical associations are not causal proof.

## Skills demonstrated

Data preparation, EDA, SQL analytics, classification evaluation, model serving, bulk inference, dashboarding, and careful model validation.

## Author

Sahil Gaikwad · [GitHub](https://github.com/sahil2003-ai) · [LinkedIn](https://www.linkedin.com/in/sahil-gaikwad-a76b7224a/)
