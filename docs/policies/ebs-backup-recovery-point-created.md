# EBS volumes should have recovery points created

| Provider            | Category |
|---------------------|----------|
| Amazon Web Services | Backup   |

## Description


DISCLAIMER - This policy works when all resources are present in root module

This control checks whether Amazon EBS volumes are configured with AWS Backup coverage that can create recovery points within the required time period. In Terraform, the policy treats a volume as compliant when it is associated with an `aws_backup_selection` that targets the volume directly, by wildcard resource pattern, or by matching `selection_tag`, and that selection points to an `aws_backup_plan` whose `rule[].schedule` is at least as frequent as the configured recovery-point age window.

Terraform plan data does not expose actual last recovery-point timestamps for EBS volumes. The policy therefore validates configured backup coverage rather than proving that a recovery point was already created at runtime.

This rule is covered by the [ebs-backup-recovery-point-created](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ec2/ebs-backup-recovery-point-created.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - ebs-backup-recovery-point-created.sentinel

      Description:
        This policy checks if 'aws_ebs_volume' are associated with compliant AWS Backup coverage.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy ebs-backup-recovery-point-created.

      ✓ Found 0 resource violations
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - ebs-backup-recovery-point-created.sentinel

      Description:
        This policy checks if 'aws_ebs_volume' are associated with compliant AWS Backup coverage.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy ebs-backup-recovery-point-created.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_ebs_volume.example
          | ✗ failed
          | Amazon EBS volume 'aws_ebs_volume.example' is not associated with a compliant AWS Backup plan scheduled within 24 hour(s) (equivalent to 1 days). Refer to https://docs.aws.amazon.com/config/latest/developerguide/ebs-last-backup-recovery-point-created.html for more details.
```

---

## Notes

- This policy depends on `aws_ebs_volume`, `aws_backup_selection`, and `aws_backup_plan`.
- Relevant Terraform attributes are `aws_ebs_volume.arn`, `aws_ebs_volume.id`, `aws_ebs_volume.tags`, `aws_backup_selection.resources`, `aws_backup_selection.selection_tag`, `aws_backup_selection.plan_id`, and `aws_backup_plan.rule[].schedule`.
- `aws_backup_vault.recovery_points` is only a count in Terraform, so the policy does not rely on vault contents or recovery-point timestamps.