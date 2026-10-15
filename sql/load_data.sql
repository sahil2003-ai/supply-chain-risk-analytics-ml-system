-- Load the repository CSV into the fact table using PostgreSQL psql.
-- Run from the repository root after sql/Schema.sql has created fact_shipments:
--   psql -d YOUR_DATABASE -f sql/load_data.sql
-- The source uses DD-MM-YYYY dates; keep dates as text in staging and parse explicitly.

DROP TABLE IF EXISTS supply_chain_staging;
CREATE TEMP TABLE supply_chain_staging (
  shipment_id TEXT,
  date_text TEXT,
  origin_port TEXT,
  destination_port TEXT,
  transport_mode TEXT,
  product_category TEXT,
  distance_km TEXT,
  weight_mt TEXT,
  fuel_price_index TEXT,
  geopolitical_risk_score TEXT,
  weather_condition TEXT,
  carrier_reliability_score TEXT,
  lead_time_days TEXT,
  disruption_occurred TEXT
);

\copy supply_chain_staging FROM 'data/raw/global_supply_chain_risk_dataset.csv' WITH (FORMAT csv, HEADER true)

INSERT INTO fact_shipments (
  shipment_id, date, origin_port, destination_port, transport_mode,
  product_category, weather_condition, distance_km, weight_mt,
  fuel_price_index, geopolitical_risk_score, carrier_reliability_score,
  lead_time_days, disruption_occurred
)
SELECT
  shipment_id,
  TO_DATE(date_text, 'DD-MM-YYYY'),
  origin_port,
  destination_port,
  transport_mode,
  product_category,
  weather_condition,
  NULLIF(distance_km, '')::DOUBLE PRECISION,
  NULLIF(weight_mt, '')::DOUBLE PRECISION,
  NULLIF(fuel_price_index, '')::DOUBLE PRECISION,
  NULLIF(geopolitical_risk_score, '')::DOUBLE PRECISION,
  NULLIF(carrier_reliability_score, '')::DOUBLE PRECISION,
  NULLIF(lead_time_days, '')::DOUBLE PRECISION,
  NULLIF(disruption_occurred, '')::INTEGER
FROM supply_chain_staging
ON CONFLICT (shipment_id) DO UPDATE SET
  date = EXCLUDED.date,
  origin_port = EXCLUDED.origin_port,
  destination_port = EXCLUDED.destination_port,
  transport_mode = EXCLUDED.transport_mode,
  product_category = EXCLUDED.product_category,
  weather_condition = EXCLUDED.weather_condition,
  distance_km = EXCLUDED.distance_km,
  weight_mt = EXCLUDED.weight_mt,
  fuel_price_index = EXCLUDED.fuel_price_index,
  geopolitical_risk_score = EXCLUDED.geopolitical_risk_score,
  carrier_reliability_score = EXCLUDED.carrier_reliability_score,
  lead_time_days = EXCLUDED.lead_time_days,
  disruption_occurred = EXCLUDED.disruption_occurred;

-- Sanity checks: these should match the current raw CSV.
SELECT
  COUNT(*) AS total_shipments,
  ROUND(AVG(disruption_occurred)::NUMERIC * 100, 2) AS disruption_rate_percent,
  ROUND(AVG(lead_time_days)::NUMERIC, 2) AS avg_lead_time_days,
  ROUND(AVG(carrier_reliability_score)::NUMERIC, 3) AS avg_carrier_reliability
FROM fact_shipments;
