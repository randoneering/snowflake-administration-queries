-- Description: Top 50 queries taking more than 60 seconds to execute
-- Use Case: Identify expensive queries for optimization, monitor performance issues
-- Time Range: Last 7 days

SELECT
    query_id,
    user_name,
    warehouse_name,
    database_name,
    execution_status,
    total_elapsed_time/1000 as total_seconds,
    queued_provisioning_time/1000 as queue_seconds,
    compilation_time/1000 as compile_seconds,
    execution_time/1000 as exec_seconds,
    bytes_scanned,
    rows_produced,
    credits_used_cloud_services,
    query_text
FROM snowflake.account_usage.query_history
WHERE start_time >= dateadd('day', -7, current_timestamp())
    AND total_elapsed_time > 60000  -- >60 seconds
ORDER BY total_elapsed_time DESC
LIMIT 50;
