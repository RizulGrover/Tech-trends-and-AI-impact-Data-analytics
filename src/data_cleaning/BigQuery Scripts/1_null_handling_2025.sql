CREATE OR REPLACE TABLE `tactile-reason-480608-j3.Stack_overflow_2025.SO_data_25_nullremove` AS
SELECT
  _ResponseId_,

  CASE WHEN LOWER(Age) IN ('', 'na', 'n/a') THEN NULL ELSE Age END AS Age,
  CASE WHEN LOWER(EdLevel) IN ('', 'na', 'n/a') THEN NULL ELSE EdLevel END AS EdLevel,
  CASE WHEN LOWER(Employment) IN ('', 'na', 'n/a') THEN NULL ELSE Employment END AS Employment,
  CASE WHEN LOWER(Country) IN ('', 'na', 'n/a') THEN NULL ELSE Country END AS Country,
  CASE WHEN LOWER(DevType) IN ('', 'na', 'n/a') THEN NULL ELSE DevType END AS DevType,
  CASE WHEN LOWER(Currency) IN ('', 'na', 'n/a') THEN NULL ELSE Currency END AS Currency,

  CASE
    WHEN LOWER(YearsCode) IN ('', 'na', 'n/a') THEN NULL
    WHEN SAFE_CAST(YearsCode AS INT64) IS NULL THEN NULL
    ELSE SAFE_CAST(YearsCode AS INT64)
  END AS YearsCode,

  CASE
    WHEN LOWER(WorkExp) IN ('', 'na', 'n/a') THEN NULL
    WHEN SAFE_CAST(WorkExp AS INT64) IS NULL THEN NULL
    ELSE SAFE_CAST(WorkExp AS INT64)
  END AS WorkExp,

  CASE
    WHEN LOWER(CompTotal) IN ('', 'na', 'n/a') THEN NULL
    WHEN SAFE_CAST(CompTotal AS FLOAT64) IS NULL THEN NULL
    WHEN SAFE_CAST(CompTotal AS FLOAT64) < 0 THEN NULL
    ELSE SAFE_CAST(CompTotal AS FLOAT64)
  END AS CompTotal,

  CASE
    WHEN LOWER(ConvertedCompYearly) IN ('', 'na', 'n/a') THEN NULL
    WHEN SAFE_CAST(ConvertedCompYearly AS FLOAT64) IS NULL THEN NULL
    WHEN SAFE_CAST(ConvertedCompYearly AS FLOAT64) < 0 THEN NULL
    ELSE SAFE_CAST(ConvertedCompYearly AS FLOAT64)
  END AS ConvertedCompYearly,

  * EXCEPT(_ResponseId_, Age, EdLevel, Employment, Country, DevType, Currency, YearsCode, WorkExp, CompTotal, ConvertedCompYearly)
FROM `tactile-reason-480608-j3.Stack_overflow_2025.SO_data_25`;
