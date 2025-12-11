
# Technology Trends & Emerging Tech Landscape Analytics
A comprehensive data engineering, analytics, and machine learning project examining global technology trends and their impact on jobs, skills, industries, and workforce transformation. This project combines multi-source data ingestion, structured ETL pipelines, exploratory analytics, risk modeling, and visualization components.

---

## 1. Project Overview
This project investigates how emerging technologies — including automation, AI systems, cloud adoption, generative AI tools, and industry shifts — are influencing job markets, skill requirements, and economic dynamics. The analysis spans several years of data, multiple global datasets, and varied methodological approaches.

The project integrates:
- Real-time job market data (scraped + API)
- Layoff data across companies and industries
- AI automation impact datasets
- Global unemployment indicators
- Developer ecosystem datasets (Stack Overflow 2020 & 2025)

---

## 2. End-to-End Pipeline Roadmap

| Phase | Description | Status |
|-------|-------------|--------|
| Phase 1 — Data Acquisition | Scraping, APIs, dataset ingestion | Completed |
| Phase 2 — Data Cleaning | Multi-stage SQL, Excel, and Python transformations | Completed (core datasets) |
| Phase 3 — Analysis & Insights | Exploratory and statistical analysis | In Progress |
| Phase 4 — Dashboards | Interactive visualizations (Power BI, Excel) | Upcoming |
| Phase 5 — ML & NLP Modeling | Forecasting, classification, clustering, NLP | Upcoming |
| Phase 6 — API & Automation | FastAPI service layer for insights | Later stage |
| Phase 7 — Final Reporting | Strategic insights & storytelling | Final stage |

---

## 3. Project Structure (Recommended Repository Layout)

```
project_root/
│
├── data/
│   ├── raw/
│   ├── interim/
│   ├── cleaned/
│
├── src/
│   ├── data_cleaning/
│   │   ├── scripts/
│   │   │   ├── stackoverflow_2020/
│   │   │   ├── stackoverflow_2025/
│   │   │   ├── worldbank/
│   │   │   ├── layoffs/
│   │   ├── python_cleaning/
│   │   ├── feature_engineering/
│   │
│   ├── visualization/
│   ├── modeling/
│
├── notebooks/
│   ├── 01_data_cleaning.ipynb
│   ├── 02_eda.ipynb
│   ├── 03_feature_engineering.ipynb
│   ├── 04_modeling.ipynb
│
└── README.md
```

---

## 4. Phase 1 — Data Acquisition

### 4.1 RemoteOK Job Scraping
Collected via:
- HTTP GET requests
- JSON parsing
- Duplicate protection logic  
Used for real-time skill/trend tracking.

### 4.2 Luke Tech Job Dataset
Provided ~478k historical job postings for long-term analysis.

### 4.3 Layoffs Dataset
Includes:
- Company layoffs
- Country
- Industry
- Time-based patterns

### 4.4 AI Impact on Jobs Dataset
Contains:
- Automation probability
- AI exposure index
- Skill readiness metrics
- Job disruption probability

### 4.5 Stack Overflow Developer Surveys (2020, 2025)
Key for:
- Skill usage trends
- Role demand
- Salary insights
- AI tool adoption patterns

### 4.6 World Bank Indicators
Collected unemployment data using manual downloads and API queries.

---

## 5. Phase 2 — Data Cleaning Workflows

The project uses three cleaning pipelines selected based on dataset size, complexity, and desired reproducibility.

---

## 5.1 Cleaning Pipeline 1 — Excel + Power Query  
Used for small datasets such as:
- Layoffs dataset
- AI Impact dataset

Key operations:
- Column trimming
- Conditional transformations
- Ratio metrics (layoff percentage)
- Feature engineering (skill score, risk score)
- Bucketization (risk categories)

Outputs stored in:
```
/data/cleaned/
```

---

## 5.2 Cleaning Pipeline 2 — BigQuery SQL (Core ETL Logic)

BigQuery is used for large structured datasets requiring transformation, normalization, deduplication, and outlier handling.  
The three major SQL scripts used are:

---

### Script 1 — Null Removal & Type Standardization (`*_nullremove.sql`)

