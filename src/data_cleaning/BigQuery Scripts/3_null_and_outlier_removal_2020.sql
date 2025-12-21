CREATE OR REPLACE TABLE `tactile-reason-480608-j3.STack_overflow_20202.SO_data_2020_no_null_no_outliers_final` AS

WITH distinct_table AS (
  SELECT DISTINCT *
  FROM `tactile-reason-480608-j3.STack_overflow_20202.SO_data_2020_duplicate_map`
),

drop_nulls AS (
  SELECT *
  FROM distinct_table
  WHERE EdLevel IS NOT NULL
    AND (Age IS NULL OR Age BETWEEN 13 AND 80)
    AND (CompTotal IS NULL OR CompTotal > 0)
    AND (ConvertedComp IS NULL OR ConvertedComp > 0)
),

iqr_calc AS (
  SELECT
    APPROX_QUANTILES(YearsCode, 100) AS yc_q,
    APPROX_QUANTILES(YearsCodePro, 100) AS ycp_q,
    APPROX_QUANTILES(LOG(CompTotal), 100) AS ct_q,
    APPROX_QUANTILES(LOG(ConvertedComp), 100) AS cct_q
  FROM drop_nulls
  WHERE CompTotal IS NOT NULL AND ConvertedComp IS NOT NULL
),

iq_range AS (
  SELECT
    yc_q[OFFSET(25)] - 1.5*(yc_q[OFFSET(75)] - yc_q[OFFSET(25)]) AS yc_q_l,
    yc_q[OFFSET(75)] + 1.5*(yc_q[OFFSET(75)] - yc_q[OFFSET(25)]) AS yc_q_u,

    ycp_q[OFFSET(25)] - 1.5*(ycp_q[OFFSET(75)] - ycp_q[OFFSET(25)]) AS ycp_q_l,
    ycp_q[OFFSET(75)] + 1.5*(ycp_q[OFFSET(75)] - ycp_q[OFFSET(25)]) AS ycp_q_u,

    ct_q[OFFSET(25)] - 1.5*(ct_q[OFFSET(75)] - ct_q[OFFSET(25)]) AS ct_q_l,
    ct_q[OFFSET(75)] + 1.5*(ct_q[OFFSET(75)] - ct_q[OFFSET(25)]) AS ct_q_u,

    cct_q[OFFSET(25)] - 1.5*(cct_q[OFFSET(75)] - cct_q[OFFSET(25)]) AS cct_q_l,
    cct_q[OFFSET(75)] + 1.5*(cct_q[OFFSET(75)] - cct_q[OFFSET(25)]) AS cct_q_u
  FROM iqr_calc
),

no_outliers AS (
  SELECT d.*
  FROM drop_nulls d
  CROSS JOIN iq_range i
  WHERE (YearsCode BETWEEN i.yc_q_l AND i.yc_q_u)
    AND (YearsCodePro BETWEEN i.ycp_q_l AND i.ycp_q_u)
    AND (CompTotal IS NULL OR LOG(CompTotal) BETWEEN i.ct_q_l AND i.ct_q_u)
    AND (ConvertedComp IS NULL OR LOG(ConvertedComp) BETWEEN i.cct_q_l AND i.cct_q_u)
)

SELECT * FROM no_outliers;
