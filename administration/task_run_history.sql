-- Description: Complete task execution history including successful and failed runs
-- Use Case: Monitor task pipeline health, track execution duration, troubleshoot task issues
-- Time Range: Last 7 days

SELECT
    name as task_name,
    database_name,
    schema_name,
    state,
    scheduled_time,
    completed_time,
    datediff('second', scheduled_time, completed_time) as run_duration_seconds,
    return_value
FROM snowflake.account_usage.task_history
WHERE scheduled_time >= dateadd('day', -7, current_timestamp())
ORDER BY scheduled_time DESC;