Purpose:
- Normalize string fields
- Convert textual values like "NA", "n/a", "", etc. to NULL
- Convert numerical fields using SAFE_CAST
- Enforce valid domain values (e.g., salary > 0)
- Remove invalid entries (negative salaries, invalid years of experience)

Core operations:
- COALESCE / NULLIF for string normalization  
- SAFE_CAST for numeric conversion  
- Conditional handling for domain filters  
- Retain all other untouched fields via `* EXCEPT(...)` projection  

Outputs labeled as:
```
SO_data_20XX_nullremove
```

---

### Script 2 — Categorical Mapping & Deduplication (`*_duplicate_map.sql`)

Purpose:
- Group thousands of messy categorical DevType combinations into unified buckets
- Normalize education levels  
- Create experience buckets (Beginner → Leader)
- Create age bucket mapping (2025 only)
- Create primary DevRole classification
- Remove duplicates based on multi-column keys

Key elements:
- Extensive CASE mappings for DevType (backend, frontend, ML, cloud, DevOps, etc.)
- Education mapping (primary → doctorate)
- Experience bucket via SAFE_CAST(YearsCodePro)
- Dedupe using ROW_NUMBER and PARTITION BY

Ensures dataset consistency across years.

---

### Script 3 — Outlier Removal (`*_no_null_no_outliers_final.sql`)

Purpose:
- Remove outliers from numeric variables using IQR method  
- Keep salary NULL values (do not remove missing salaries)
- Remove salary outliers only where salary exists
- Keep rows with missing employment or missing salary
- Apply realistic constraints on YearsCode, YearsCodePro, WorkExp

Key logic:
- Compute IQR using APPROX_QUANTILES
- Apply bounds to YearsCode and WorkExp
- Apply salary outlier filtering conditionally:
  ```
  CompTotal IS NULL OR LOG(CompTotal) BETWEEN lower AND upper
  ```

Final datasets maintain maximum retention while ensuring data quality.

---

## 5.3 Cleaning Pipeline 3 — Python Pandas

After SQL cleaning, Python is used for:

- Median/mode imputation
- Feature extraction
- Encoding (one-hot, target encoding)
- Additional bucketization
- Salary normalization
- AI adoption indicators
- Composite risk scoring

Files stored under:
```
/src/data_cleaning/python_cleaning/
```

---

## 6. Feature Engineering

Examples of engineered features:

- AI exposure index  
- Composite skill readiness score  
- Final job risk score  
- Salary normalization (log scaling)  
- Age bucket mapping  
- DevRole unified categories  
- Experience bucket (Beginner → Leader)  
- Year trend indicators  

Additional engineered metrics:
- Layoff ratio
- Technology adoption indicators
- Remote work classification

---

## 7. Analysis & Insights (Upcoming)

Planned analyses:

- Trends in AI tool adoption (2020 vs 2025)
- Salary comparison by country, DevRole, experience level
- Workforce automation and job displacement analysis
- Technology stacks used across years
- Programming language shifts
- Cloud, DevOps, and AI stack adoption
- Global unemployment patterns (World Bank dataset)

---

## 8. Dashboards (Upcoming)

Will be developed using:
- Power BI
- Excel pivot dashboards
- Possibly interactive dashboards (Plotly)

The dashboards will show:
- Job trend heatmaps
- AI exposure across industries
- Salary distribution comparisons
- Skill demand forecasts

---

## 9. Machine Learning (Upcoming)

Planned ML tasks:
- Salary prediction model
- Job risk classification (low → high)
- Industry trend forecasting
- Clustering developers by skill set
- NLP on job descriptions
- Generative AI adoption prediction

---

## 10. API Integration (Upcoming)

A FastAPI layer will be built to:
- Serve cleaned datasets
- Provide ML predictions
- Allow external applications to consume insights

---

## 11. Reproducibility

### SQL scripts stored in:
```
src/data_cleaning/scripts/
```

### Cleaned datasets stored in:
```
data/cleaned/
```

### Raw datasets stored in:
```
data/raw/
```

This separation ensures the entire ETL pipeline is reproducible end-to-end.

---

## 12. Summary

This project is structured like a real-world analytics and data engineering system:
- Multi-source ingestion  
- Multi-stage ETL  
- Feature engineering  
- Structured analysis  
- Modeling pipeline  
- API deployment  

This demonstrates broad technical capability across the full data lifecycle.
