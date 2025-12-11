CREATE OR REPLACE TABLE `tactile-reason-480608-j3.STack_overflow_20202.SO_data_2020_duplicate_map` AS

WITH distinct_table AS (
  SELECT DISTINCT *
  FROM `tactile-reason-480608-j3.STack_overflow_20202.SO_data_2020_nullremove`
),

mapped AS (
SELECT Respondent, DevType, EdLevel, YearsCodePro, Age,


CASE
  WHEN Age BETWEEN 18 AND 24 THEN 21
  WHEN Age BETWEEN 25 AND 34 THEN 29.5
  WHEN Age BETWEEN 35 AND 44 THEN 39.5
  WHEN Age BETWEEN 45 AND 54 THEN 49.5
  WHEN Age BETWEEN 55 AND 64 THEN 59.5
  WHEN Age >= 65 AND Age <= 80 THEN 67.5
  ELSE NULL      
END AS AgeNumeric,


CASE
  WHEN LOWER(DevType) LIKE '%back-end%' THEN 'Backend Developer'
  WHEN LOWER(DevType) LIKE '%front-end%' THEN 'Frontend Developer'
  WHEN LOWER(DevType) LIKE '%full-stack%' THEN 'Full Stack Developer'
  WHEN LOWER(DevType) LIKE '%desktop%' THEN 'Desktop/Enterprise Developer'
  WHEN LOWER(DevType) LIKE '%enterprise%' THEN 'Desktop/Enterprise Developer'
  WHEN LOWER(DevType) LIKE '%mobile%' THEN 'Mobile Developer'
  WHEN LOWER(DevType) LIKE '%ios%' THEN 'Mobile Developer'
  WHEN LOWER(DevType) LIKE '%android%' THEN 'Mobile Developer'
  WHEN LOWER(DevType) LIKE '%game%' THEN 'Game Developer'
  WHEN LOWER(DevType) LIKE '%scientist%' THEN 'Data Scientist'
  WHEN LOWER(DevType) LIKE '%machine learning%' THEN 'ML Engineer'
  WHEN LOWER(DevType) LIKE '%ml specialist%' THEN 'ML Engineer'
  WHEN LOWER(DevType) LIKE '%data engineer%' THEN 'Data Engineer'
  WHEN LOWER(DevType) LIKE '%business analyst%' THEN 'Data / Business Analyst'
  WHEN LOWER(DevType) LIKE '%data or business analyst%' THEN 'Data / Business Analyst'
  WHEN LOWER(DevType) LIKE '%devops%' THEN 'DevOps/SRE'
  WHEN LOWER(DevType) LIKE '%reliability%' THEN 'DevOps/SRE'
  WHEN LOWER(DevType) LIKE '%cloud%' THEN 'Cloud Engineer'
  WHEN LOWER(DevType) LIKE '%infrastructure%' THEN 'Cloud Engineer'
  WHEN LOWER(DevType) LIKE '%database%' THEN 'Database Admin'
  WHEN LOWER(DevType) LIKE '%qa%' THEN 'QA/Test Engineer'
  WHEN LOWER(DevType) LIKE '%test engineer%' THEN 'QA/Test Engineer'
  WHEN LOWER(DevType) LIKE '%security%' THEN 'Security Engineer'
  WHEN LOWER(DevType) LIKE '%academic%' THEN 'Academic / Research'
  WHEN LOWER(DevType) LIKE '%researcher%' THEN 'Academic / Research'
  ELSE 'Other'
END AS PrimaryDevRole,


CASE
  WHEN LOWER(EdLevel) LIKE '%primary%' THEN 'Primary School'
  WHEN LOWER(EdLevel) LIKE '%secondary%' THEN 'Secondary School'
  WHEN LOWER(EdLevel) LIKE '%associate%' THEN 'Associate Degree'
  WHEN LOWER(EdLevel) LIKE '%bachelor%' THEN "Bachelor's Degree"
  WHEN LOWER(EdLevel) LIKE '%doctoral%' THEN "Doctorate"
  WHEN LOWER(EdLevel) LIKE '%master%' THEN "Master's Degree"
  WHEN LOWER(EdLevel) LIKE '%professional%' THEN 'Professional Degree'
  WHEN LOWER(EdLevel) LIKE '%university%' THEN 'Studying in College'
  ELSE 'Other/NA'
END AS EducationLevel,


CASE
  WHEN SAFE_CAST(YearsCodePro AS INT64) < 5 THEN "Beginner"
  WHEN SAFE_CAST(YearsCodePro AS INT64) BETWEEN 5 AND 10 THEN "Mid-Level"
  WHEN SAFE_CAST(YearsCodePro AS INT64) BETWEEN 11 AND 18 THEN "Senior"
  WHEN SAFE_CAST(YearsCodePro AS INT64) BETWEEN 19 AND 25 THEN "Expert"
  WHEN SAFE_CAST(YearsCodePro AS INT64) > 25 THEN "Leader"
  ELSE "Did Not Specify"
END AS ExpBucket,

* EXCEPT(Respondent, DevType, EdLevel, YearsCodePro, Age)

FROM distinct_table
),


dedupe AS (
SELECT *,
ROW_NUMBER() OVER (
  PARTITION BY Country, Age, EdLevel, Employment, PrimaryDevRole, YearsCode, YearsCodePro
) AS rn
FROM mapped
)

SELECT * EXCEPT(rn)
FROM dedupe
WHERE rn = 1;
