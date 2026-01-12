-- Description: Snowpipe usage metrics including files loaded, data volume, and credit consumption
-- Use Case: Monitor Snowpipe activity, track data loading costs, identify high-volume pipes
-- Time Range: Last 7 days

SELECT
    pipe_name,
    database_name,
    schema_name,
    sum(files_inserted) as total_files,
    sum(bytes_inserted) / power(1024, 3) as total_gb_inserted,
    sum(credits_used) as total_credits,
    start_time
FROM snowflake.account_usage.pipe_usage_history
WHERE start_time >= dateadd('day', -7, current_timestamp())
GROUP BY pipe_name, database_name, schema_name, start_time
ORDER BY start_time DESC, total_credits DESC;
