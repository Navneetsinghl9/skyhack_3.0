Team: Deadline Dominators (Navneet Singh & Pratyush Senhi)
Live Demonstration: https://navneetsinghl9.github.io/skyhack_3.0/
1. Problem Statement: The Imperative for Proactive Operations
Airport ground handling represents a significant logistical challenge wherein minor disruptions can propagate throughout the network, leading to substantial financial repercussions and widespread passenger inconvenience. The principal challenge confronting ground operations managers lies in the transition from a reactive to a proactive operational paradigm—moving from addressing delays as they arise to mitigating risks before they materialize. This strategic shift necessitates an analytical tool capable of identifying high-risk flights with precision and immediacy.

2. Proposed Solution: An Actionable Intelligence Hub
The proposed solution is an interactive, real-time dashboard that synthesizes disparate operational data streams into a prioritized, actionable framework. This platform provides a consolidated overview of daily operational complexity, thereby enabling management to strategically identify and allocate resources to flights exhibiting the highest degree of risk.

3. Core Functionalities
Predictive Complexity Score: A proprietary metric engineered to quantify the operational complexity of individual flights. The score is derived from a weighted model incorporating variables such as passenger load, baggage transfer ratios, and the volume of special service requests.

Dynamic Data Filtering: The dashboard features dynamic filtering capabilities, enabling granular data analysis by date, airline, and the calculated difficulty classification.

Real-Time Key Performance Indicators (KPIs): A suite of KPIs provides a real-time summary of critical operational metrics, including total flight volume, average delay duration, and a count of flights classified as 'Difficult', complete with comparative analysis against the preceding day's performance.

Prioritized Action List: A dynamically updated table highlights the ten flights with the highest complexity scores, serving as a primary daily action plan for operational managers.

Advanced Visualizations: Interactive charts facilitate a deeper analytical exploration of the data, illustrating the distribution and trends of flight complexity scores and classifications.

4. Methodology: The Data Pipeline
The solution is underpinned by a robust data processing pipeline responsible for the ingestion, cleansing, aggregation, and enrichment of information from multiple disparate sources. This process culminates in the generation of a final, analysis-ready dataset (skyhack_excel.csv) that powers the dashboard.

Primary Data Sources:

Flight Level Data.csv: Contains core flight schedules, fleet specifications, and scheduled ground times.

PNR Flight Level Data.csv: Provides detailed passenger booking information (PNR).

Bag Level Data (1).csv: Includes specifics on individual baggage items, distinguishing between origin and transfer.

PNR Remark Level Data (2).csv: Details special service requests (SSRs) associated with bookings.

Airports Data (1).csv: Comprises supplementary airport metadata.

SQL-Based Data Transformation:
A comprehensive SQL script (skyhack_code.sql) executes the primary data transformation logic:

Aggregation and Cleansing: Performs accurate calculation of passenger totals (by handling unique PNRs), baggage counts, and SSR volumes for each discrete flight.

Data Integration: Joins the five distinct data sources into a unified, cohesive dataset.

Metric Calculation: Computes essential operational metrics, including load factor, transfer ratio, and delay duration in minutes.

Complexity Scoring and Ranking: Applies the proprietary algorithm to generate the final difficulty_score and subsequently ranks each flight relative to its peers on a daily basis.

5. Technical Implementation
The project was implemented utilizing the following technologies:

Data Transformation: Standard SQL was employed for all data cleansing, aggregation, and metric calculation tasks.

Frontend Development: The dashboard interface was constructed using HTML5 and styled with the Tailwind CSS utility-first framework.

Data Visualization: All graphical representations of data were rendered using the Chart.js library.

Client-Side Logic: Dynamic interactivity and data filtering were implemented using modern JavaScript (ES6).

6. Conclusion and Impact
The resulting dashboard delivers a comprehensive, 360-degree perspective on daily ground operations. By presenting complex data in an intuitive and actionable format, it empowers management to transition from reactive troubleshooting to strategic, data-driven decision-making. This ultimately leads to enhanced operational efficiency, reduced delays, and an improved overall passenger experience.
