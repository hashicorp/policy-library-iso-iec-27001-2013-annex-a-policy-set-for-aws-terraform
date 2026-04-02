# EBS volumes should be protected by backup plans

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Backup       |

## Description

DISCLAIMER - This policy works when all resources are present in root module

This control checks if Amazon EBS volumes are included in AWS Backup plans. In Terraform, the policy treats a volume as compliant when an `aws_backup_selection` includes it directly by ARN or Terraform reference, through an EBS wildcard resource pattern, through `selection_tag`, or through a matching `condition` filter, and the same selection does not exclude the volume with `not_resources`.

This aligns with AWS Config rule `EBS_IN_BACKUP_PLAN`, whose intent is to verify inclusion in AWS Backup plans rather than to validate backup frequency or recovery-point age.

This rule is covered by the [ebs-volumes-backup-plan-protection](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ec2/ebs-volumes-backup-plan-protection.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - ebs-volumes-backup-plan-protection.sentinel

      Description:
        This policy checks if 'aws_ebs_volume' are included in AWS Backup plans.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy ebs-volumes-backup-plan-protection.

      ✓ Found 0 resource violations

      ebs-volumes-backup-plan-protection.sentinel:1:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - ebs-volumes-backup-plan-protection.sentinel

      Description:
        This policy checks if 'aws_ebs_volume' are included in AWS Backup plans.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy ebs-volumes-backup-plan-protection.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_ebs_volume.example
          | ✗ failed
          | EBS volume is not protected by any backup plan. Ensure all EBS volumes are included in AWS Backup plans. Refer to https://docs.aws.amazon.com/config/latest/developerguide/ebs-in-backup-plan.html for more details.


      ebs-volumes-backup-plan-protection.sentinel:1:1 - Rule "main"
        Value:
          false
```

---

## Notes

- This policy depends on `aws_ebs_volume` and `aws_backup_selection`.
- Relevant Terraform attributes are `aws_ebs_volume.arn`, `aws_ebs_volume.id`, `aws_ebs_volume.tags`, `aws_backup_selection.resources`, `aws_backup_selection.selection_tag`, `aws_backup_selection.condition`, and `aws_backup_selection.not_resources`.
- `aws_backup_plan` is not required in the Terraform plan for this policy because `aws_backup_selection.plan_id` already represents inclusion in a backup plan.