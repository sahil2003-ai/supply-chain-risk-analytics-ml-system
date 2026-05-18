# 📊 SQL Supply Chain Analysis (Detailed Report)

## 🗄️ Database Design
- Fact Table: `fact_shipments`
- Dimensions:
  - dim_date
  - dim_transport
  - dim_product
  - dim_weather

✔️ Star schema implemented for analytical queries

---

## 📊 Executive KPI Summary
- Total Shipments: 5000  
- Disruption Rate: 61.26%  
- Avg Delivery Time: 19.36 days  
- Carrier Reliability: 0.75  

### 🔍 Insight:
High disruption rate indicates major operational inefficiencies.

---

## 🌍 High-Risk Origin Ports
Top ports with highest disruption:
- Hamburg (~62.5%)
- Shanghai (~62.4%)
- Singapore (~62.3%)

### 🔍 Insight:
Global logistics hubs contribute significantly to disruption risk.

---

## 🚚 Transport Mode Analysis

| Mode | Avg Time | Reliability | Disruption |
|------|---------|------------|------------|
| Air  | Fastest | Moderate   | Highest    |
| Rail | Balanced| Best       | Moderate   |
| Sea  | Slowest | Stable     | Lowest     |
| Road | Medium  | Stable     | Low        |

### 🏆 Best Mode:
Sea (lowest disruption risk)

---

## 🌦️ Weather Impact

| Weather | Disruption |
|--------|-----------|
| Hurricane | 100% |
| Storm | ~80% |
| Clear | ~37% |

### 🔍 Insight:
Weather is the most critical external disruption factor.

---

## 📦 Product Category Risk
- Textiles → highest disruption
- Electronics → lowest disruption

### 🔍 Insight:
Supply chain efficiency varies by product type.

---

## ⏱️ Delivery Speed Impact

| Category | Disruption |
|----------|-----------|
| Slow | ~70% |
| Fast | ~53% |

### 🔍 Insight:
Faster delivery reduces disruption significantly.

---

## ⛽ Fuel Price Impact
- Disruption varies between 55%–73%
- Indicates cost volatility affects logistics performance

---

## 📅 Monthly Trends
- Peak disruption: Mid-year (~67%)
- Lowest disruption: Early year (~56%)

### 🔍 Insight:
Seasonality impacts supply chain performance.

---

## 🚨 High-Risk Shipment Detection
Criteria:
- High geopolitical risk
- Low carrier reliability

### 🔍 Insight:
These shipments require proactive monitoring systems.

---

## 🧠 Final SQL Conclusion
SQL analysis reveals that disruption is influenced by:
- External factors (weather, fuel)
- Operational factors (delivery speed)
- Strategic factors (transport mode, routes)

---
