# EFS file systems should be covered by compliant backup plans

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Backup       |

## Description

This control checks if Amazon EFS file systems are associated with AWS Backup plans that can create recovery points within the required time period. This control fails if a file system is not covered by a backup selection tied to a compliant backup plan schedule.

AWS Config evaluates whether a recovery point was created within the specified time period, but Terraform plan data does not expose actual recovery point timestamps for EFS file systems. The strongest plan-time evidence available is backup coverage through `aws_backup_selection` together with `aws_backup_plan.rule[].schedule`.

This means the policy depends on managed `aws_efs_file_system` resources plus AWS Backup resources that can protect them. Relevant evidence comes from `aws_backup_selection.resources`, `aws_backup_selection.selection_tag`, `aws_backup_selection.condition`, `aws_backup_selection.not_resources`, and `aws_backup_plan.rule[].schedule`.

`aws_efs_backup_policy` is not used for this rule because it only toggles automatic backups on or off and does not expose a schedule or recovery-point creation timestamp that can be compared to the rule parameters.

This rule is covered by the [efs-recovery-point-compliance](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/efs/efs-recovery-point-compliance.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - efs-recovery-point-compliance.sentinel

      Description:
        This policy checks if 'aws_efs_file_system' resources are covered by compliant AWS Backup plans.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy efs-recovery-point-compliance.

      ✓ Found 0 resource violations

      efs-recovery-point-compliance.sentinel:1:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - efs-recovery-point-compliance.sentinel

      Description:
        This policy checks if 'aws_efs_file_system' resources are covered by compliant AWS Backup plans.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy efs-recovery-point-compliance.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_efs_file_system.example
          | ✗ failed
          | Amazon EFS file system 'aws_efs_file_system.example' is not associated with a compliant AWS Backup plan scheduled within 24 hour(s) (equivalent to 1 days). Refer to https://docs.aws.amazon.com/config/latest/developerguide/efs-last-backup-recovery-point-created.html for more details.


      efs-recovery-point-compliance.sentinel:1:1 - Rule "main"
        Value:
          false
```

---

## Notes

- This policy depends on `aws_efs_file_system`, `aws_backup_selection`, and `aws_backup_plan`.
- Relevant Terraform attributes are `aws_backup_selection.resources`, `aws_backup_selection.selection_tag`, `aws_backup_selection.condition`, `aws_backup_selection.not_resources`, and `aws_backup_plan.rule[].schedule`.
- This is a plan-time approximation of the AWS Config rule because Terraform does not expose actual EFS recovery point timestamps.
- `resourceTags`, `resourceId`, `recoveryPointAgeValue`, and `recoveryPointAgeUnit` are supported.