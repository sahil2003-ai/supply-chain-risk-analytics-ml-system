# =========================================================
# SUPPLY CHAIN RISK PREDICTION APP
# =========================================================

import streamlit as st
import pandas as pd
import joblib
import plotly.graph_objects as go
import os   

# =============
# BASE PATH
# =============
BASE_DIR = os.path.dirname(os.path.abspath(__file__))

model_path = os.path.join(BASE_DIR, "..", "models", "best_model.pkl")
scaler_path = os.path.join(BASE_DIR, "..", "models", "scaler.pkl")
data_path = os.path.join(BASE_DIR, "..", "data", "processed", "cleaned_supply_chain.csv")

# ===============================
# LOAD MODEL
# ===============================
model = joblib.load(model_path)
scaler = joblib.load(scaler_path)

# ===============================
# LOAD TRAIN STRUCTURE
# ===============================
df = pd.read_csv(data_path)

X = df.drop(columns=['disruption_occurred', 'shipment_id', 'date'], errors='ignore')
X = pd.get_dummies(X, drop_first=True)

model_columns = X.columns

# ===============================
# PAGE CONFIG
# ===============================
st.set_page_config(page_title="Supply Chain Risk AI", layout="wide")

st.title("🚀 Supply Chain Risk Prediction System")
st.markdown("AI-powered disruption prediction | Single + Bulk Mode")

# =========================================================
# MODE SELECTION
# =========================================================
mode = st.radio("Select Mode", ["Single Prediction", "Bulk Prediction (CSV Upload)"])

# =========================================================
# SINGLE PREDICTION
# =========================================================
if mode == "Single Prediction":

    st.sidebar.header("Enter Shipment Details")

    transport_mode = st.sidebar.selectbox("Transport Mode", ["Air", "Sea", "Rail", "Road"])
    product_category = st.sidebar.selectbox("Product Category", ["Electronics", "Clothing", "Food", "Machinery"])

    distance_km = st.sidebar.slider("Distance (km)", 100, 10000, 1000)
    weight_mt = st.sidebar.slider("Weight (MT)", 1, 100, 10)

    fuel_price_index = st.sidebar.slider("Fuel Price Index", 50.0, 150.0, 100.0)
    risk_score = st.sidebar.slider("Geopolitical Risk Score", 1.0, 10.0, 5.0)

    weather_condition = st.sidebar.selectbox("Weather", ["Clear", "Rain", "Storm", "Fog"])
    carrier_reliability = st.sidebar.slider("Carrier Reliability", 0.1, 1.0, 0.8)

    lead_time = st.sidebar.slider("Lead Time (Days)", 1, 20, 7)

    input_data = pd.DataFrame({
        "transport_mode": [transport_mode],
        "product_category": [product_category],
        "distance_km": [distance_km],
        "weight_mt": [weight_mt],
        "fuel_price_index": [fuel_price_index],
        "geopolitical_risk_score": [risk_score],
        "weather_condition": [weather_condition],
        "carrier_reliability_score": [carrier_reliability],
        "lead_time_days": [lead_time]
    })

    input_encoded = pd.get_dummies(input_data)
    input_encoded = input_encoded.reindex(columns=model_columns, fill_value=0)

    if st.button("🔍 Predict Disruption"):

        try:
            input_scaled = scaler.transform(input_encoded)
            prediction = model.predict(input_scaled)[0]
            probability = model.predict_proba(input_scaled)[0][1]
        except:
            prediction = model.predict(input_encoded)[0]
            probability = model.predict_proba(input_encoded)[0][1]

        st.subheader("📊 Prediction Result")

        if prediction == 1:
            st.error(f"⚠️ High Risk ({probability:.2%})")
        else:
            st.success(f"✅ Low Risk ({probability:.2%})")

        fig = go.Figure(go.Indicator(
            mode="gauge+number",
            value=probability * 100,
            title={'text': "Risk %"},
            gauge={
                'axis': {'range': [0, 100]},
                'steps': [
                    {'range': [0, 40], 'color': "green"},
                    {'range': [40, 70], 'color': "orange"},
                    {'range': [70, 100], 'color': "red"}
                ]
            }
        ))
        st.plotly_chart(fig, use_container_width=True)

# =========================================================
# BULK PREDICTION (CSV UPLOAD)
# =========================================================
else:

    st.subheader("📂 Upload CSV for Bulk Prediction")

    uploaded_file = st.file_uploader("Upload CSV", type=["csv"])

    if uploaded_file is not None:

        data = pd.read_csv(uploaded_file)

        st.write("📊 Uploaded Data Preview:")
        st.dataframe(data.head())

        original_data = data.copy()

        data = data.drop(columns=['shipment_id', 'date'], errors='ignore')
        data_encoded = pd.get_dummies(data)
        data_encoded = data_encoded.reindex(columns=model_columns, fill_value=0)

        try:
            data_scaled = scaler.transform(data_encoded)
            predictions = model.predict(data_scaled)
            probabilities = model.predict_proba(data_scaled)[:, 1]
        except:
            predictions = model.predict(data_encoded)
            probabilities = model.predict_proba(data_encoded)[:, 1]

        original_data['Prediction'] = ["High Risk" if p == 1 else "Low Risk" for p in predictions]
        original_data['Probability'] = probabilities

        st.subheader("📊 Prediction Results")
        st.dataframe(original_data)

        csv = original_data.to_csv(index=False).encode('utf-8')

        st.download_button(
            label="📥 Download Results CSV",
            data=csv,
            file_name="bulk_predictions.csv",
            mime="text/csv"
        )

# ===============================
# FOOTER
# ===============================
st.markdown("---")
st.markdown("Built by Sahil | AI Supply Chain Analytics")
