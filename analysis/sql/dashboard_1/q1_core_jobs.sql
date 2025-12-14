SELECT
job_date,
DATE_TRUNC(job_date, MONTH) AS month,
job_title_short,
company_clean,
salary_adjusted
FROM `data-analysis-project-481112.dataset_collection.luke_tech_jobs`
WHERE job_date IS NOT NULL;