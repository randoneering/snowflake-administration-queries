-- Description: Track login failures related to password issues (expired, incorrect, policy violations)
-- Use Case: Monitor password policy compliance, identify users needing password resets
-- Time Range: Last 7 days

SELECT
    event_timestamp,
    user_name,
    client_ip,
    reported_client_type,
    error_code,
    error_message
FROM snowflake.account_usage.login_history
WHERE event_timestamp >= dateadd('day', -7, current_timestamp())
    AND is_success = 'NO'
    AND error_message ILIKE '%password%'
ORDER BY event_timestamp DESC;
