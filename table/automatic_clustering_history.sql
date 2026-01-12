-- Description: Automatic clustering operations with data volume and credit costs
-- Use Case: Monitor clustering maintenance costs, evaluate clustering key effectiveness
-- Time Range: Last 7 days

SELECT
    start_time,
    end_time,
    database_name,
    schema_name,
    table_name,
    credits_used,
    num_bytes_reclustered / power(1024, 3) as gb_reclustered,
    num_rows_reclustered
FROM snowflake.account_usage.automatic_clustering_history
WHERE start_time >= dateadd('day', -7, current_timestamp())
ORDER BY start_time DESC, credits_used DESC;
