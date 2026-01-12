-- Description: Track data transfer/egress between clouds and regions
-- Use Case: Monitor cross-region and cross-cloud data transfer costs, optimize data architecture
-- Time Range: Last 30 days

SELECT
    start_time,
    end_time,
    source_cloud,
    source_region,
    target_cloud,
    target_region,
    bytes_transferred / power(1024, 3) as gb_transferred,
    transfer_type
FROM snowflake.account_usage.data_transfer_history
WHERE start_time >= dateadd('day', -30, current_timestamp())
ORDER BY start_time DESC;
