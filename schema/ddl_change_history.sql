-- Description: Track all DDL changes (CREATE, ALTER, DROP, RENAME, TRUNCATE)
-- Use Case: Audit schema changes, track object modifications, investigate production changes
-- Time Range: Last 7 days

SELECT
    query_start_time,
    user_name,
    role_name,
    query_type,
    object_type,
    object_name,
    database_name,
    schema_name,
    query_text
FROM snowflake.account_usage.query_history
WHERE query_start_time >= dateadd('day', -7, current_timestamp())
    AND query_type IN ('CREATE', 'ALTER', 'DROP', 'RENAME', 'TRUNCATE')
ORDER BY query_start_time DESC;
