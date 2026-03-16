# EBS volumes should be protected by backup plans

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Backup       |

## Description

This control checks if Amazon EBS volumes are protected by AWS Backup plans. This control fails if EBS volumes are not included in a backup plan through backup selections.

Backup plans define when and how to back up your EBS volumes, including backup frequency, retention periods, and lifecycle policies. Ensuring that EBS volumes are protected by backup plans provides automated, scheduled backups that help maintain business continuity and data protection. This is essential for disaster recovery and meeting compliance requirements for data retention.

This rule is covered by the [ebs-volumes-backup-plan-protection](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ec2/ebs-volumes-backup-plan-protection.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - ebs-volumes-backup-plan-protection.sentinel

      Description:
        This policy checks if 'aws_ebs_volume' are protected by backup plans.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy ebs-volumes-backup-plan-protection.

      ✓ Found 0 resource violations

      ebs-volumes-backup-plan-protection.sentinel:47:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - ebs-volumes-backup-plan-protection.sentinel

      Description:
        This policy checks if 'aws_ebs_volume' are protected by backup plans.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy ebs-volumes-backup-plan-protection.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_ebs_volume.example
          | ✗ failed
          | 'aws_ebs_volume' must be protected by backup plans. Refer to https://docs.aws.amazon.com/aws-backup/latest/devguide/creating-a-backup-plan.html for more details.


      ebs-volumes-backup-plan-protection.sentinel:47:1 - Rule "main"
        Value:
          false
```

---