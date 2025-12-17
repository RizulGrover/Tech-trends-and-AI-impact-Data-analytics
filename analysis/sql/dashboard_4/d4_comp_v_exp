WITH table_20 AS (
    SELECT
        ExpBucket,
        ConvertedComp AS compensation
    FROM `data-analysis-project-481112.dataset_collection.SO_data_2020`
    WHERE ConvertedComp IS NOT NULL
      AND ExpBucket IS NOT NULL
),

table_25 AS (
    SELECT
        ExpBucket,
        ConvertedCompYearly AS compensation
    FROM `data-analysis-project-481112.dataset_collection.SO_data_2025`
    WHERE ConvertedCompYearly IS NOT NULL
      AND ExpBucket IS NOT NULL
)

SELECT
    ExpBucket,
    AVG(compensation) AS avg_compensation,
    2020 AS year
FROM table_20
GROUP BY ExpBucket

UNION ALL

SELECT
    ExpBucket,
    AVG(compensation) AS avg_compensation,
    2025 AS year
FROM table_25
GROUP BY ExpBucket

ORDER BY
    ExpBucket,
    year;
