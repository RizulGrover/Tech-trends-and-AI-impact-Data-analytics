SELECT
    DATE_TRUNC(Date, MONTH) AS layoff_month,
    SUM(Laid_Off_Count) AS total_layoffs,
    'actual' AS data_type
FROM `data-analysis-project-481112.dataset_collection.layoffs`
WHERE Laid_Off_Count IS NOT NULL
GROUP BY layoff_month
ORDER BY layoff_month;
