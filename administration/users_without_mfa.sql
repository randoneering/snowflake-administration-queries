-- Description: Identify users with password authentication but no MFA enabled
-- Use Case: Security audit to ensure all users have multi-factor authentication configured
-- Time Range: Current state (all active users)

SELECT
    name as user_name,
    login_name,
    created_on,
    disabled,
    must_change_password,
    has_password,
    has_rsa_public_key,
    last_success_login,
    ext_authn_duo
FROM snowflake.account_usage.users
WHERE deleted_on IS NULL
    AND has_password = TRUE
    AND ext_authn_duo = FALSE  -- No MFA enabled
ORDER BY last_success_login DESC NULLS LAST;
