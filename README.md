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
### 🧼 Why multi–pipeline cleaning?

This project showcases proficiency in **three different ETL skillsets**:

| Pipeline | Tool | Best For |
|---------|------|----------|
| Pipeline 1 | Excel + Power Query | Business analyst workflows |
| Pipeline 2 | SQL (BigQuery) | Structured / relational datasets |
| Pipeline 3 | Python Pandas | Large-scale & automated processing |

---

### 🧼 **Cleaning Pipeline 1 — Excel + Power Query**  
**Dataset:** Layoffs (≈3600 rows)  
**Goal:** Prepare dataset for layoff trends, geography impact, industry insights, and ratio analysis.

#### 🔧 Transformations Performed

| Step | Detail |
|------|-------|
| Removed Unnecessary Columns | Removed fields that do not support analysis |
| Trimmed Text Fields | Cleaned whitespace for Company, Location, Industry |
| Standardized Formats | Date split and normalized |
| Created Custom Column | Layoff Ratio: Laid_off_count / Total_workforce |
| Percentage Conversion | Ratio converted to % employees impacted |
| Removed Null Values | Filtered rows where percentage was blank |
| Documentation | Screenshot of Power Query “Applied Steps” captured |

📁 Screenshots:  
`/docs/cleaning_pipeline_1_powerquery/`

📄 Cleaned dataset saved:  
`/data/clean/layoffs_clean.csv`

#### 🎯 Why this cleaning matters

- **Standardized values enable accurate filtering**
- **Percentage column unlocks deeper comparisons**
- **Removes noise and missing data**
- **Prepares dataset for Pivot tables & Power BI**

This aligns with real-world business analytics expectations.

---

## 🔜 Next Steps

### 🧼 Cleaning Pipeline 2 — SQL (BigQuery)
Planned operations:

- Handle missing country values (unemployment dataset)
- Normalize country names across datasets
- Join unemployment + job demand datasets
- Extract year and economic cycles patterns

### 🧼 Cleaning Pipeline 3 — Python (Pandas)
- Process large datasets (Luke + scraped RemoteOK)
- Extract skills from job titles & tags
- Prepare features for ML forecasting

---

