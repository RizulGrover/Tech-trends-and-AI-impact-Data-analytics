CREATE OR REPLACE TABLE `tactile-reason-480608-j3.Stack_overflow_2025.SO_data_25_duplicate_map` AS

WITH distinct_table AS(
  SELECT DISTINCT *
  FROM
  `tactile-reason-480608-j3.Stack_overflow_2025.SO_data_25_nullremove`
),

mapped AS(
SELECT _ResponseId_, Age, EdLevel, WorkExp,

CASE
  WHEN Age = '18-24 years old' THEN 21
  WHEN Age = '25-34 years old' THEN 29.5
  WHEN Age = '35-44 years old' THEN 39.5
  WHEN Age = '45-54 years old' THEN 49.5
  WHEN Age = '55-64 years old' THEN 59.5
  WHEN Age = '65 years or older' THEN 67.5
ELSE NULL
END AS AgeNumeric,

CASE
  WHEN LOWER(EdLevel) LIKE '%primary%' THEN 'Primary School'
  WHEN LOWER(EdLevel) LIKE '%secondary%' THEN 'Secondary School'
  WHEN LOWER(EdLevel) LIKE '%associate%' THEN 'Associate Degree'
  WHEN LOWER(EdLevel) LIKE '%bachelor%' THEN "Bachelor's Degree"
  WHEN LOWER(EdLevel) LIKE '%master%' THEN "Master's Degree"
  WHEN LOWER(EdLevel) LIKE '%professional%' THEN 'Professional Degree'
  WHEN LOWER(EdLevel) LIKE '%university%' THEN 'Studying in College'
  ELSE 'Other/NA'
END AS EducationLevel,

CASE
  WHEN WorkExp < 5 THEN "Beginner"
  WHEN WorkExp BETWEEN 5 AND 10 THEN "Mid-Level"
  WHEN WorkExp BETWEEN 11 AND 18 THEN "Senior"
  WHEN WorkExp BETWEEN 19 AND 25 THEN "Expert"
  WHEN WorkExp > 25 THEN "Leader"
  ELSE "Did Not Specify"
END AS ExpBucket,

*EXCEPT(_ResponseId_, Age, EdLevel, WorkExp)

FROM distinct_table
),

dedupe AS(
SELECT *,
ROW_NUMBER() OVER(
  PARTITION BY Country, Age, EdLevel, Employment, WorkExp, Industry, DevType, YearsCode
) AS rn
FROM mapped
)

SELECT *EXCEPT(rn)
FROM dedupe
WHERE rn=1;




