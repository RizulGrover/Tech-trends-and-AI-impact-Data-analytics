CREATE OR REPLACE TABLE `tactile-reason-480608-j3.world_bank.world_bank_clean` AS
WITH unpvt AS(
SELECT country_name, country_code,
SAFE_CAST(SUBSTR(year,2) AS int64) AS year,
SAFE_CAST(unemployment_rate as float64) AS unemployment_rate
FROM `tactile-reason-480608-j3.world_bank.world_bank_raw`
UNPIVOT(
  unemployment_rate FOR year IN(y2000, y2001, y2002, y2003, y2004, y2005, y2006, y2007, y2008,    y2009,y2010, y2011, y2012, y2013, y2014, y2015, y2016, y2017, y2018, y2019,y2020, y2021, y2022, y2023, y2024)
)
)

SELECT * FROM
unpvt
WHERE unemployment_rate IS NOT NULL
AND country_name NOT IN(
  'World',
   'High income',
   'Low income',
   'Middle income',
   'Upper middle income',
   'Lower middle income',
   'Euro area',
   'European Union',
   'Arab World',
   'Sub-Saharan Africa (all income levels)'
)
ORDER BY country_name, year;



