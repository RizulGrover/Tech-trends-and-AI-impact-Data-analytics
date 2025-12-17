WITH sat_map AS(
    SELECT JobSat, ConvertedComp,

    CASE
        WHEN JobSat='Very satisfied' THEN 9.5
        WHEN JobSat='Slightly satisfied' THEN 7.8
        WHEN JobSat='Neither satisfied nor dissatisfied' THEN 5.5
        WHEN JobSat='Slightly dissatisfied' THEN 3.5
        WHEN JobSat='Very dissatisfied' THEN 1.5
        ELSE NULL
    END AS JobSat_num

    FROM `data-analysis-project-481112.dataset_collection.SO_data_2020`
    WHERE ConvertedComp IS NOT NULL
),
table_20 AS(
    SELECT JobSat_num, ConvertedComp,
    NTILE(6) OVER (ORDER BY ConvertedComp) AS salary_quantiles
    FROM sat_map
    WHERE ConvertedComp IS NOT NULL
),
table_25 AS(
    SELECT JobSat, ConvertedCompYearly,
    NTILE(6) OVER (ORDER BY ConvertedCompYearly) AS salary_quantiles
    FROM `data-analysis-project-481112.dataset_collection.SO_data_2025`
    WHERE ConvertedCompYearly IS NOT NULL
)

SELECT AVG(JobSat) AS avg_jobsat_num, salary_quantiles, 2025 AS year
FROM table_25
WHERE JobSat IS NOT NULL
GROUP BY salary_quantiles

UNION ALL

SELECT AVG(JobSat_num) AS avg_jobsat_num, salary_quantiles, 2020 AS year
FROM table_20
WHERE JobSat_num IS NOT NULL
GROUP BY salary_quantiles

ORDER BY year;