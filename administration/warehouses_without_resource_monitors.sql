-- Description: Identify active warehouses without resource monitors assigned
-- Use Case: Ensure cost controls are in place for all warehouses, prevent runaway costs
-- Time Range: Current state (all active warehouses)

SELECT
    warehouse_name,
    warehouse_size,
    auto_suspend,
    auto_resume,
    resource_monitor
FROM snowflake.account_usage.warehouses
WHERE deleted IS NULL
    AND (resource_monitor IS NULL OR resource_monitor = 'null')
ORDER BY warehouse_name;
