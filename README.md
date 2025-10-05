

# ✈️ SkyHack 3.0: A Proactive Flight Turnaround Management Solution

**Team:** Deadline Dominators (Navneet Singh & Pratyush Senhi)
**🌐 Live Dashboard:** [SkyHack 3.0 Website](https://navneetsinghl9.github.io/skyhack_3.0/)

---

## 🚨 1. Problem Statement: The Imperative for Proactive Operations

Airport ground handling is a **logistical challenge** where even minor disruptions can ripple across the entire network, leading to:

* Substantial **financial repercussions**
* **Passenger dissatisfaction** due to delays

The challenge:

* Moving from **reactive operations** (addressing delays after they occur)
* To **proactive operations** (predicting and mitigating risks before they arise)

👉 To enable this shift, ground managers require an **analytical tool** that can **identify high-risk flights** quickly and accurately.

---

## 💡 2. Proposed Solution: An Actionable Intelligence Hub

We designed an **interactive, real-time dashboard** that integrates multiple operational data sources into a **single, prioritized, and actionable framework**.

🌐 **Check it out live:** [SkyHack 3.0 Dashboard](https://navneetsinghl9.github.io/skyhack_3.0/)

This platform provides:

* A **consolidated daily overview** of operational complexity
* **Resource prioritization** for flights at highest risk

---

## ⚙️ 3. Core Functionalities

### 🔮 Predictive Complexity Score

The **complexity score** is a proprietary metric that quantifies operational risk.
It is derived from the following **key metrics**:

* **`turn_slack`** → Available buffer time in turnaround schedule
* **`bags_per_pax`** → Average number of bags handled per passenger
* **`transfer_ratio`** → Proportion of passengers with connecting flights
* **`ssr_per_100pax`** → Special service requests per 100 passengers
* **`delay_minutes`** → Average flight delay duration (in minutes)
* **`load_factor`** → Seat occupancy level of the flight
* **`difficulty_score`** → Final weighted risk score combining all metrics

### 🔍 Dynamic Data Filtering

* Filter data by:

  * **Date**
  * **Airline**
  * **Difficulty classification**

### 📊 Real-Time KPIs

* Total flight volume
* Average delay duration
* Number of **“Difficult”** flights
* Comparative analysis with the **previous day**

### 🚀 Prioritized Action List

* A **Top 10 flights** list with highest complexity scores
* Acts as the **primary daily action plan** for managers

### 📈 Advanced Visualizations

* Interactive charts (via Chart.js) to explore:

  * Distribution of flight complexity scores
  * Daily/weekly/monthly operational trends

---

## 🔗 4. Methodology: The Data Pipeline

Our solution is powered by a **robust ETL (Extract-Transform-Load) pipeline**, which ingests, cleans, and unifies data from multiple sources into a final **analysis-ready dataset (`skyhack_excel.csv`)**.

### 📂 Primary Data Sources

1. **Flight Level Data.csv** → Core schedules, fleet specs, ground times
2. **PNR Flight Level Data.csv** → Passenger booking details (PNRs)
3. **Bag Level Data.csv** → Baggage details (origin vs. transfer)
4. **PNR Remark Level Data.csv** → SSRs (Special Service Requests)
5. **Airports Data.csv** → Supplementary airport metadata

### 🗄️ SQL-Based Transformation (skyhack_code.sql)

* **Aggregation & Cleansing**: Passenger totals, baggage counts, SSR volumes
* **Data Integration**: Joins 5 datasets into one unified source
* **Metric Calculation**: Load factor, transfer ratio, delay duration, etc.
* **Complexity Scoring**: Proprietary algorithm assigns **difficulty_score** and daily rankings

---

## 🛠️ 5. Technical Implementation

* **Data Transformation** → SQL (aggregation, cleaning, calculations)
* **Frontend** → HTML5 + Tailwind CSS (clean, utility-first design)
* **Data Visualization** → Chart.js (interactive, real-time graphs)
* **Client-Side Logic** → Modern JavaScript (ES6) for filtering and interactivity

---

## ✅ 6. Conclusion & Impact

The **SkyHack 3.0 Dashboard** provides:

* A **360° operational view** of daily ground handling activities
* **Intuitive data presentation** for quick decision-making
* Transition from **reactive troubleshooting** → **proactive strategy**

🌐 **Try the live dashboard here:** [https://navneetsinghl9.github.io/skyhack_3.0/](https://navneetsinghl9.github.io/skyhack_3.0/)

**Benefits:**

* Reduced delays
* Optimized resource allocation
* Improved passenger satisfaction
* Enhanced overall operational efficiency

---

## 👨‍💻 Team Deadline Dominators

* **Navneet Singh**
* **Pratyush Senhi**

🔗 **Live Demo:** [SkyHack 3.0 Website](https://navneetsinghl9.github.io/skyhack_3.0/)

