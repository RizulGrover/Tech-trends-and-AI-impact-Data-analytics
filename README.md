# Technology Trends & Emerging Tech Landscape Analytics

This repository contains a comprehensive data analytics and engineering project focused on understanding how modern technologies—particularly AI, automation, and evolving software ecosystems—are influencing jobs, skills, and workforce dynamics.

The project is designed as a **full analytics system**, not a standalone dashboard or a single exploratory analysis. It follows a structured pipeline that begins with automated data collection, continues through centralized storage and multi-layered data cleaning, and culminates in SQL- and Python-driven analysis feeding story-based dashboards.

A core principle of this project is that meaningful insights depend on **how data is collected, prepared, validated, and analyzed**, not just on how it is visualized. For this reason, significant emphasis is placed on automation, reproducibility, and clear documentation at every stage of the workflow.

---

## Key Highlights

- **Fully automated multi-source data acquisition**  
  All datasets are collected programmatically using Python scripts. This includes CSV downloads, ZIP archive extraction, Kaggle dataset retrieval, and web scraping. The acquisition layer also performs automatic directory creation to ensure a consistent and reproducible data layout.

- **Integration of heterogeneous real-world datasets**  
  The project combines datasets originating from surveys, job postings, public repositories, Kaggle, web platforms, and international organizations. Each source is ingested using a method appropriate to its format and access constraints.

- **Centralized analytics using Google BigQuery**  
  Google BigQuery is used as the primary data warehouse. Raw datasets are stored in a separate dataset collection, while cleaned and analysis-ready tables are maintained in a dedicated project dataset. This separation ensures clarity between raw inputs, transformed data, and analytical outputs.

- **Programmatic BigQuery API integration**  
  A custom BigQuery engine is implemented using the BigQuery API to manage authentication, query execution, and table creation. This enables SQL queries and analytical workflows to be executed directly from Python scripts and notebooks without manual interaction with the BigQuery UI.

- **Automated SQL- and Python-based data cleaning pipelines**  
  Data cleaning and transformation are handled through version-controlled SQL and Python scripts. Large and structured datasets are cleaned directly in BigQuery using SQL, while Python (Pandas) is used for datasets requiring more flexible or custom logic.  
  Selected datasets are also cleaned using Excel and Power Query to demonstrate transparent, step-by-step transformation workflows.

- **Dashboard-driven analytical workflow**  
  Analysis is organized around dashboards rather than isolated queries. For each dashboard, complex SQL queries are written to generate analytical views, Python scripts execute and post-process these queries using the BigQuery engine, and the resulting tables are written back to BigQuery.

- **Seamless Power BI integration**  
  Power BI is connected directly to the project’s BigQuery dataset, providing access to raw data, cleaned datasets, and fully processed analytical tables through a single connection. This allows dashboards to be built on stable, pre-computed data models rather than ad-hoc transformations.

- **Story-oriented dashboard design**  
  The project contains seven dashboards structured as a narrative sequence, where each dashboard builds on insights from the previous one. Python-generated visuals are also incorporated where Power BI’s native visuals are insufficient.

---

## Project Objective

The objective of this project is to create a unified and consistent analytical view of technology and workforce trends by integrating multiple datasets that are typically analyzed in isolation.

Rather than focusing on a single metric or domain, the project aims to:

- Examine how emerging technologies influence job demand, skill requirements, and role stability  
- Compare workforce signals across time, geography, experience levels, and job categories  
- Connect micro-level signals (job postings, skills, layoffs) with macro-level indicators (unemployment data)  
- Enable structured, repeatable analysis grounded in well-prepared data  

Dashboards are treated as **outputs of analysis**, ensuring that insights are derived from validated and reproducible transformations rather than manual or ad-hoc exploration.

---

## Analytical Scope

The analytical scope of the project spans multiple interconnected domains, including:

- Technology job markets and hiring signals  
- Developer roles, skills, and ecosystem trends  
- Layoff patterns across companies and industries  
- AI and automation exposure across occupations  
- Employment and unemployment indicators  

These domains are intentionally analyzed together to enable cross-cutting questions, such as how skill demand aligns with AI exposure, or how workforce contraction signals relate to broader employment trends.

---

## Datasets and Sources

The project integrates **seven datasets**, each sourced independently and differing in structure, size, and format:

- **Stack Overflow Developer Survey (2020, 2025)**  
  Downloaded as ZIP files using automated scripts and extracted programmatically.

