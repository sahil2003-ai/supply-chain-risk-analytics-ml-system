# Supply Chain Risk Analytics and Disruption Prediction

An end-to-end portfolio project combining shipment analytics, a PostgreSQL-style dimensional model, machine learning, and dashboard reporting to explore supply-chain disruption risk.

## Business Objective
Understand shipment delays and disruption patterns, compare risk across operational factors, and test whether shipment attributes can help classify disruption risk.

## Technology
- **SQL:** PostgreSQL; documented star-schema design
- **Python:** pandas, NumPy, Matplotlib, Seaborn
- **Machine learning:** scikit-learn, XGBoost
- **Reporting/app:** Power BI, Streamlit, Plotly

## Data Architecture
The existing README describes a shipment fact table and dimensions for date, transport, product, and weather. Check `sql/Schema.sql` and related files for the current schema.

## Analysis Areas
- Shipment disruption and delivery-time metrics
- Comparisons by transport mode, weather, product, and risk group
- Classification experiments with Logistic Regression, Random Forest, and XGBoost
- KPI dashboards and visual summaries

## Model Evaluation
The current README reports model results, including an F1 score around 0.78 for a Logistic Regression model. Treat these as provisional until reproduced from the current code and data. Report the exact split strategy, positive-class definition, precision, recall, F1, ROC-AUC, and baseline.

## How to Review
1. Inspect the dataset, schema, and SQL scripts.
2. Install the pinned dependencies in `requirements.txt`.
3. Follow the actual notebook or script entry points in the repository.
4. Open the Power BI report and verify measure definitions.
5. Compare documented metrics with a clean rerun.

## Risks and Limitations
High disruption rates or strong model scores may reflect the dataset construction or target definition. Check class balance, leakage, duplicate records, and whether features would be available at prediction time.

## Recommended Improvements
Add a data dictionary, reproducible setup commands, dashboard screenshots, a model card, and a verified results table. Do not treat model risk scores as operational guarantees.