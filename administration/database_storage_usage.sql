-- Description: Average storage usage by database including failsafe storage
-- Use Case: Monitor storage costs, identify databases consuming most storage, track storage trends
-- Time Range: Last 30 days

SELECT
    database_name,
    avg(database_bytes) / power(1024, 3) as avg_database_gb,
    avg(failsafe_bytes) / power(1024, 3) as avg_failsafe_gb,
    (avg(database_bytes) + avg(failsafe_bytes)) / power(1024, 3) as avg_total_gb
FROM snowflake.account_usage.database_storage_usage_history
WHERE usage_date >= dateadd('day', -30, current_timestamp())
GROUP BY database_name
ORDER BY avg_total_gb DESC;