- **Luke Tech Jobs Posting Dataset (2024)**  
  Collected from a publicly shared Google Drive link and downloaded automatically using Python scripts.

- **AI Impact on Jobs (2030)**  
  Sourced from Kaggle and downloaded programmatically using `kagglehub`.

- **Layoffs Dataset**  
  Sourced from Kaggle and downloaded programmatically using `kagglehub`.

- **Remote Job Postings (RemoteOK)**  
  Collected via web scraping using a custom Python script.

- **World Bank Unemployment Data**  
  Downloaded as ZIP archives and extracted programmatically using Python scripts.

Each dataset is ingested in raw form and then processed through dataset-specific cleaning pipelines before being used for analysis.

---

## Technologies and Tools

The project uses a combination of tools selected based on **scale, reproducibility, and suitability**, rather than convenience.

### Programming and Processing
- **Python** for automation, orchestration, data processing, and analysis  
- **Pandas** for custom transformations and post-query processing  

### Data Storage and Querying
- **Google BigQuery** as the centralized data warehouse  
- **BigQuery SQL** for large-scale cleaning, transformation, deduplication, and analysis  

### Data Cleaning and Transformation
- **SQL (BigQuery)** for scalable, reproducible transformations  
- **Python (Pandas)** for flexible and custom cleaning logic  
- **Excel & Power Query** for transparent, step-by-step transformations on selected datasets  

### Analysis and Visualization
- **SQL + Python** for dashboard-specific analytical processing  
- **Power BI** for interactive dashboards connected directly to BigQuery  
- **Python-based visualizations** integrated where Power BI’s native visuals are insufficient  

---

## Project Approach

The project follows a structured, real-world analytics workflow:

1. Data is collected programmatically from multiple external sources  
2. Raw data is stored centrally in BigQuery  
3. Cleaning and transformation are performed using multiple pipelines based on dataset characteristics  
4. Analytical queries are written to support specific dashboard narratives  
5. Analysis results are materialized back into BigQuery  
6. Dashboards are built on top of stable, analysis-ready tables  

The sections that follow document each part of this workflow in detail, beginning with automated data acquisition.

## 📂 Project Structure

The repository is organized to reflect a real-world, end-to-end analytics and data engineering workflow. Each top-level directory corresponds to a distinct stage in the pipeline, with important subdirectories highlighted to show how responsibilities are separated without overwhelming the reader.

```text
.
├── analysis/
│   ├── notebooks/          # Dashboard-specific analysis notebooks
│   └── sql/                # SQL queries organized by dashboard
│
├── dashboards/
│   ├── python script visuals/   # Python scripts for custom visuals
│   └── Complete_Dashboard.pbix  # Final Power BI dashboard
│
├── data/
│   ├── raw/                # Raw datasets from all external sources
│   └── cleaned/            # Cleaned, analysis-ready datasets
│
├── src/
│   ├── data_acquisition/   # Automated data ingestion logic
│   │   ├── config/         # Source configuration files
│   │   └── scripts/        # Downloading and scraping scripts
│   │
│   ├── data_cleaning/      # SQL- and Python-based cleaning pipelines
│   │   ├── BigQuery Scripts/
│   │   └── python scripts/
│   │
│   └── engines/            # Reusable BigQuery engine and utilities
│
├── docs/
│   ├── cleaning_pipeline_bigquery/   # BigQuery cleaning screenshots
│   ├── cleaning_pipeline_powerquery/ # Power Query step-by-step visuals
│   └── project_documentation_files/  # GIFs, demos, and workflow screenshots
│
├── projectvenv/            # Local Python virtual environment
├── .env                    # Environment variables (excluded from version control)
├── requirements.txt        # Python dependencies
└── README.md               # Project documentation
```


## Project flow preview snippets
#### (Final Project flow is documented in later sections)
#### Some visuals :

1. Cleaning Script

![Cleaning Demo](docs\project_documentation_files\data_acquisition\download_script_cut.gif)

2. Bigquery Demo

![BigQuery Demo](docs\project_documentation_files\data_cleaning\big_query_cleaning_final.gif)

3. Dashboard Demo

![Dashboard Demo](docs\project_documentation_files\dashboards\dashboard_video.gif)




## 🧩 Data Acquisition

The data acquisition layer is designed as a fully automated, script-driven system that ingests datasets from multiple heterogeneous public sources. Instead of manual downloads or ad-hoc data pulls, the project emphasizes reproducibility, traceability, and safe re-execution from the very first stage of the pipeline.

