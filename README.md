# 🌍 Technology Trends & Emerging Tech Landscape Analytics

This project focuses on understanding how technology, automation, AI adoption, and global economic shifts are impacting jobs, skills, demand, and workforce transformation. By combining multiple datasets, APIs, scraping scripts, and analytical pipelines, the project aims to:

- Identify **which industries are growing or shrinking**
- Analyze **AI automation risk across job categories**
- Study **layoff patterns across geography, time, and sector**
- Examine **global unemployment trends**
- Understand **reskilling strategies and future skill demand**

This serves as a real-world data engineering + analytics + ML portfolio project.

---

## 🧭 Project Phases (End-to-End Roadmap)

| Phase | Description | Status |
|-------|------------|--------|
| **Phase 1 — Data Acquisition** | Gathering datasets from scraping, APIs, downloads | ✔ Completed |
| **Phase 2 — Data Cleaning** | Excel + SQL + Pandas Cleaning Pipelines | 🟡 In Progress |
| **Phase 3 — Analytics & Insights** | Exploratory + Business insights | ⏳ Upcoming |
| **Phase 4 — Dashboards** | Excel + Power BI + Interactive visuals | ⏳ Upcoming |
| **Phase 5 — ML & NLP Models** | Forecasting, trend prediction, text analytics | ⏳ Later |
| **Phase 6 — Automation & APIs** | FastAPI endpoints for serving insights | ⏳ Later |
| **Phase 7 — Final Reporting** | Strategy recommendations + storytelling | ⏳ Final Stage |

---

## 📦 Phase 1 — Data Acquisition (Completed)

Data was collected using **three different acquisition methods**, demonstrating versatility in real-world workflows:

| Source | Method | What was received |
|--------|--------|------------------|
| RemoteOK | Web Scraping + JSON API | Live job listings (role, tags, company, date) |
| Luke Tech Job Dataset | Public dataset | ~478K tech job postings |
| Layoffs Dataset | Public dataset | Layoffs by company, country, counts |
| AI Impact on Jobs 2030 | Research dataset | Risk & automation impact |
| Stack Overflow Developer Survey | Public dataset | Skill usage, trends, education |
| World Bank Indicators | Download/API | Country unemployment % over decades |

### ✔ Work Completed in Phase 1

- `Python + Requests` used for programmatic scraping of RemoteOK jobs  
- Duplicate handling logic implemented to **append only new rows**  
- Raw and cleaned data folder structure established (`/data/raw/` `/data/clean/`)  
- Multiple dataset formats handled: JSON, CSV, Excel, API responses  
- Data stored for **future time-series trend tracking**  
- Documented purpose and design for each dataset  

> Phase 1 establishes the data foundation needed for analysis, forecasting, and ML.

---

## 🧹 Phase 2 — Data Cleaning & Preparation  

To demonstrate real-world ETL capability across multiple tools, this project uses **three different cleaning pipelines** depending on dataset size, structure, and analytical purpose:

| Pipeline | Tool | Purpose |
|----------|------|---------|
| Pipeline 1 | Excel + Power Query | Business-user workflows, documentation-ready |
| Pipeline 2 | SQL (BigQuery) | Relational, join-driven cleaning |
| Pipeline 3 | Python Pandas | Large-scale + automated transformations |

---

# 🧼 Cleaning Pipeline 1 — Excel + Power Query  
**Tools:** Microsoft Excel, Power Query  
**Objective:** Clean small-to-medium sized business datasets suitable for analyst workflows and dashboard consumption.

This pipeline was used to clean:

| Dataset | Size |
|--------|------|
| Layoffs Data | ~3600 rows |
| AI Impact on Jobs by 2030 | ~3000 rows |

---

## ✔ Dataset 1 — Layoffs Data Cleaning (Completed)

**Goal:** Prepare dataset for layoff trends, country-wise impact, industry patterns, and severity metrics.

### Transformations Applied (Power Query)

