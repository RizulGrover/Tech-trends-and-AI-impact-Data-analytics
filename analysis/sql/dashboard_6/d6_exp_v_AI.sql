CREATE OR REPLACE TABLE `data-analysis-project-481112.dataset_collection.d6_ai_v_exp` AS
WITH mapped_data AS (
    SELECT
        ExpBucket,

        CASE
            WHEN AIThreat = 'No' THEN 0.0
            WHEN AIThreat LIKE "%not sure" THEN 0.5
            WHEN AIThreat = 'Yes' THEN 1.0
            ELSE NULL
        END AS ai_threat_score,

        CASE
            WHEN ExpBucket = 'Beginner' THEN 1
            WHEN ExpBucket = 'Mid-Level' THEN 2
            WHEN ExpBucket = 'Senior' THEN 3
            WHEN ExpBucket = 'Expert' THEN 4
            WHEN ExpBucket = 'Leader' THEN 5
        END AS exp_sort_order

    FROM `data-analysis-project-481112.dataset_collection.SO_data_2025`
)

SELECT
    ExpBucket,
    exp_sort_order,
    AVG(ai_threat_score) AS avg_ai_threat_score,
    COUNT(ai_threat_score) AS response_count
FROM mapped_data
WHERE ai_threat_score IS NOT NULL
GROUP BY ExpBucket, exp_sort_order
ORDER BY exp_sort_order;
