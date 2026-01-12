-- Description: Top 50 queries with local or remote spillage (memory overflow)
-- Use Case: Identify queries needing optimization or larger warehouse, monitor memory usage
-- Time Range: Last 7 days

SELECT
    query_id,
    user_name,
    warehouse_name,
    execution_status,
    bytes_spilled_to_local_storage,
    bytes_spilled_to_remote_storage,
    total_elapsed_time/1000 as seconds,
    query_text
FROM snowflake.account_usage.query_history
WHERE start_time >= dateadd('day', -7, current_timestamp())
    AND (bytes_spilled_to_local_storage > 0
         OR bytes_spilled_to_remote_storage > 0)
ORDER BY bytes_spilled_to_remote_storage DESC
LIMIT 50;
