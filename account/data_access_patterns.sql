-- Description: Queries accessing more than 10 base objects (requires ACCOUNTADMIN)
-- Use Case: Identify broad data access patterns, detect potential data exfiltration, audit sensitive data access
-- Time Range: Last 7 days

-- requires ACCOUNTADMIN
SELECT
    user_name,
    direct_objects_accessed,
    base_objects_accessed,
    objects_modified,
    query_start_time,
    query_id
FROM snowflake.account_usage.access_history
WHERE query_start_time >= dateadd('day', -7, current_timestamp())
    AND cardinality(base_objects_accessed) > 10  -- Accessing many tables
ORDER BY query_start_time DESC;
