# DynamoDB tables should have recovery points created

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Backup       |

## Description

DISCLAIMER - This policy works when all resources are present in root module

This control checks whether Amazon DynamoDB tables are configured with recovery coverage that can create recovery points. In Terraform, the policy treats a table as compliant when either `point_in_time_recovery.enabled = true` is set on `aws_dynamodb_table` or the table is associated with an `aws_backup_selection` that points to an `aws_backup_plan` with a schedule that is at least as frequent as the configured recovery-point age window.

Recovery points are backups of your DynamoDB tables that can be used to restore data in case of accidental deletion, corruption, or disaster. Having recovery points ensures business continuity and data protection by enabling point-in-time recovery. Because Terraform plan data does not expose the timestamp of the last created recovery point, this policy validates the configured protection path and backup schedule rather than the existence of an already-created recovery point.

This rule is covered by the [dynamo-db-recovery-point-created](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/dynamo-db/dynamo-db-recovery-point-created.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - dynamo-db-recovery-point-created.sentinel

      Description:
        This policy checks if 'aws_dynamodb_table' have recovery coverage configured.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy dynamo-db-recovery-point-created.

      ✓ Found 0 resource violations

      dynamo-db-recovery-point-created.sentinel:1:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - dynamo-db-recovery-point-created.sentinel

      Description:
        This policy checks if 'aws_dynamodb_table' have recovery coverage configured.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy dynamo-db-recovery-point-created.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_dynamodb_table.example
          | ✗ failed
          | DynamoDB table 'aws_dynamodb_table.example' does not have point-in-time recovery enabled and is not associated with a compliant AWS Backup plan scheduled within 24 hour(s) (equivalent to 1 days). Refer to https://docs.aws.amazon.com/config/latest/developerguide/dynamodb-last-backup-recovery-point-created.html for more details.


      dynamo-db-recovery-point-created.sentinel:1:1 - Rule "main"
        Value:
          false
```

---

## Notes

This policy depends on these Terraform resources when AWS Backup is used:

- `aws_dynamodb_table`
- `aws_backup_selection`
- `aws_backup_plan`

If your configuration relies on AWS Backup, the table must be selected by resource ARN or matching `selection_tag` values, and the referenced backup plan must include a `rule.schedule` frequent enough to satisfy the configured age window.