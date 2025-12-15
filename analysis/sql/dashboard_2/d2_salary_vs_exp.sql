SELECT AVG(ConvertedCompYearly) AS avg_salary, ExpBucket, AVG(WorkExp) AS avg_exp
FROM `data-analysis-project-481112.dataset_collection.SO_data_2025`
WHERE ConvertedCompYearly IS NOT NULL
GROUP BY ExpBucket
ORDER BY avg_exp;