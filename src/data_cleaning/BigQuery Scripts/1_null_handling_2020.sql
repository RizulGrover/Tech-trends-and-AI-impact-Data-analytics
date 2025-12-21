CREATE OR REPLACE TABLE `tactile-reason-480608-j3.STack_overflow_20202.SO_data_2020_nullremove` AS
SELECT
  Respondent,

  CASE
  WHEN LOWER(CAST(Age AS STRING)) IN ('', 'na', 'n/a', 'nan') THEN NULL
  WHEN SAFE_CAST(Age AS INT64) IS NULL THEN NULL
  WHEN SAFE_CAST(Age AS INT64) < 0 THEN NULL
  ELSE SAFE_CAST(Age AS INT64)
END AS Age,

  CASE 
    WHEN LOWER(CAST(EdLevel AS STRING)) IN ('', 'na', 'n/a', 'nan') THEN NULL
    ELSE EdLevel
  END AS EdLevel,

  CASE 
    WHEN LOWER(CAST(Employment AS STRING)) IN ('', 'na', 'n/a', 'nan') THEN NULL
    ELSE Employment
  END AS Employment,

  CASE 
    WHEN LOWER(CAST(Country AS STRING)) IN ('', 'na', 'n/a', 'nan') THEN NULL
    ELSE Country
  END AS Country,

  CASE 
    WHEN LOWER(CAST(DevType AS STRING)) IN ('', 'na', 'n/a', 'nan') THEN NULL
    ELSE DevType
  END AS DevType,

  CASE 
    WHEN LOWER(CAST(CurrencyDesc AS STRING)) IN ('', 'na', 'n/a', 'nan') THEN NULL
    ELSE CurrencyDesc
  END AS CurrencyDesc,

  CASE
    WHEN LOWER(CAST(YearsCode AS STRING)) IN ('', 'na', 'n/a', 'nan') THEN NULL
    WHEN LOWER(YearsCode) = 'less than 1 year' THEN 0
    WHEN LOWER(YearsCode) = 'more than 50 years' THEN 50
    WHEN SAFE_CAST(YearsCode AS INT64) IS NULL THEN NULL
    ELSE SAFE_CAST(YearsCode AS INT64)
  END AS YearsCode,

  CASE
    WHEN LOWER(CAST(YearsCodePro AS STRING)) IN ('', 'na', 'n/a', 'nan') THEN NULL
    WHEN LOWER(YearsCodePro) = 'less than 1 year' THEN 0
    WHEN LOWER(YearsCodePro) = 'more than 50 years' THEN 50
    WHEN SAFE_CAST(YearsCodePro AS INT64) IS NULL THEN NULL
    ELSE SAFE_CAST(YearsCodePro AS INT64)
  END AS YearsCodePro,

  CASE
    WHEN SAFE_CAST(CompTotal AS FLOAT64) IS NULL THEN NULL
    WHEN SAFE_CAST(CompTotal AS FLOAT64) < 0 THEN NULL
    ELSE SAFE_CAST(CompTotal AS FLOAT64)
  END AS CompTotal,

  CASE
    WHEN SAFE_CAST(ConvertedComp AS FLOAT64) IS NULL THEN NULL
    WHEN SAFE_CAST(ConvertedComp AS FLOAT64) < 0 THEN NULL
    ELSE SAFE_CAST(ConvertedComp AS FLOAT64)
  END AS ConvertedComp,

  * EXCEPT(Respondent, Age, EdLevel, Employment, Country, DevType, CurrencyDesc, YearsCode, YearsCodePro, CompTotal, ConvertedComp)

FROM `tactile-reason-480608-j3.STack_overflow_20202.SO_data_2020`;
