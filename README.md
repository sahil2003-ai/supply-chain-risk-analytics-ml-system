# Supply Chain Risk Analytics and Disruption Prediction

An end-to-end project combining shipment analytics, SQL data modelling, machine learning, Power BI, and a Streamlit interface.

## Dashboard & application screenshots

### Streamlit application
![Supply chain application overview](images/app.png)

![Supply chain application details](images/app2.png)

### Power BI report pages
| Overview | Analysis |
|---|---|
| ![Power BI page 1](images/page1.png) | ![Power BI page 2](images/page2.png) |
| ![Power BI page 3](images/page3.png) | ![Power BI page 4](images/page4.png) |

## Step-by-step workflow

1. **Inspect the project** — review `data/`, `sql/`, `notebooks/`, `models/`, `outputs/`, `reports/`, and `requirements.txt`.
2. **Understand the schema** — inspect `sql/Schema.sql` and confirm the shipment fact table and dimension tables.
3. **Validate the data** — check duplicates, missing values, date ranges, class balance, and the definition of disruption.
4. **Run SQL preparation** — create the documented schema and load data using the repository's actual scripts.
5. **Explore shipments** — use the notebooks to examine delivery times, transport mode, weather, products, and disruption patterns.
6. **Train models** — follow the existing notebooks/scripts to train the implemented classifiers.
7. **Evaluate properly** — compare with a baseline and report precision, recall, F1, and other metrics on held-out data; check for target leakage.
8. **Review the dashboard** — open the Power BI report and validate all KPI definitions and filters.
9. **Run the app** — inspect the `app/` folder and follow the actual entry point and configuration.
10. **Document findings** — report only results reproduced from the current data and code.

## Tools
PostgreSQL/SQL, Python, pandas, scikit-learn, XGBoost, Power BI, Streamlit, Plotly.

## Results and limitations
Previously documented metrics should be reproduced before being treated as final. High disruption rates can reflect the dataset or target construction; risk scores are not guarantees.

## Next improvements
Add exact environment/setup commands, data provenance, model card, and verified evaluation table.