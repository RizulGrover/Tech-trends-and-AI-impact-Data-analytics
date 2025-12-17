UPDATE `data-analysis-project-481112.dataset_collection.SO_data_2025`
SET work_type =
    CASE
        WHEN RemoteWork = "Hybrid (some in-person, leans heavy to flexibility)"
            THEN "Hybrid, very flexible"
        WHEN RemoteWork = "Hybrid (some remote, leans heavy to in-person)"
            THEN "Hybrid, more in person"
        WHEN RemoteWork = "Remote"
            THEN "Fully Remote"
        WHEN RemoteWork = "In-person"
            THEN "Fully In-Person"
        WHEN RemoteWork = "Your choice (very flexible, you can come in when you want or just as needed)"
            THEN "Fully Flexible"
        ELSE NULL
    END
WHERE RemoteWork IS NOT NULL;
