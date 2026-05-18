-- =========================================
-- KPI SUMMARY (EXECUTIVE VIEW)
-- =========================================
SELECT
    COUNT(*) AS total_shipments,
    
    ROUND(AVG(disruption_occurred) * 100, 2) 
        AS disruption_rate_percent,
    
    ROUND(AVG(lead_time_days)::numeric, 2) 
        AS avg_delivery_time_days,
    
    ROUND(AVG(carrier_reliability_score)::numeric, 2) 
        AS avg_carrier_reliability

FROM fact_shipments;

-- =========================================
-- TOP 10 HIGH-RISK ORIGIN PORTS
-- =========================================
SELECT
    origin_port,
    
    COUNT(*) AS total_shipments,
    
    ROUND(AVG(disruption_occurred) * 100, 2) 
        AS disruption_rate_percent

FROM fact_shipments

GROUP BY origin_port

HAVING COUNT(*) > 10   -- avoid small sample bias

ORDER BY disruption_rate_percent DESC

LIMIT 10;

-- =========================================
-- TRANSPORT MODE PERFORMANCE ANALYSIS
-- =========================================
SELECT
    transport_mode,
    
    COUNT(*) AS total_shipments,
    
    ROUND(AVG(lead_time_days)::numeric, 2) 
        AS avg_delivery_time,
    
    ROUND(AVG(carrier_reliability_score)::numeric, 2) 
        AS avg_reliability,
    
    ROUND(AVG(disruption_occurred) * 100, 2) 
        AS disruption_rate_percent

FROM fact_shipments

GROUP BY transport_mode

ORDER BY disruption_rate_percent DESC;

-- =========================================
-- WEATHER IMPACT ANALYSIS
-- =========================================
SELECT
    weather_condition,
    
    COUNT(*) AS total_shipments,
    
    ROUND(AVG(disruption_occurred) * 100, 2) 
        AS disruption_rate_percent

FROM fact_shipments

GROUP BY weather_condition

ORDER BY disruption_rate_percent DESC;

-- =========================================
-- PRODUCT CATEGORY RISK ANALYSIS
-- =========================================
SELECT
    product_category,
    
    COUNT(*) AS total_orders,
    
    ROUND(AVG(lead_time_days)::numeric, 2) 
        AS avg_lead_time,
    
    ROUND(AVG(disruption_occurred) * 100, 2) 
        AS disruption_rate_percent

FROM fact_shipments

GROUP BY product_category

ORDER BY disruption_rate_percent DESC;

-- =========================================
-- ⛽ FUEL PRICE VS DELIVERY PERFORMANCE
-- =========================================
SELECT
    ROUND(fuel_price_index::numeric, 1) AS fuel_price_bucket,
    
    COUNT(*) AS shipments,
    
    ROUND(AVG(lead_time_days)::numeric, 2) 
        AS avg_delivery_time,
    
    ROUND(AVG(disruption_occurred) * 100, 2) 
        AS disruption_rate_percent

FROM fact_shipments

GROUP BY fuel_price_bucket

ORDER BY fuel_price_bucket;

-- =========================================
-- DELIVERY SPEED VS DISRUPTION RISK
-- =========================================
SELECT
    CASE
        WHEN lead_time_days < 5 THEN 'Fast Delivery'
        WHEN lead_time_days BETWEEN 5 AND 10 THEN 'Moderate Delivery'
        ELSE 'Slow Delivery'
    END AS delivery_category,
    
    COUNT(*) AS total_shipments,
    
    ROUND(AVG(disruption_occurred) * 100, 2) 
        AS disruption_rate_percent

FROM fact_shipments

GROUP BY delivery_category

ORDER BY disruption_rate_percent DESC;

-- =========================================
-- CRITICAL HIGH-RISK SHIPMENTS
-- =========================================
SELECT
    shipment_id,
    origin_port,
    destination_port,
    transport_mode,
    
    geopolitical_risk_score,
    carrier_reliability_score,
    
    lead_time_days,
    disruption_occurred

FROM fact_shipments

WHERE geopolitical_risk_score >= 7
  AND carrier_reliability_score < 0.6

ORDER BY geopolitical_risk_score DESC;

-- =========================================
-- MONTHLY DISRUPTION TREND
-- =========================================
SELECT 
    DATE_TRUNC('month', date) AS month,

    COUNT(*) AS total_shipments,

    ROUND(AVG(lead_time_days)::numeric, 2) AS avg_delivery_time,

    ROUND(AVG(disruption_occurred)::numeric * 100, 2) AS disruption_rate_percent

FROM fact_shipments

GROUP BY DATE_TRUNC('month', date)

ORDER BY month;

-- =========================================
-- BEST TRANSPORT MODE (LOWEST RISK)
-- =========================================
SELECT
    transport_mode,
    
    ROUND(AVG(disruption_occurred)::numeric, 3) 
        AS risk_score

FROM fact_shipments

GROUP BY transport_mode

ORDER BY risk_score ASC

LIMIT 1;

-- =========================================
-- KPI VIEW FOR DASHBOARD
-- =========================================
CREATE OR REPLACE VIEW kpi_summary AS
SELECT
    COUNT(*) AS total_shipments,
    
    ROUND(AVG(disruption_occurred) * 100, 2) 
        AS disruption_rate_percent,
    
    ROUND(AVG(lead_time_days)::numeric, 2) 
        AS avg_delivery_time,
    
    ROUND(AVG(carrier_reliability_score)::numeric, 2) 
        AS avg_reliability

FROM fact_shipments;