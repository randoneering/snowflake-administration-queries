-- Description: Warehouse load metrics showing running, queued, and blocked queries
-- Use Case: Identify warehouse sizing issues, queue bottlenecks, optimize warehouse configuration
-- Time Range: Last 7 days

SELECT
    start_time,
    warehouse_name,
    avg(avg_running) as avg_running_queries,
    avg(avg_queued_load) as avg_queued_queries,
    avg(avg_queued_provisioning) as avg_queued_provisioning,
    avg(avg_blocked) as avg_blocked_queries
FROM snowflake.account_usage.warehouse_load_history
WHERE start_time >= dateadd('day', -7, current_timestamp())
GROUP BY start_time, warehouse_name
ORDER BY start_time DESC, warehouse_name;
