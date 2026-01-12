-- Description: Database replication operations with data transfer volume and credit costs
-- Use Case: Monitor replication costs, track data synchronization between accounts/regions
-- Time Range: Last 7 days

SELECT
    start_time,
    end_time,
    database_name,
    replication_group_name,
    credits_used,
    bytes_transferred / power(1024, 3) as gb_transferred
FROM snowflake.account_usage.replication_usage_history
WHERE start_time >= dateadd('day', -7, current_timestamp())
ORDER BY start_time DESC, credits_used DESC;
