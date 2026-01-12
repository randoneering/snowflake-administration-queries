-- Description: Identify tasks taking more than 30 minutes to complete
-- Use Case: Find long-running tasks for optimization, identify performance bottlenecks
-- Time Range: Last 7 days

SELECT
    name as task_name,
    database_name,
    schema_name,
    state,
    scheduled_time,
    completed_time,
    datediff('minute', scheduled_time, completed_time) as run_duration_minutes,
    query_id,
    error_code,
    error_message
FROM snowflake.account_usage.task_history
WHERE scheduled_time >= dateadd('day', -7, current_timestamp())
    AND datediff('minute', scheduled_time, completed_time) > 30  -- Tasks running > 30 min
ORDER BY run_duration_minutes DESC;
