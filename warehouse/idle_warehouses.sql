-- Description: Identify warehouses not used in the last 7 days
-- Use Case: Find unused warehouses to suspend or drop, reduce costs from idle resources
-- Time Range: Last 30 days (identifies warehouses unused for 7+ days)

SELECT
    warehouse_name,
    warehouse_size,
    auto_suspend,
    auto_resume,
    state,
    max(end_time) as last_used
FROM snowflake.account_usage.warehouse_metering_history
WHERE start_time >= dateadd('day', -30, current_timestamp())
GROUP BY warehouse_name, warehouse_size, auto_suspend, auto_resume, state
HAVING datediff('day', max(end_time), current_timestamp()) > 7  -- Not used in 7 days
ORDER BY last_used DESC;
