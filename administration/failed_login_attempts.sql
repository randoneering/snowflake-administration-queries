-- Description: Failed login attempts grouped by user with more than 5 failures
-- Use Case: Identify brute force attacks, locked accounts, or authentication issues
-- Time Range: Last 7 days

SELECT
    user_name,
    client_ip,
    reported_client_type,
    error_code,
    error_message,
    count(*) as failed_attempts,
    max(event_timestamp) as last_attempt
FROM snowflake.account_usage.login_history
WHERE event_timestamp >= dateadd('day', -7, current_timestamp())
    AND is_success = 'NO'
GROUP BY 1, 2, 3, 4, 5
HAVING count(*) > 5  -- Multiple failures
ORDER BY 6 DESC;
