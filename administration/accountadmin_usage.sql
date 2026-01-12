-- Description: Monitor all queries executed using the ACCOUNTADMIN role
-- Use Case: Security audit of privileged access, track administrative actions, ensure proper role usage
-- Time Range: Last 7 days

SELECT
    user_name,
    role_name,
    query_type,
    database_name,
    query_text,
    start_time,
    end_time,
    total_elapsed_time/1000 as total_seconds
FROM snowflake.account_usage.query_history
WHERE start_time >= dateadd('day', -7, current_timestamp())
    AND role_name = 'ACCOUNTADMIN'
ORDER BY start_time DESC;
