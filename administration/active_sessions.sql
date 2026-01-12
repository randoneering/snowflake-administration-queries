-- Description: Monitor active user sessions in the last 24 hours
-- Use Case: Track current user activity, identify concurrent sessions, and monitor session duration
-- Time Range: Last 1 day

SELECT
    session_id,
    user_name,
    client_application_id,
    client_environment,
    created_on,
    datediff('minute', created_on, current_timestamp()) as session_age_minutes
FROM snowflake.account_usage.sessions
WHERE created_on >= dateadd('day', -1, current_timestamp())
    AND login_event IS NOT NULL
ORDER BY created_on DESC;
