# Electricity-Consumption-Time-Series-Forecasting

## 📌 Project Overview
This project analyzes Germany’s daily electricity consumption from **2006–2017** using data from the [Open Power System Data](https://data.open-power-system-data.org/) platform.  
The goal is to explore patterns, detect seasonality/trends, and forecast future electricity demand using **Time Series Analysis** techniques in R.

---

## 📂 Dataset
- **Source:** Open Power System Data (OPS) – Germany daily data  
- **Columns:**
  - `Date`
  - `Consumption` (GWh)
  - `Wind` (GWh)
  - `Solar` (GWh)
  - `Wind + Solar` (GWh)

---

## 🛠️ Technologies Used
- **Language:** R
- **Libraries:**
  - `ggplot2` – Data visualization
  - `forecast` – ARIMA, ETS, and STL decomposition
  - `tseries` – Stationarity tests
  - `stats` – Time series objects and decomposition

---

## 🔍 Project Workflow

### 1️⃣ Data Cleaning & Preparation
- Imported CSV data using `read.csv()`
- Parsed `Date` column and created **Year**, **Month**, **Day** features
- Handled missing values in wind/solar data

### 2️⃣ Exploratory Data Analysis (EDA)
- Visualized **Consumption**, **Wind**, and **Solar** trends using **Base R** and **ggplot2**
- Compared raw vs. log-transformed and differenced data
- Subset specific years for detailed seasonal analysis

### 3️⃣ Time Series Conversion & Analysis
- Converted dataset into **ts** objects
- Applied **STL decomposition** to separate trend, seasonality, and remainder
- Conducted stationarity checks using the **ADF test**

### 4️⃣ Forecasting
- Built **ARIMA** and **ETS** models
- Evaluated models with **MAE** and **RMSE**
- Visualized forecasted values with confidence intervals

---

## 📈 Results & Insights
- Clear **yearly seasonality** with winter peaks in consumption
- **ARIMA** delivered better short-term accuracy
- **ETS** captured long-term trends more effectively
- Wind and solar production increased steadily over time

---

## 🚀 How to Run
```bash
# Clone this repository
git clone https://github.com/yourusername/electricity-timeseries-forecast.git

# Open in RStudio and run main.R
