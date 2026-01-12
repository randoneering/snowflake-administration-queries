-- Description: Failed task executions with error details
-- Use Case: Troubleshoot task failures, identify recurring issues in data pipelines
-- Time Range: Last 7 days

SELECT
    name as task_name,
    database_name,
    schema_name,
    state,
    error_code,
    error_message,
    scheduled_time,
    completed_time,
    query_text
FROM snowflake.account_usage.task_history
WHERE scheduled_time >= dateadd('day', -7, current_timestamp())
    AND state = 'FAILED'
ORDER BY scheduled_time DESC;
