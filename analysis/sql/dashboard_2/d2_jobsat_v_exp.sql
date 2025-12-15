SELECT AVG(JobSat) AS Avg_jobsat, ExpBucket, AVG(WorkExp) AS avg_exp
FROM `data-analysis-project-481112.dataset_collection.SO_data_2025`
WHERE JobSat IS NOT NULL
GROUP BY ExpBucket
ORDER BY avg_exp;