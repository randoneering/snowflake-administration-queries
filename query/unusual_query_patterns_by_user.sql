-- Description: Daily query patterns by user showing volume and resource consumption
-- Use Case: Identify unusual user activity, detect anomalies, monitor user behavior trends
-- Time Range: Last 30 days

SELECT
    user_name,
    date_trunc('day', start_time) as day,
    count(*) as query_count,
    sum(total_elapsed_time)/1000 as total_seconds,
    avg(total_elapsed_time)/1000 as avg_seconds,
    sum(rows_produced) as total_rows,
    sum(bytes_scanned) as total_bytes_scanned
FROM snowflake.account_usage.query_history
WHERE start_time >= dateadd('day', -30, current_timestamp())
GROUP BY 1, 2
ORDER BY 3 DESC;
