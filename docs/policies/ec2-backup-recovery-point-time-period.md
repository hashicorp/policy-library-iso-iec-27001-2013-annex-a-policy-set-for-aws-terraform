# EBS volumes should have recovery points created within specified time period

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Backup       |

## Description

This control checks whether Amazon EBS volumes are configured with AWS Backup coverage that can create recovery points within a specified time period. In Terraform, the policy treats a volume as compliant when an aws_backup_selection includes it directly by ARN or Terraform reference, through wildcard EBS volume resource patterns, through matching selection_tag values, or through matching condition filters, and that selection points to an aws_backup_plan whose rule.schedule is at least as frequent as the configured recovery-point age threshold.

Terraform plan data does not expose the runtime timestamp of the last created recovery point for EBS volumes. This policy therefore validates configured backup coverage and schedule frequency rather than proving that a recovery point already exists at apply time.

This rule is covered by the [ec2-backup-recovery-point-time-period](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-backup-recovery-point-time-period.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - ec2-backup-recovery-point-time-period.sentinel

      Description:
        This policy checks if 'aws_ebs_volume' are associated with compliant AWS Backup coverage.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy ec2-backup-recovery-point-time-period.

      ✓ Found 0 resource violations

      ec2-backup-recovery-point-time-period.sentinel:1:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - ec2-backup-recovery-point-time-period.sentinel

      Description:
        This policy checks if 'aws_ebs_volume' are associated with compliant AWS Backup coverage.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy ec2-backup-recovery-point-time-period.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_ebs_volume.example
          | ✗ failed
          | Amazon EBS volume 'aws_ebs_volume.example' is not associated with a compliant AWS Backup plan scheduled within 24 hour(s) (equivalent to 1 days). Refer to https://docs.aws.amazon.com/config/latest/developerguide/ebs-last-backup-recovery-point-created.html for more details.


      ec2-backup-recovery-point-time-period.sentinel:1:1 - Rule "main"
        Value:
          false
```

---

## Notes

- This policy depends on aws_ebs_volume, aws_backup_selection, and aws_backup_plan.
- Relevant Terraform attributes are aws_ebs_volume.arn, aws_ebs_volume.id, aws_ebs_volume.tags, aws_backup_selection.resources, aws_backup_selection.selection_tag, aws_backup_selection.condition, aws_backup_selection.not_resources, aws_backup_selection.plan_id, and aws_backup_plan.rule[].schedule.
- The aws_instance resource is not the governing dependency for this rule. Although instance docs expose some embedded block-device information, AWS Config rule EBS_LAST_BACKUP_RECOVERY_POINT_CREATED evaluates EBS volumes, so this policy correctly models volume-level resources instead.