-- Description: Materialized view refresh operations with duration and credit costs
-- Use Case: Monitor materialized view maintenance costs, optimize refresh frequency
-- Time Range: Last 7 days

SELECT
    name as view_name,
    database_name,
    schema_name,
    refresh_start_time,
    refresh_end_time,
    datediff('second', refresh_start_time, refresh_end_time) as refresh_duration_seconds,
    credits_used
FROM snowflake.account_usage.materialized_view_refresh_history
WHERE refresh_start_time >= dateadd('day', -7, current_timestamp())
ORDER BY refresh_start_time DESC;