| Step | Description |
|------|------------|
| Removed redundant columns | Removed fields not required for analytical value |
| Trimmed textual fields | Cleaned whitespace in Company, Location, Industry |
| Standardized date structure | Split timestamp, retained date only |
| Created new calculated field | `Layoff Ratio = Laid_Off_Count / Total_Workforce` |
| Converted ratio to percentage | Enables comparison across companies |
| Filtered null or empty percentage rows | Removed incomplete data |
| Screenshot documentation | Captured Power Query `Applied Steps` panel |

📁 Screenshots stored: `/docs/cleaning_pipeline_1_powerquery/layoffs/`  
📄 Cleaned file saved: `/data/clean/layoffs_clean.csv`

### Why this matters
- Enables **time-series analysis of layoffs**
- Normalized metrics allow **fair comparisons**
- Dataset becomes ready for **Power BI dashboards & pivot tables**
- Practical alignment with **real business analyst cleaning practices**

---

## ✔ Dataset 2 — AI Impact on Jobs by 2030 (Completed)

**Goal:** Measure multi-factor job disruption risk through AI exposure, automation, skill readiness, and tech growth.

### Transformations Applied (Power Query)

| Step | Description |
|------|------------|
| Trimmed data fields | Cleaned whitespace in text columns |
| Added `avg_skill_score` | Average of Skill_1 through Skill_10 |
| Removed Skill_1 – Skill_10 columns | Retained only calculated skill index to simplify dataset |
| Created `final_job_risk_score` | Weighted composite score combining four predictors |
| Added `risk_category` (conditional column) | Classified roles into risk buckets for dashboards |

### Formula for Composite Job Risk Score

A weighted model was developed:

Final Job Risk Score =
(0.40 × Automation_Probability_2030) +
(0.20 × AI_Exposure_Index) +
(0.25 × (1 − Avg_skill_score)) +
(0.15 × (1 − Tech_Growth_Factor))


- Higher automation probability increases risk  
- Higher AI exposure increases disruption probability  
- Higher skill readiness reduces risk  
- Higher growth sectors reduce risk  

### Risk Binning Applied

| Score Range | Category |
|------------|----------|
| 0.00 – 0.20 | Very Low |
| 0.21 – 0.40 | Low |
| 0.41 – 0.60 | Medium |
| 0.61 – 0.80 | High |
| 0.81 – 1.00 | Very High |

📁 Screenshots stored: `/docs/cleaning_pipeline_1_powerquery/ai_impact/`  
📄 Cleaned file saved: `/data/clean/ai_impact_clean.csv`

### Why this matters
- The model translates **raw complexity into actionable insights**
- Adds **AI-readiness & automation-risk score** for ML and dashboards
- Enables **policy-level and reskilling strategy discussion**
- Creates a **KPI usable for visualization and risk heatmaps**

---

## 🎯 Summary of Pipeline 1 Outcomes

| Dataset | Cleaned | New Metrics Added | Ready for |
|--------|--------|------------------|-----------|
| Layoffs | ✔ | % Layoff Impact | Time-series & Geography BI |
| AI Impact | ✔ | Skill Index + Final Job Risk Score + Risk Buckets | Risk dashboards, ML |

Power Query not only performed cleaning but also **feature engineering**, converting raw data into meaningful analytical attributes.

---

## 🧼 Cleaning Pipeline 2 — BigQuery SQL (Completed)

### ✔ Dataset — World Bank Unemployment Data

**Goals**
- Convert wide CSV (columns = years) into long format
- Standardize country names
- Remove aggregate regions (not countries)
- Export cleaned version for ML & dashboards

### SQL Cleaning Script (saved in repo)

📄 Saved at:  
`/src/data_cleaning/scripts/bigquery/worldbank_cleaning.sql`

📁 Screenshots stored at:  
`/docs/cleaning_pipeline_bigquery/worldbank_data/`

### Output File
Download via Cloud Storage → export locally at:
`/data/cleaned`

