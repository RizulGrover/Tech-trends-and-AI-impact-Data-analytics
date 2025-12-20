-- CREATE OR REPLACE TABLE layoffs_vs_unemployment_country_year AS

WITH countrybylayoff AS(
    SELECT Country, EXTRACT(YEAR FROM `Date`) as layoff_year, SUM(Laid_Off_Count) AS total_layoffs
    FROM `data-analysis-project-481112.dataset_collection.layoffs`
    WHERE Laid_Off_Count IS NOT NULL
GROUP BY Country, layoff_year
),
tableimputed AS(
    SELECT Country, layoff_year, total_layoffs,
    CASE
        WHEN layoff_year=2024 THEN total_layoffs*2
    ELSE total_layoffs
    END AS layoff_total_correct
    FROM countrybylayoff
),
countryranked AS(
    SELECT 
    Country, layoff_year, layoff_total_correct AS layoffs,
    SUM(layoff_total_correct) OVER (PARTITION BY Country) AS sum_layoffs
    FROM tableimputed
    ORDER BY sum_layoffs DESC, Country, layoff_year
    LIMIT 80
)

SELECT
l.Country,
l.layoff_year,
l.layoffs,
l.sum_layoffs,
u.unemployment_rate
FROM countryranked l LEFT JOIN `data-analysis-project-481112.dataset_collection.world_bank` u
ON l.Country=u.country_name
AND l.layoff_year=u.year;

