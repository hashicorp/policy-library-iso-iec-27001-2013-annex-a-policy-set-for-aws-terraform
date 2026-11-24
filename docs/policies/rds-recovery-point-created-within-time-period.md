# RDS Recovery Points Should Be Created Within Required Time Period

| Provider            | Category  |
| ------------------- | --------  |
| Amazon Web Services |  Backup   |

## Description

DISCLAIMER - This policy works when all resources are present in root module

This control checks if recovery points were created for Amazon RDS instances within a specified time period. This control fails if an RDS instance does not have a corresponding recovery point created within the required timeframe.

Regular recovery point creation ensures that recent backups are available for data restoration in case of failures or data loss. This is essential for meeting recovery time objectives (RTO) and recovery point objectives (RPO) in disaster recovery planning.

This rule is covered by the [rds-recovery-point-created-within-time-period](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/rds/rds-recovery-point-created-within-time-period.sentinel) policy.

## Parameters

| Parameter | Description | Type | Default | Constraints |
| --- | --- | --- | --- | --- |
| `resourceTags` | Tags of Amazon RDS instances for the rule to check, in JSON format `{"tagkey" : "tagValue"}`. | `string` | `""` | `{ format: json }` |
| `resourceId` | ID of Amazon RDS instance for the rule to check. | `string` | `""` | - |
| `recoveryPointAgeValue` | Numerical value for maximum allowed age. No more than 744 for hours, 31 for days. | `number` | `1` | `{ min: 1, max: 744, integer: true }` |
| `recoveryPointAgeUnit` | Unit of time for maximum allowed age. Accepted values: 'hours', 'days'. | `string` | `"days"` | `{ allowed_values: ["hours", "days"] }` |

## Policy Results (Pass)

```bash
trace:
    Pass - rds-recovery-point-created-within-time-period.sentinel

    Description:
      This policy checks if RDS recovery points were created within the required time period.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy rds-recovery-point-created-within-time-period.

    ✓ Found 0 resource violations

    rds-recovery-point-created-within-time-period.sentinel:47:1 - Rule "main"
      Value:
        true
```

---

## Policy Results (Fail)

```bash
trace:
    Fail - rds-recovery-point-created-within-time-period.sentinel

    Description:
      This policy checks if RDS recovery points were created within the required time period.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy rds-recovery-point-created-within-time-period.

    ✗ Found 1 resource violations

    → Module name: root
      ↳ Resource Address: aws_db_instance.example
        | ✗ failed
        | RDS instance must have a recovery point created within the specified time period to ensure data recoverability. Refer to https://docs.aws.amazon.com/config/latest/developerguide/rds-last-backup-recovery-point-created.html for more details.


    rds-recovery-point-created-within-time-period.sentinel:47:1 - Rule "main"
      Value:
        false
```

---
