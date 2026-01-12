-- Description: Daily credit consumption broken down by service type
-- Use Case: Monitor daily costs, identify cost spikes, track credit usage trends
-- Time Range: Last 30 days

SELECT
    usage_date,
    service_type,
    sum(credits_used) as total_credits
FROM snowflake.account_usage.metering_daily_history
WHERE usage_date >= dateadd('day', -30, current_timestamp())
GROUP BY usage_date, service_type
ORDER BY usage_date DESC, total_credits DESC;
