# Snowflake Data Engineering

A collection of SQL queries for Snowflake administration, monitoring, and optimization. These queries mainly use the `ACCOUNT_USAGE` schema. If any of these queries fail to run, please attempt to troubleshoot. If you have found the fix, please open a PR for the fix and we will review.


## Directory Structure

When we need new category, we will adjust the structure below....

```
.
├── account/          # Account-level analytics and patterns
├── administration/   # Security, monitoring, and operational queries
├── query/           # Query performance and optimization
├── schema/          # Schema and DDL change tracking
├── table/           # Table storage and clustering
└── warehouse/       # Warehouse utilization and costs
```

## Query Categories

### Account-Level Queries

**Location:** `account/`

| Query | Description | Use Case |
|-------|-------------|----------|
| `data_access_patterns.sql` | Queries accessing >10 base objects | Identify broad data access, detect potential exfiltration, audit sensitive data access |
| `warehouse_credit_consumption.sql` | Hourly warehouse credit usage | Track costs by hour, identify usage patterns, optimize schedules |

### Administration & Security

**Location:** `administration/`

#### User & Access Management (9 queries)

| Query | Description | Time Range |
|-------|-------------|------------|
| `active_sessions.sql` | Monitor active user sessions | Last 1 day |
| `user_login_history.sql` | Complete login history (success/failed) | Last 7 days |
| `failed_login_attempts.sql` | Failed logins grouped by user (>5 failures) | Last 7 days |
| `users_without_mfa.sql` | Users without multi-factor authentication | Current state |
| `inactive_users.sql` | Users inactive for 90+ days | Current state |
| `password_policy_violations.sql` | Password-related login failures | Last 7 days |
| `role_grants_by_user.sql` | All active role assignments | Current state |
| `privilege_changes.sql` | Recent privilege modifications | Last 7 days |
| `accountadmin_usage.sql` | Queries executed as ACCOUNTADMIN | Last 7 days |
| `roles_with_dangerous_privileges.sql` | Non-admin roles with elevated privileges | Current state |

#### Storage & Cost Management (8 queries)

| Query | Description | Time Range |
|-------|-------------|------------|
| `database_storage_usage.sql` | Database storage including failsafe | Last 30 days |
| `stage_storage_usage.sql` | Stage storage consumption | Last 30 days |
| `data_transfer_costs.sql` | Cross-region/cloud data transfer | Last 30 days |
| `credit_usage_by_day.sql` | Daily credit consumption by service | Last 30 days |
| `credit_usage_trending.sql` | Weekly credit trends | Last 90 days |
| `top_credit_consumers.sql` | Top 50 credit-consuming objects | Last 7 days |
| `cloud_services_credit_ratio.sql` | Flag days with high cloud services ratio (>10%) | Last 30 days |
| `resource_monitors.sql` | Active resource monitor status | Current state |
| `warehouses_without_resource_monitors.sql` | Warehouses missing cost controls | Current state |

#### Data Pipeline Monitoring (8 queries)

| Query | Description | Time Range |
|-------|-------------|------------|
| `task_run_history.sql` | Complete task execution history | Last 7 days |
| `failed_tasks.sql` | Failed task executions with errors | Last 7 days |
| `long_running_tasks.sql` | Tasks taking >30 minutes | Last 7 days |
| `pipe_usage_history.sql` | Snowpipe metrics and costs | Last 7 days |
| `snowpipe_errors.sql` | Snowpipe errors grouped by type | Last 7 days |
| `copy_history.sql` | COPY INTO operation history | Last 7 days |
| `failed_copy_operations.sql` | Failed COPY operations with errors | Last 7 days |
| `materialized_view_refresh_history.sql` | Materialized view refresh tracking | Last 7 days |

#### Network & Replication (2 queries)

| Query | Description | Time Range |
|-------|-------------|------------|
| `network_policies.sql` | Active network policies and IP configurations | Current state |
| `replication_usage_history.sql` | Database replication costs and volume | Last 7 days |

### Query Performance

**Location:** `query/`

| Query | Description | Time Range |
|-------|-------------|------------|
| `expensive_queries.sql` | Top 50 queries taking >60 seconds | Last 7 days |
| `long_running_queries.sql` | Top 50 queries taking >5 minutes | Last 7 days |
| `failed_queries.sql` | Failed or incident queries | Last 7 days |
| `full_table_scans.sql` | Queries scanning >80% of table partitions | Last 7 days |
| `queries_w_high_spillage.sql` | Queries with local or remote spillage | Last 7 days |
| `queries_with_high_remote_spillage.sql` | Queries spilling to remote storage | Last 7 days |
| `unusual_query_patterns_by_user.sql` | Daily query patterns by user | Last 30 days |
| `query_acceleration_history.sql` | Query acceleration service usage | Last 7 days |

### Schema & DDL Management

**Location:** `schema/`

| Query | Description | Time Range |
|-------|-------------|------------|
| `ddl_change_history.sql` | All DDL changes (CREATE, ALTER, DROP, RENAME, TRUNCATE) | Last 7 days |

### Table Management

**Location:** `table/`

| Query | Description | Time Range |
|-------|-------------|------------|
| `table_storage_growth.sql` | Top 100 tables by storage consumption | Current state |
| `tables_wo_clustering_keys.sql` | Large tables (>1M rows) without clustering keys | Current state |
| `automatic_clustering_history.sql` | Automatic clustering operations and costs | Last 7 days |

### Warehouse Management

**Location:** `warehouse/`

| Query | Description | Time Range |
|-------|-------------|------------|
| `warehouse_utilization.sql` | Warehouse load metrics (running, queued, blocked queries) | Last 7 days |
| `warehouse_credit_usage_by_hour.sql` | Hourly credit consumption by warehouse | Last 7 days |
| `warehouse_query_performance.sql` | Query performance metrics by warehouse | Last 7 days |
| `idle_warehouses.sql` | Warehouses unused for 7+ days | Last 30 days |

## Resources

- [Snowflake Account Usage Documentation](https://docs.snowflake.com/en/sql-reference/account-usage)
- [Snowflake Information Schema](https://docs.snowflake.com/en/sql-reference/info-schema)
- [Snowflake Best Practices](https://docs.snowflake.com/en/user-guide/admin-account-identifier)
