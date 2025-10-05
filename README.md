SkyHack Challenge
Team: Deadline Dominators
A data analysis project by Navneet Singh and Pratyush Senhi for the SkyHack Challenge.

1. Introduction
This project provides a robust data pipeline built in SQL to analyze and predict the operational difficulty of airline flight turnarounds. By processing five distinct raw data sources, the script calculates a custom difficulty_score for each flight, allowing for proactive resource allocation and operational planning.
The final output ranks each flight by its predicted difficulty and classifies it as 'Easy', 'Medium', or 'Difficult', providing an at-a-glance tool for ground operations teams.

2. The Solution: A SQL-Powered Pipeline
The core of this project is a single, clean SQL script that performs the entire data transformation and analysis process. The script is designed to be easy to run and understand, using temporary tables to logically separate each step of the process.

Our Methodology
The analysis follows a clear, step-by-step methodology:
Aggregate Passenger Data: The first step correctly calculates the total number of passengers for each unique flight, handling complexities like single bookings (PNRs) with multiple passengers.
Aggregate Baggage Data: It then processes bag-level data to count the total number of bags, as well as segmenting them into Transfer and Origin bags.
Aggregate Special Service Requests (SSRs): The script joins PNR data to count the number of special service requests (like wheelchairs or unaccompanied minors) associated with each flight.
Combine and Calculate Metrics: All the aggregated data is joined back to the main flight data. Key performance indicators are then calculated, including:
load_factor
bags_per_pax
transfer_ratio
ssr_per_100pax
delay_minutes
Score, Rank, and Classify: Finally, a custom difficulty_score is calculated based on the metrics. Flights are then ranked against others on the same day, and a final difficulty_class is assigned.

3. Data Sources
The analysis is powered by the following five datasets:
flight_level_data.csv
pnr_flight_level_data.csv
bag_level_data_1.csv
pnr_remark_level_data_2.csv
airports_data.csv

5. How to Run the Code
To replicate this analysis, follow these steps:
Set Up a Database: Use a SQL environment that supports temporary tables (like PostgreSQL).
Create Tables: Create five tables in your database with names and schemas that match the columns in the CSV files.
"flight_level_data"
"pnr_flight_level_data"
"bag_level_data_1"
"pnr_remark_level_data_2"
Load Data: Import the data from each CSV file into its corresponding table.
Execute the Script: Run the complete SQL script provided in this repository. The script is self-contained and will produce the final ranked and classified list of flights.

5. Team Members
Navneet Singh
Pratyush Senhi