All datasets are ingested in their original raw form. No filtering, transformation, or enrichment is performed during acquisition, ensuring a clear separation between ingestion and downstream processing.

Automated ## 🧩 Data Acquisition

The acquisition process supports multiple source types, including direct file downloads, compressed archives, Kaggle datasets, and live web scraping. Each ingestion method is implemented via a dedicated script while following a consistent storage strategy.

The entire process is engineered to be idempotent, allowing scripts to be safely re-run without duplicating data or requiring manual cleanup.

### 📦 Data Sources Covered

The acquisition pipeline ingests data from the following sources:

Stack Overflow Developer Surveys (2020 & 2025) — ZIP archives downloaded and extracted programmatically

World Bank Unemployment Data — ZIP-based dataset downloaded and extracted via script

Luke Tech Jobs Dataset (2024) — Job postings downloaded automatically from a public Google Drive link

AI Impact on Jobs (2030) — Kaggle dataset downloaded using kagglehub

Tech Layoffs Dataset — Kaggle-hosted dataset downloaded using kagglehub

Remote Tech Job Postings — Live job data scraped from the RemoteOK website

Each source is handled using an ingestion strategy appropriate to its access mechanism.

### 🧭 Configuration-Driven Ingestion

Dataset source information is centralized using configuration files rather than hardcoded into scripts. This includes download URLs for CSV and ZIP-based datasets and identifiers for Kaggle-hosted datasets.

This design allows sources to be updated or extended without modifying core ingestion logic.

### 🛠️ Acquisition Scripts

Data ingestion is executed through three dedicated scripts:

Bulk Download Script — Handles CSV and ZIP downloads, including Stack Overflow surveys, World Bank data, and Google Drive-hosted datasets

Kaggle Download Script — Uses kagglehub to download Kaggle datasets without local credentials

Web Scraping Script — Scrapes technology job postings from the RemoteOK website and stores them in CSV format

Together, these scripts fully cover all external data sources used in the project.

### 📁 Directory Management and Extraction

All scripts automatically create required directories if they do not exist. ZIP files are both retained and extracted automatically, preserving source fidelity while enabling downstream processing.

### 🔁 Web Scraping and Re-Run Safety

The web scraping pipeline supports incremental updates by appending new records while skipping previously captured entries. Across all acquisition scripts, existing files are detected and skipped with informative messages, making the entire process safe to re-run.

### 📤 Output of the Acquisition Layer

After acquisition completes:

All raw datasets are available under the data/raw directory

Data is organized by source and format

No cleaning or transformation is applied at this stage

These raw datasets serve as the input for subsequent data cleaning and analytical workflows.



## 🏗️ Data Storage and BigQuery Integration

To support scalable analysis and seamless BI integration, the project uses Google BigQuery as a centralized data warehouse. All downstream processing, analysis, and visualization workflows are built on top of BigQuery, ensuring consistency, performance, and reproducibility.

A clear separation is maintained between raw data ingestion and cleaned, analysis-ready datasets.

### 🗄️ Warehouse Architecture

The BigQuery setup follows a two-layer architecture:

Raw Data Project
Contains unmodified datasets uploaded directly after acquisition. These tables preserve original structure and serve as the immutable source of truth.

Analytics Project (Cleaned & Derived Data)
Contains cleaned datasets and all analysis- and dashboard-specific tables. This project is the single source connected to Power BI.

This separation ensures that raw data remains untouched while allowing iterative cleaning, transformation, and analysis without risk of data loss.

### 🔐 Authentication and API Access

Programmatic access to BigQuery is handled via the BigQuery API:

A dedicated service account JSON key is used for authentication.

The key path is stored securely using a .env file.

Python scripts authenticate via the BigQuery client library.

This setup allows both local execution and cloud-based execution of scripts without manual intervention.

### 🧠 BigQuery Engine Abstraction

A reusable BigQuery engine is implemented to abstract warehouse interactions from business logic. The engine supports:

Executing SQL queries

Reading query results into Pandas DataFrames

Writing DataFrames back to BigQuery

Replacing or updating existing tables

This engine is primarily used by analysis scripts and notebooks, enabling automated query execution and table creation directly from Python.

## 🧹 Data Cleaning Architecture

Data cleaning is intentionally performed using three complementary approaches, each selected based on the nature of the dataset and the type of transformation required. This multi-modal approach reflects real-world analytics workflows and demonstrates flexibility across tools.

