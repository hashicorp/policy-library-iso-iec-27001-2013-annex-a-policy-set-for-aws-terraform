# Manual deletion should be disabled for AWS Backup recovery points

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Backup       |

## Description

This control checks if AWS Backup recovery points have manual deletion disabled. This control fails if manual deletion is enabled for backup vaults.

Disabling manual deletion of recovery points prevents accidental or malicious deletion of backups, ensuring that critical data remains protected for the configured retention period. This is a crucial security measure to maintain data integrity and meet compliance requirements by preventing unauthorized backup deletion.

This rule is covered by the [backup-recovery-point-manual-deletion-disabled](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/backup/backup-recovery-point-manual-deletion-disabled.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - backup-recovery-point-manual-deletion-disabled.sentinel

      Description:
        This policy checks if 'aws_backup_vault' have manual deletion disabled for recovery points.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy backup-recovery-point-manual-deletion-disabled.

      ✓ Found 0 resource violations

      backup-recovery-point-manual-deletion-disabled.sentinel:47:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - backup-recovery-point-manual-deletion-disabled.sentinel

      Description:
        This policy checks if 'aws_backup_vault' have manual deletion disabled for recovery points.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy backup-recovery-point-manual-deletion-disabled.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_backup_vault.example
          | ✗ failed
          | 'aws_backup_vault' must have manual deletion disabled for recovery points. Refer to https://docs.aws.amazon.com/aws-backup/latest/devguide/vault-lock.html for more details.


      backup-recovery-point-manual-deletion-disabled.sentinel:47:1 - Rule "main"
        Value:
          false
```

---