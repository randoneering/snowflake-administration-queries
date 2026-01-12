-- Description: Top 100 tables by storage consumption including time travel and failsafe
-- Use Case: Identify largest tables, monitor storage costs, plan data retention policies
-- Time Range: Current state

SELECT
    table_catalog as database_name,
    table_schema as schema_name,
    table_name,
    active_bytes/(1024*1024*1024) as active_gb,
    time_travel_bytes/(1024*1024*1024) as time_travel_gb,
    failsafe_bytes/(1024*1024*1024) as failsafe_gb,
    (active_bytes + time_travel_bytes + failsafe_bytes)/(1024*1024*1024) as total_gb
FROM snowflake.account_usage.table_storage_metrics
WHERE deleted IS NULL  -- Active tables only
ORDER BY total_gb DESC
LIMIT 100;
