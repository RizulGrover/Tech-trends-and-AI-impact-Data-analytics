SELECT
COUNT(*) AS total_jobs,
APPROX_QUANTILES(salary_adjusted,2)[OFFSET(1)] AS median_salary,
COUNT(DISTINCT company_clean) AS total_companies
FROM `data-analysis-project-481112.dataset_collection.luke_tech_jobs`;