### 🧮 SQL-Based Cleaning (BigQuery)

SQL is used as the primary cleaning mechanism for large datasets stored in BigQuery. Dedicated SQL scripts are written per dataset and executed directly in BigQuery (with optional execution via the Python engine).

Typical operations include:

Null handling

Deduplication

Column standardization and mapping

Outlier treatment

Data type normalization

Each cleaning script produces a new cleaned table, leaving raw tables unchanged.

### 🐍 Python (Pandas) Cleaning and Transformation

Python is used for transformations that are difficult or verbose in SQL, including:

Column explosion and restructuring

Regex-based parsing

Complex feature creation

Supplemental data cleaning logic

Cleaned outputs are written back to BigQuery as new tables, making them immediately available for analysis and visualization.

### 📊 Power Query / Excel Cleaning

Power Query and Excel are used selectively for specific datasets to demonstrate proficiency in BI-oriented data preparation. These pipelines focus on:

Stepwise, documented transformations

Feature engineering

Readability and traceability of cleaning logic

Final outputs are exported as CSV files and uploaded to BigQuery, where they join the rest of the analytics workflow.

### 🔄 Raw-to-Clean Data Flow

The overall data flow follows a strict and transparent pattern:

Raw datasets are uploaded to BigQuery without modification

Cleaning logic creates new, cleaned tables

Analysis and dashboard tables are derived from cleaned data only

At no point are raw tables overwritten or altered.

### 🎯 Power BI Integration Boundary

Power BI connects exclusively to the cleaned and derived tables in BigQuery. Data manipulation inside Power BI is intentionally limited and primarily includes:

Calculated measures

Light column derivations

Visualization-specific transformations

All major cleaning, transformation, and analytical logic is performed upstream, ensuring Power BI functions strictly as a visualization and storytelling layer. Some visuals leverage embedded Python scripts where native Power BI visuals are insufficient.



## 📐 Analytical Workflow and Dashboard-Driven Analysis

The analytical layer of this project is designed around a dashboard-first, question-driven workflow. Rather than performing generic exploratory analysis, each analytical step is guided by the requirements of specific dashboards and the insights they aim to convey.

Analysis is performed upstream using SQL and Python, with Power BI acting as the final visualization and storytelling layer.

### 📖 Dashboard Storyline

The project consists of seven dashboards arranged in a deliberate narrative sequence, moving from current market demand to long-term skill and risk considerations:

Tech Jobs Dataset: Demand, Roles and Market Heat
Overview of current technology job demand, role distribution, and market concentration.

Stack Overflow 2025: Talent, Experience, Pay & Satisfaction
Analysis of developer demographics, experience levels, compensation, and job satisfaction.

Stack Overflow 2025: Work Type, Salary and Preferences
Focused analysis on remote work, employment type, salary patterns, and developer preferences.

Stack Overflow 2025 vs 2020: Key Overall Differences
Comparative analysis highlighting shifts in skills, compensation, and work patterns over time.

Layoffs Scenario
Examination of layoff trends across companies, industries, and time periods.

Job Risk and AI Impact – 2030
Forward-looking analysis assessing job risk in relation to AI adoption and automation potential.

AI: Top Skills and Compensation by Usage
Analysis of AI tool usage, skill demand, and associated compensation trends.

Each dashboard addresses a distinct analytical question while contributing to an overarching narrative about the evolving technology job landscape.

### 🧾 SQL-Driven Analysis

For each dashboard, a dedicated set of SQL queries is authored and organized within dashboard-specific folders. These queries are written to support complex analytical requirements that go beyond simple visual-level transformations.

SQL is used extensively for:

Multi-table joins across large datasets

Window functions and Common Table Expressions (CTEs)

Conditional logic using CASE statements

Aggregations and grouping logic

Complex unions and derived table creation

Query outputs are designed to directly support one or more visuals within a given dashboard.

### 🔗 Python-Orchestrated Processing

Python is used as an orchestration and transformation layer on top of SQL-based analysis. Analysis scripts:

Read SQL queries from their respective dashboard folders

Execute queries using the BigQuery engine

Load results into Pandas DataFrames

Apply additional processing where required

Typical Python-based operations include:

Column explosion and restructuring

Regex-based parsing and mapping

Sorting, ranking, grouping, and pivoting

Supplemental transformations better suited to Pandas than SQL

Final analytical outputs are written back to BigQuery as dashboard-specific tables.

