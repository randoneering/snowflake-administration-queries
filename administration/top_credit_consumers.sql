-- Description: Top 50 objects consuming the most credits (warehouses, tasks, pipes, etc.)
-- Use Case: Identify biggest cost drivers, optimize high-cost operations
-- Time Range: Last 7 days

SELECT
    name as object_name,
    service_type,
    sum(credits_used) as total_credits_used,
    sum(credits_used_compute) as compute_credits,
    sum(credits_used_cloud_services) as cloud_services_credits
FROM snowflake.account_usage.metering_history
WHERE start_time >= dateadd('day', -7, current_timestamp())
GROUP BY name, service_type
ORDER BY total_credits_used DESC
LIMIT 50;
