-- Description: Hourly credit consumption by warehouse (compute and cloud services)
-- Use Case: Track warehouse costs over time, identify peak usage periods, optimize warehouse schedules
-- Time Range: Last 7 days

SELECT
    start_time,
    warehouse_name,
    sum(credits_used) as total_credits,
    sum(credits_used_compute) as compute_credits,
    sum(credits_used_cloud_services) as cloud_services_credits
FROM snowflake.account_usage.warehouse_metering_history
WHERE start_time >= dateadd('day', -7, current_timestamp())
GROUP BY start_time, warehouse_name
ORDER BY start_time DESC, total_credits DESC;
