-- Description: Identify non-admin roles with elevated privileges (CREATE USER, CREATE ROLE, MANAGE GRANTS, OWNERSHIP)
-- Use Case: Security audit to ensure privilege separation, detect potential privilege escalation risks
-- Time Range: Current state (all active grants)

SELECT
    grantee_name as role_name,
    privilege,
    granted_on,
    name as object_name,
    granted_by,
    created_on
FROM snowflake.account_usage.grants_to_roles
WHERE deleted_on IS NULL
    AND privilege IN ('CREATE USER', 'CREATE ROLE', 'MANAGE GRANTS', 'OWNERSHIP')
    AND grantee_name NOT IN ('ACCOUNTADMIN', 'SECURITYADMIN')
ORDER BY grantee_name, privilege;
