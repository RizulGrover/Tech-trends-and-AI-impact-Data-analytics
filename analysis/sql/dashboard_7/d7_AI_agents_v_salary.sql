SELECT
  CASE
    WHEN AIAgents = "No, and I don't plan to" THEN "No AI usage"
    WHEN AIAgents = "No, but I plan to" THEN "Plans to adopt AI"
    WHEN AIAgents = "No, I use AI exclusively in copilot/autocomplete mode" THEN "Copilot only"
    WHEN AIAgents = "Yes, I use AI agents at work monthly or infrequently" THEN "AI agents (monthly)"
    WHEN AIAgents = "Yes, I use AI agents at work weekly" THEN "AI agents (weekly)"
    WHEN AIAgents = "Yes, I use AI agents at work daily" THEN "AI agents (daily)"
    ELSE "Unknown"
  END AS ai_agent_label,

  CASE
    WHEN AIAgents = "No, and I don't plan to" THEN 0
    WHEN AIAgents = "No, but I plan to" THEN 1
    WHEN AIAgents = "No, I use AI exclusively in copilot/autocomplete mode" THEN 2
    WHEN AIAgents = "Yes, I use AI agents at work monthly or infrequently" THEN 3
    WHEN AIAgents = "Yes, I use AI agents at work weekly" THEN 4
    WHEN AIAgents = "Yes, I use AI agents at work daily" THEN 5
    ELSE NULL
  END AS ai_agent_level,

  COUNT(*) AS respondent_count,

  AVG(ConvertedCompYearly) AS avg_salary_usd

FROM
  `data-analysis-project-481112.dataset_collection.SO_data_2025`

WHERE
  ConvertedCompYearly IS NOT NULL
  AND AIAgents IS NOT NULL

GROUP BY
  ai_agent_label,
  ai_agent_level

ORDER BY
  ai_agent_level;
