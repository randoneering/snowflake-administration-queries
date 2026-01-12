-- Description: Daily average stage storage usage for file staging areas
-- Use Case: Monitor costs of data staged for loading, identify stage cleanup opportunities
-- Time Range: Last 30 days

SELECT
    usage_date,
    avg(average_stage_bytes) / power(1024, 3) as avg_stage_storage_gb
FROM snowflake.account_usage.stage_storage_usage_history
WHERE usage_date >= dateadd('day', -30, current_timestamp())
GROUP BY usage_date
ORDER BY usage_date DESC;