### 🧱 Clean vs Derived Analytical Tables

A clear distinction is maintained between reusable cleaned datasets and dashboard-specific derived tables:

Cleaned tables serve as stable, reusable analytical foundations

Derived tables are created on demand to support specific dashboards and visuals

This approach enables flexibility in analysis while preserving a consistent, trusted data foundation.

### 🖥️ Power BI as the Visualization Layer

Power BI connects exclusively to BigQuery, consuming both cleaned base tables and derived analytical tables generated during the analysis phase. Data manipulation within Power BI is intentionally limited and primarily includes:

Calculated measures

Light column derivations

Visualization-specific adjustments

All complex analytical logic is handled upstream to ensure clarity, performance, and reproducibility.

### 📈 Python Visuals in Power BI

Certain visuals, such as heatmaps and regression plots, are not natively supported in Power BI. For these cases, Python-based visuals are embedded directly within Power BI reports.

The corresponding Python scripts are stored under the /dashboards/python script visuals directory and are version-controlled alongside the rest of the project.


## 🧭 Project Flow (End-to-End Demonstration)

This section demonstrates the complete execution flow of the project using selective screenshots and short screen recordings.
The goal is to show how data moves through the system end-to-end, rather than documenting every script exhaustively.

---

### ⚙️ Step 1: Automated Data Acquisition

**What is demonstrated**
- Execution of a data download script
- Automated extraction of datasets
- Creation of raw data directories

![Data acquisition demo](## 🧭 Project Flow (End-to-End Demonstration)

This section demonstrates the complete execution flow of the project using selective screenshots and short screen recordings.
The goal is to show how data moves through the system end-to-end, rather than documenting every script exhaustively.

---

### ⚙️ Step 1: Automated Data Acquisition

**What is demonstrated**
- Execution of a data download script
- Automated extraction of datasets
- Creation of raw data directories

![Data acquisition demo](docs\project_documentation_files\data_acquisition\download_script_cut.gif)

---

### 🧹 Step 2: Data Cleaning & Transformation

**What is demonstrated**


- Power Query transformation steps

![Power Query steps1](docs\project_documentation_files\data_cleaning\AI_impact_data\pq_full_steps.png)
![Power Query steps2](docs\project_documentation_files\data_cleaning\layoffs_data\pq_total_steps.png)


- SQL-based data cleaning in BigQuery

![SQL cleaning](docs\project_documentation_files\data_cleaning\big_query_cleaning_final.gif)


- Python (Pandas) data cleaning scripts

![Python cleaning](docs\project_documentation_files\data_cleaning\python_cleaning_final.gif)


---

### 🧠 Step 3: BigQuery Engine Abstraction

**What is demonstrated**
- BigQuery engine responsible for query execution and table management

![BigQuery engine abstraction](docs\project_documentation_files\engine\engine_script.png)

---

### 🧾 Step 4: Analysis - SQL Execution via Python Orchestration

**What is demonstrated**
- SQL script example

![SQL script](docs\project_documentation_files\data_analysis\part1_analysis_sql.png)


- SQL files executed through Python

![SQL execution via Python](docs\project_documentation_files\data_analysis\part2_analysis_final.gif)


- Analytical tables written back to BigQuery

![Back to bigquery](docs\project_documentation_files\data_analysis\part3_analysis_sql_query_reading_and_updating_to_bigquery.png)

---

### 🎯 Step 5: Power BI ↔ BigQuery Integration

**What is demonstrated**
- Power BI connected directly to BigQuery
- Selection of cleaned and derived tables
- Successful dataset refresh

![Power BI BigQuery connection](docs/screenshots/powerbi_integration/bq_connection.png)
![Dataset selection](docs/screenshots/powerbi_integration/dataset_tables.png)

---

### 📊 Step 6: Dashboard Output Demonstration

**What is demonstrated**
- One complete dashboard
- Interactive filters and visuals

![Dashboard demo](docs/demos/step6_dashboard_demo.gif)
)

---

### 🧹 Step 2: Data Cleaning & Transformation

**What is demonstrated**
- SQL-based data cleaning in BigQuery
- Python (Pandas) data cleaning scripts
- Power Query transformation steps

![SQL cleaning](docs/screenshots/data_cleaning/sql_cleaning.png)
![Python cleaning](docs/screenshots/data_cleaning/python_cleaning.png)
![Power Query steps](docs/screenshots/data_cleaning/power_query_steps.png)

---

### 🧠 Step 3: BigQuery Engine Abstraction

