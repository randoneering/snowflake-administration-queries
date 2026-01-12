-- Description: List all active role grants assigned to users
-- Use Case: Audit user permissions, understand role assignments, review access control
-- Time Range: Current state (all active grants)

SELECT
    grantee_name as user_name,
    role,
    granted_on,
    granted_by,
    deleted_on
FROM snowflake.account_usage.grants_to_users
WHERE deleted_on IS NULL
ORDER BY grantee_name, role;
