# DMS replication tasks should have logging enabled

| Provider            | Category        |
|---------------------|-----------------|
| Amazon Web Services | Database        |

## Description

This policy checks if AWS DMS replication task resources have logging enabled in their replication task settings. This is a parameterized policy that can check logging for both source and target databases.

Enabling logging for DMS replication tasks helps in monitoring and troubleshooting data migration activities. It provides visibility into the replication process and helps identify issues during data transfer.

The policy validates that:
- The `replication_task_settings` attribute is present
- Logging is enabled (`EnableLogging: true`)
- Log components are configured for the specified database type (source or target)
- Logging severity is set to an accepted level (LOGGER_SEVERITY_DEFAULT, LOGGER_SEVERITY_DEBUG, or LOGGER_SEVERITY_DETAILED_DEBUG)

This rule is covered by the [dms-replication-task-logging-enabled](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/dms/dms-replication-task-logging-enabled.sentinel) policy.

## Policy Variants

This policy is registered twice in sentinel.hcl with different parameters:
- `dms-replication-task-targetdb-logging-enabled` - checks target database logging (db_type = "target")
- `dms-replication-task-sourcedb-logging-enabled` - checks source database logging (db_type = "source")

## Policy Results (Pass)
```bash
trace:
      Pass - dms-replication-task-logging-enabled.sentinel

      Description:
        This policy checks if resources of type 'aws_dms_replication_task' have the 'replication_task_settings'
        have logging enabled

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy dms-replication-task-logging-enabled.

      ✓ Found 0 resource violations

      dms-replication-task-logging-enabled.sentinel:87:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - dms-replication-task-logging-enabled.sentinel

      Description:
        This policy checks if resources of type 'aws_dms_replication_task' have the 'replication_task_settings'
        have logging enabled

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy dms-replication-task-logging-enabled.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_dms_replication_task.example
          | ✗ failed
          | Attribute 'replication_task_settings' should have the logging enabled for AWS DMS Replication Task. Refer to https://docs.aws.amazon.com/config/latest/developerguide/dms-replication-task-targetdb-logging.html for more details.


      dms-replication-task-logging-enabled.sentinel:87:1 - Rule "main"
        Value:
          false
```

---