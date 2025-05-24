High Level Design Diagram:

![Adventure_Works_DE_Project_Azure drawio](https://github.com/user-attachments/assets/8d661695-4d94-4469-a74f-254472a5e0dd)


🔷 Project Description: End-to-End Modern Data Lakehouse with Azure
This project implements a modern data lakehouse architecture on Azure using a layered approach — Bronze, Silver, and Gold zones — to efficiently ingest, process, store, and visualize data.

The solution integrates GitHub data via HTTP, processes it through Azure Data Factory (ADF) and Databricks, exposes structured data via Azure Synapse serverless SQL pool, and enables business insights through Power BI.

🔁 Data Flow Overview
1. 🟤 Bronze Layer – Raw Ingestion
Source: GitHub API (via HTTP)

Tool: Azure Data Factory (ADF)

Destination: ADLS Gen2 Container – /bronze

Details: ADF pipeline copies raw JSON or CSV data directly into the Bronze layer with minimal processing, serving as a raw immutable store for auditing and reprocessing.

2. 🟠 Silver Layer – Cleansed & Transformed Data
Source: ADLS Bronze

Tool: Azure Databricks

Destination: ADLS Gen2 Container– /silver

Details: Databricks notebooks perform transformation tasks like:

Schema enforcement

Filtering and cleansing

Type casting

Joining with reference data
The result is structured, analytics-ready Parquet data in the Silver zone.

3. 🟡 Gold Layer – Business-Ready Data
Source: ADLS Silver

Tool: Azure Synapse Analytics (serverless SQL pool)

Process:

External tables are created on top of Silver data

Transformed and aggregated views are created for business use

Final tables are stored in /gold

Purpose: Serve curated, high-quality data for reporting and analysis

4. 🔵 Visualization Layer – Insights & BI
Tool: Power BI

Source: ADLS Gold (via Synapse serverless SQL)

Details: Power BI dashboards connect directly to Synapse views and external tables to enable real-time, self-service analytics and visualization of GitHub activity.
