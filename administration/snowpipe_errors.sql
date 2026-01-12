-- Description: Snowpipe loading errors grouped by error type
-- Use Case: Identify recurring Snowpipe issues, troubleshoot file format or data quality problems
-- Time Range: Last 7 days

SELECT
    pipe_name,
    error_type,
    error_message,
    count(*) as error_count,
    max(last_load_time) as last_occurrence
FROM snowflake.account_usage.copy_history
WHERE last_load_time >= dateadd('day', -7, current_timestamp())
    AND status = 'LOAD_FAILED'
GROUP BY 1, 2, 3
ORDER BY 4 DESC;
