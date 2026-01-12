-- Description: Large tables (>1M rows) without clustering keys defined
-- Use Case: Identify candidates for clustering to improve query performance
-- Time Range: Current state

SELECT
    table_catalog,
    table_schema,
    table_name,
    row_count,
    bytes/(1024*1024*1024) as size_gb,
    clustering_key
FROM snowflake.account_usage.tables
WHERE deleted IS NULL
    AND table_type = 'BASE TABLE'
    AND row_count > 1000000  -- Large tables
    AND clustering_key IS NULL
ORDER BY row_count DESC;
