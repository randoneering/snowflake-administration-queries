-- Description: Query acceleration service usage and credit consumption
-- Use Case: Monitor query acceleration costs, evaluate service effectiveness
-- Time Range: Last 7 days

SELECT
    start_time,
    end_time,
    warehouse_name,
    num_files_scanned,
    num_bytes_scanned / power(1024, 3) as gb_scanned,
    credits_used,
    upper_limit_scale_factor
FROM snowflake.account_usage.query_acceleration_history
WHERE start_time >= dateadd('day', -7, current_timestamp())
ORDER BY start_time DESC, credits_used DESC;
