-- Description: Query performance metrics aggregated by warehouse
-- Use Case: Compare warehouse efficiency, identify performance issues, optimize warehouse sizing
-- Time Range: Last 7 days

SELECT
    warehouse_name,
    count(*) as query_count,
    avg(execution_time)/1000 as avg_execution_seconds,
    avg(queued_overload_time)/1000 as avg_queue_seconds,
    avg(bytes_scanned) / power(1024, 3) as avg_gb_scanned,
    sum(credits_used_cloud_services) as total_cloud_credits
FROM snowflake.account_usage.query_history
WHERE start_time >= dateadd('day', -7, current_timestamp())
    AND warehouse_name IS NOT NULL
GROUP BY warehouse_name
ORDER BY query_count DESC;
