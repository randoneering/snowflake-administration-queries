-- Description: Top 50 queries scanning more than 80% of table partitions
-- Use Case: Identify inefficient queries, opportunities to add filters or clustering keys
-- Time Range: Last 7 days

SELECT
    query_id,
    user_name,
    warehouse_name,
    partitions_scanned,
    partitions_total,
    (partitions_scanned::float / nullif(partitions_total, 0)) * 100 as scan_percentage,
    bytes_scanned/(1024*1024*1024) as gb_scanned,
    total_elapsed_time/1000 as seconds,
    query_text
FROM snowflake.account_usage.query_history
WHERE start_time >= dateadd('day', -7, current_timestamp())
    AND partitions_total > 0
    AND (partitions_scanned::float / partitions_total) > 0.8  -- >80% scanned
ORDER BY bytes_scanned DESC
LIMIT 50;
