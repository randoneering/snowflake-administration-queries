-- Description: Complete history of COPY INTO operations including file details and load status
-- Use Case: Track bulk data loading, audit data ingestion, troubleshoot COPY operations
-- Time Range: Last 7 days

SELECT
    file_name,
    stage_location,
    table_name,
    table_catalog_name as database_name,
    table_schema_name as schema_name,
    last_load_time,
    status,
    row_count,
    row_parsed,
    file_size / power(1024, 2) as file_size_mb,
    first_error_message
FROM snowflake.account_usage.copy_history
WHERE last_load_time >= dateadd('day', -7, current_timestamp())
ORDER BY last_load_time DESC;
