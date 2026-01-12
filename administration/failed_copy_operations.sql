-- Description: Failed COPY INTO operations with error details
-- Use Case: Troubleshoot data loading failures, identify file format or data quality issues
-- Time Range: Last 7 days

SELECT
    file_name,
    stage_location,
    table_name,
    table_catalog_name as database_name,
    table_schema_name as schema_name,
    last_load_time,
    status,
    error_count,
    first_error_message,
    first_error_line_number,
    first_error_character_pos
FROM snowflake.account_usage.copy_history
WHERE last_load_time >= dateadd('day', -7, current_timestamp())
    AND status = 'LOAD_FAILED'
ORDER BY last_load_time DESC;
