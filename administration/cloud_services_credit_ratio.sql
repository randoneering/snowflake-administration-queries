-- Description: Flag days when cloud services credits exceed 10% of compute credits
-- Use Case: Monitor cloud services billing, identify inefficient query patterns (excessive metadata operations)
-- Time Range: Last 30 days

SELECT
    usage_date,
    service_type,
    sum(credits_used_compute) as compute_credits,
    sum(credits_used_cloud_services) as cloud_services_credits,
    div0(sum(credits_used_cloud_services), sum(credits_used_compute)) * 100 as cloud_services_percent
FROM snowflake.account_usage.metering_daily_history
WHERE usage_date >= dateadd('day', -30, current_timestamp())
    AND service_type = 'WAREHOUSE_METERING'
GROUP BY usage_date, service_type
HAVING cloud_services_percent > 10  -- Flag if cloud services > 10%
ORDER BY usage_date DESC;
