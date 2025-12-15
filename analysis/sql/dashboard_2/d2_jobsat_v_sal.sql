WITH smalltable AS(
    SELECT JobSat, ConvertedCompYearly,
    NTILE(6) OVER (ORDER BY ConvertedCompYearly) AS salary_quartiles
    FROM `data-analysis-project-481112.dataset_collection.SO_data_2025`
    WHERE ConvertedCompYearly IS NOT NULL
)

SELECT AVG(JobSat) AS avg_jobsat, salary_quartiles
FROM smalltable
WHERE JobSat IS NOT NULL
GROUP BY salary_quartiles;