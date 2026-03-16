# EC2 instances should have recovery points created within specified time period

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Backup       |

## Description

This control checks if Amazon EC2 instances have recovery points created within a specified time period. This control fails if the most recent recovery point is older than the defined time threshold.

Regular and timely backups are essential for maintaining data protection and business continuity. Ensuring that recovery points are created within a specified time period helps minimize data loss in case of failures or disasters. This control verifies that backup schedules are being followed and that recent recovery points are available for restoration.

This rule is covered by the [ec2-backup-recovery-point-time-period](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-backup-recovery-point-time-period.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - ec2-backup-recovery-point-time-period.sentinel

      Description:
        This policy checks if 'aws_instance' have recovery points created within specified time period.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy ec2-backup-recovery-point-time-period.

      ✓ Found 0 resource violations

      ec2-backup-recovery-point-time-period.sentinel:47:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - ec2-backup-recovery-point-time-period.sentinel

      Description:
        This policy checks if 'aws_instance' have recovery points created within specified time period.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy ec2-backup-recovery-point-time-period.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_instance.example
          | ✗ failed
          | 'aws_instance' must have recovery points created within specified time period. Refer to https://docs.aws.amazon.com/aws-backup/latest/devguide/recovery-points.html for more details.


      ec2-backup-recovery-point-time-period.sentinel:47:1 - Rule "main"
        Value:
          false
```

---