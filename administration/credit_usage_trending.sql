-- Description: Weekly credit usage trends by service type over the last 90 days
-- Use Case: Analyze long-term cost trends, identify seasonal patterns, forecast future costs
-- Time Range: Last 90 days (grouped by week)

SELECT
    date_trunc('week', usage_date) as usage_week,
    service_type,
    sum(credits_used) as weekly_credits,
    sum(credits_used_compute) as compute_credits,
    sum(credits_used_cloud_services) as cloud_services_credits
FROM snowflake.account_usage.metering_daily_history
WHERE usage_date >= dateadd('day', -90, current_timestamp())
GROUP BY date_trunc('week', usage_date), service_type
ORDER BY usage_week DESC, weekly_credits DESC;
