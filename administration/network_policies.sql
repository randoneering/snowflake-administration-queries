-- Description: Active network policies and their IP allow/block list configurations
-- Use Case: Security audit of network access controls, review IP restrictions
-- Time Range: Current state (all active policies)

SELECT
    name as policy_name,
    comment,
    entries_in_allowed_ip_list,
    entries_in_blocked_ip_list,
    entries_in_allowed_network_rules,
    entries_in_blocked_network_rules,
    created_on,
    last_altered
FROM snowflake.account_usage.network_policies
WHERE deleted_on IS NULL
ORDER BY name;
