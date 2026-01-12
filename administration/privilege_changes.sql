-- Description: Track recent privilege changes and grants to roles
-- Use Case: Monitor access control changes, audit privilege modifications, investigate security changes
-- Time Range: Last 7 days

SELECT
    created_on,
    modified_on,
    privilege,
    granted_on,
    name as object_name,
    table_catalog as database_name,
    table_schema as schema_name,
    granted_to,
    grantee_name,
    grant_option,
    granted_by
FROM snowflake.account_usage.grants_to_roles
WHERE modified_on >= dateadd('day', -7, current_timestamp())
    AND deleted_on IS NULL
ORDER BY modified_on DESC;
