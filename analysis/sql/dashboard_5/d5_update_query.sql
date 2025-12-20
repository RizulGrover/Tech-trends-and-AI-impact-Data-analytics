INSERT INTO `data-analysis-project-481112.dataset_collection.d5_layoff_timeline`
(layoff_month, total_layoffs, data_type)
SELECT
    DATE '2024-07-01' AS layoff_month,
    total_layoffs,
    'imputed' AS data_type
FROM `data-analysis-project-481112.dataset_collection.d5_layoff_timeline`
WHERE layoff_month = DATE '2024-01-01'

UNION ALL
SELECT DATE '2024-08-01', total_layoffs, 'imputed'
FROM `data-analysis-project-481112.dataset_collection.d5_layoff_timeline`
WHERE layoff_month = DATE '2024-02-01'

UNION ALL
SELECT DATE '2024-09-01', total_layoffs, 'imputed'
FROM `data-analysis-project-481112.dataset_collection.d5_layoff_timeline`
WHERE layoff_month = DATE '2024-03-01'

UNION ALL
SELECT DATE '2024-10-01', total_layoffs, 'imputed'
FROM `data-analysis-project-481112.dataset_collection.d5_layoff_timeline`
WHERE layoff_month = DATE '2024-04-01'

UNION ALL
SELECT DATE '2024-11-01', total_layoffs, 'imputed'
FROM `data-analysis-project-481112.dataset_collection.d5_layoff_timeline`
WHERE layoff_month = DATE '2024-05-01'

UNION ALL
SELECT DATE '2024-12-01', total_layoffs, 'imputed'
FROM `data-analysis-project-481112.dataset_collection.d5_layoff_timeline`
WHERE layoff_month = DATE '2024-06-01';
