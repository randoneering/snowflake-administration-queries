-- Description: Failed or incident queries with error details
-- Use Case: Troubleshoot query failures, identify systemic issues, monitor error patterns
-- Time Range: Last 7 days

SELECT
    query_id,
    user_name,
    role_name,
    warehouse_name,
    database_name,
    error_code,
    error_message,
    start_time,
    query_text
FROM snowflake.account_usage.query_history
WHERE start_time >= dateadd('day', -7, current_timestamp())
    AND execution_status IN ('FAIL', 'INCIDENT')
ORDER BY start_time DESC;
