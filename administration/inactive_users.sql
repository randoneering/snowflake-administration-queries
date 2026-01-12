-- Description: Find enabled users who haven't logged in for 90+ days or never logged in
-- Use Case: Identify stale accounts for deactivation, reduce security risk, maintain user hygiene
-- Time Range: Users inactive for 90+ days

SELECT
    name as user_name,
    login_name,
    created_on,
    last_success_login,
    datediff('day', last_success_login, current_timestamp()) as days_since_last_login,
    disabled
FROM snowflake.account_usage.users
WHERE deleted_on IS NULL
    AND disabled = FALSE
    AND (last_success_login IS NULL
         OR last_success_login < dateadd('day', -90, current_timestamp()))
ORDER BY last_success_login DESC NULLS LAST;