**What is demonstrated**
- BigQuery engine responsible for query execution and table management

![BigQuery engine abstraction](docs/screenshots/bigquery_engine/engine_script.png)

---

### 🧾 Step 4: SQL Execution via Python Orchestration

**What is demonstrated**
- SQL files executed through Python
- Analytical tables written back to BigQuery

![SQL execution via Python](docs/demos/step4_sql_execution.gif)

---

### 🎯 Step 5: Power BI ↔ BigQuery Integration

**What is demonstrated**
- Power BI connected directly to BigQuery
- Selection of cleaned and derived tables
- Successful dataset refresh

![Power BI BigQuery connection](docs/screenshots/powerbi_integration/bq_connection.png)
![Dataset selection](docs/screenshots/powerbi_integration/dataset_tables.png)

---

### 📊 Step 6: Dashboard Output Demonstration

**What is demonstrated**
- One complete dashboard
- Interactive filters and visuals

![Dashboard demo](docs/demos/step6_dashboard_demo.gif)




## 📊 Dashboards and Analytical Outputs

The dashboards represent the final analytical layer of this project. All upstream steps—data acquisition, warehousing, cleaning, and analysis—are designed to support these outputs. Each dashboard addresses a specific analytical question, and together they form a coherent storyline around the present and future state of the technology job market.

All dashboards are built in Power BI and source data exclusively from Google BigQuery, consuming both cleaned base tables and dashboard-specific analytical tables generated using SQL and Python.

1. Tech Jobs Dataset: Demand, Roles and Market Heat

This dashboard provides a high-level view of the current technology job market. It focuses on hiring demand, role distribution, and market concentration to establish a baseline understanding of where hiring activity is strongest.

By aggregating large-scale job posting data, the dashboard highlights dominant roles, demand intensity, and areas of concentration across the market. This serves as the entry point for the overall analysis and sets context for deeper skill-, compensation-, and risk-based exploration in later dashboards.

2. Stack Overflow 2025: Talent, Experience, Pay & Satisfaction

This dashboard analyzes developer demographics and career outcomes using Stack Overflow’s 2025 survey data. It examines how experience levels relate to compensation and how both factors align with reported job satisfaction.

Rather than viewing salary in isolation, the dashboard contextualizes pay alongside experience and satisfaction, offering a more complete picture of workforce outcomes in the technology sector.

3. Stack Overflow 2025: Work Type, Salary and Preferences

This dashboard focuses on employment structure and developer preferences, including remote work, hybrid arrangements, and employment type. It explores how different work models correlate with compensation patterns.

By comparing work preferences against actual employment conditions and salary distributions, the dashboard provides insight into how flexibility, compensation, and work structure intersect in modern technology roles.

4. Stack Overflow 2025 vs 2020: Key Overall Differences

This dashboard provides a longitudinal comparison between Stack Overflow survey data from 2020 and 2025. It highlights shifts in skills, compensation, work patterns, and overall developer demographics over time.

The comparison introduces temporal context, allowing observed trends to be interpreted as part of broader structural changes rather than isolated, year-specific outcomes.

5. Layoffs Scenario

This dashboard examines layoffs across the technology sector to provide context around market volatility and contraction. It analyzes layoff patterns across companies, industries, and time periods.

By incorporating layoff data into the broader narrative, this dashboard balances demand- and compensation-focused analysis with indicators of market instability and risk.

6. Job Risk and AI Impact – 2030

This dashboard shifts the analysis toward future workforce risk by assessing job roles in relation to AI adoption and automation potential. It evaluates relative exposure to disruption across roles and job categories.

The analysis provides a forward-looking perspective, highlighting areas of potential vulnerability as well as roles that may be more resilient in an AI-driven future.

7. AI: Top Skills and Compensation by Usage

This dashboard examines AI-related skill adoption and its relationship with compensation. It analyzes which AI tools and skills are most commonly used and how usage frequency aligns with salary outcomes.

By linking skill usage with compensation patterns, the dashboard highlights which AI competencies are currently associated with higher market value.

## 🎨 Visualization Approach

Power BI serves as the primary visualization and storytelling layer for the project. Data manipulation within Power BI is intentionally limited to calculated measures and light transformations, with all complex analytical logic handled upstream.

For visualizations not natively supported in Power BI—such as heatmaps and regression plots—Python-based visuals are embedded directly into the dashboards. These scripts are version-controlled and integrated as part of the analytical workflow.