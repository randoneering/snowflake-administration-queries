-- Description: Top 50 queries taking more than 5 minutes to execute
-- Use Case: Identify slow queries for optimization, monitor long-running operations
-- Time Range: Last 7 days

SELECT
    query_id,
    user_name,
    role_name,
    warehouse_name,
    database_name,
    query_type,
    start_time,
    end_time,
    total_elapsed_time/1000/60 as total_minutes,
    execution_status,
    error_code,
    error_message,
    query_text
FROM snowflake.account_usage.query_history
WHERE start_time >= dateadd('day', -7, current_timestamp())
    AND total_elapsed_time > 300000  -- > 5 minutes
ORDER BY total_elapsed_time DESC
LIMIT 50;
