-- Description: Complete login history including successful and failed attempts
-- Use Case: Audit user access, investigate security incidents, track authentication methods
-- Time Range: Last 7 days

SELECT
    user_name,
    event_timestamp,
    client_ip,
    reported_client_type,
    reported_client_version,
    first_authentication_factor,
    second_authentication_factor,
    is_success,
    error_code,
    error_message
FROM snowflake.account_usage.login_history
WHERE event_timestamp >= dateadd('day', -7, current_timestamp())
ORDER BY event_timestamp DESC;
