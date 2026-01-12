-- Description: Top 50 queries spilling intermediate results to remote storage
-- Use Case: Identify memory-intensive queries, optimize queries or increase warehouse size
-- Time Range: Last 7 days

SELECT
    query_id,
    query_text,
    user_name,
    warehouse_name,
    start_time,
    total_elapsed_time/1000 as total_seconds,
    bytes_spilled_to_remote_storage / power(1024, 3) as gb_spilled_remote,
    bytes_spilled_to_local_storage / power(1024, 3) as gb_spilled_local,
    execution_status
FROM snowflake.account_usage.query_history
WHERE start_time >= dateadd('day', -7, current_timestamp())
    AND bytes_spilled_to_remote_storage > 0
ORDER BY bytes_spilled_to_remote_storage DESC
LIMIT 50;
