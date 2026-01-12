-- Description: Current state of all active resource monitors and their credit limits
-- Use Case: Monitor resource monitor thresholds, track credit consumption against quotas
-- Time Range: Active monitors only

SELECT
    name as monitor_name,
    credit_quota,
    used_credits,
    remaining_credits,
    level,
    frequency,
    start_time,
    end_time,
    notify_at,
    suspend_at,
    suspend_immediate_at
FROM snowflake.account_usage.resource_monitors
WHERE end_time IS NULL OR end_time > current_timestamp()
ORDER BY name;
