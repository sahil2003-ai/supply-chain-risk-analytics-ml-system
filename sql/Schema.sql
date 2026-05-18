-- ===============================
-- Create fact table
-- ===============================

CREATE TABLE fact_shipments (
    shipment_id TEXT PRIMARY KEY,
    date DATE,
    origin_port TEXT,
    destination_port TEXT,
    transport_mode TEXT,
    product_category TEXT,
    distance_km FLOAT,
    weight_mt FLOAT,
    fuel_price_index FLOAT,
    geopolitical_risk_score FLOAT,
    carrier_reliability_score FLOAT,
    lead_time_days FLOAT,
    disruption_occurred INT
);

-- ===============================
-- Create dimension tables
-- ===============================

CREATE TABLE dim_date (
    date DATE PRIMARY KEY,
    year INT,
    month INT
);

CREATE TABLE dim_transport (
    transport_mode TEXT PRIMARY KEY,
    transport_category TEXT
);

CREATE TABLE dim_product (
    product_category TEXT PRIMARY KEY
);

CREATE TABLE dim_weather (
    weather_condition TEXT PRIMARY KEY
);

-- ====================================
-- Insert data into dimension tables
-- ====================================

INSERT INTO dim_date (date, year, month)

SELECT DISTINCT
    date,
    EXTRACT(YEAR FROM date) AS year,
    EXTRACT(MONTH FROM date) AS month

FROM fact_shipments

WHERE date IS NOT NULL;


INSERT INTO dim_transport (transport_mode, transport_category)

SELECT DISTINCT
    transport_mode,
    
    CASE
        WHEN transport_mode = 'Air' THEN 'Fast'
        WHEN transport_mode = 'Sea' THEN 'Slow'
        WHEN transport_mode = 'Rail' THEN 'Moderate'
        WHEN transport_mode = 'Road' THEN 'Variable'
        ELSE 'Other'
    END AS transport_category

FROM fact_shipments;


INSERT INTO dim_product (product_category)

SELECT DISTINCT product_category

FROM fact_shipments

WHERE product_category IS NOT NULL;


INSERT INTO dim_weather (weather_condition)

SELECT DISTINCT weather_condition

FROM fact_shipments

WHERE weather_condition IS NOT NULL;

SELECT * FROM dim_product;
SELECT * FROM dim_transport;
SELECT * FROM dim_weather;
SELECT * FROM dim_date;