# 🚀 Supply Chain Risk Analytics Report

## 🎯 Objective
The goal of this project is to analyze supply chain data and build a machine learning system to predict shipment disruptions and provide actionable business insights.

---

## 📊 Dataset Overview
- Total Records: ~5000 shipments
- Features:
  - Transport Mode, Product Category
  - Distance, Weight
  - Fuel Price Index
  - Geopolitical Risk Score
  - Weather Condition
  - Carrier Reliability Score
  - Lead Time

---

## 🧹 Data Preparation
- Cleaned column names
- Converted date columns
- Handled missing values
- Removed duplicates
- Created new features:
  - Year, Month
  - Risk Level (Low, Medium, High)
  - Transport Category
  - Efficiency Score

---

## 📈 Key Insights (Python Analysis)
- High geopolitical risk strongly increases disruptions
- Weather conditions (Hurricane, Storm) have highest impact
- Low carrier reliability increases disruption probability
- Longer lead time correlates with higher disruption risk

---

## 🗄️ SQL Analytics Summary
Using PostgreSQL (Star Schema), key business insights were derived:

- **Total Shipments:** 5000  
- **Disruption Rate:** ~61% (critical issue)

### Key Findings:
- **Transport Mode:**
  - Sea → lowest disruption (most stable)
  - Air → fastest but highest risk
- **Weather Impact:**
  - Hurricane → 100% disruption
  - Storm → ~80% disruption
- **Delivery Speed:**
  - Slow deliveries → ~70% disruption
  - Fast deliveries → ~53% disruption
- **Product Risk:**
  - Textiles → highest disruption
  - Electronics → lowest disruption
- **Seasonality:**
  - Mid-year months show peak disruption

📌 Detailed SQL analysis available in:
➡️ `reports/sql_analysis.md`

---

## 🤖 Machine Learning Model
- Models used:
  - Logistic Regression
  - Random Forest
  - XGBoost

- Best Model: **Logistic Regression**
- F1 Score: ~0.78

---

## 📊 Model Evaluation
- ROC-AUC curve shows strong performance
- Confusion matrix is well balanced
- Important features:
  - Risk score
  - Lead time
  - Carrier reliability

---

## 🌐 Application Deployment
Streamlit app features:
- Single prediction
- Bulk CSV prediction
- Risk probability output
- Downloadable results

---

## 📊 Dashboard (Power BI)
4-page dashboard:
1. Executive Overview
2. Risk Analysis
3. Transport & Operations
4. Product & External Factors

---

## 💡 Business Recommendations
- Avoid high-risk routes during extreme weather
- Use high-reliability carriers
- Optimize slow delivery pipelines
- Monitor geopolitical risks

---

## 🚀 Conclusion
End-to-end data analytics + ML system enabling intelligent supply chain decision-making.

---