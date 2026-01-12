-- Description: Hourly warehouse credit consumption including compute and cloud services
-- Use Case: Track warehouse costs by hour, identify usage patterns, optimize warehouse schedules
-- Time Range: Last 7 days

SELECT
    warehouse_name,
    date_trunc('hour', start_time) as hour,
    sum(credits_used) as credits_used,
    sum(credits_used_cloud_services) as cloud_services_credits,
FROM snowflake.account_usage.warehouse_metering_history
WHERE start_time >= dateadd('day', -7, current_timestamp())
GROUP BY 1, 2
ORDER BY 2 DESC, 3 DESC;
