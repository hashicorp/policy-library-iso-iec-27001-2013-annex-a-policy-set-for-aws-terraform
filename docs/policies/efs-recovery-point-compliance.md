# EFS file systems should have compliant recovery points

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Backup       |

## Description

This control checks if Amazon EFS file systems have compliant recovery points created through AWS Backup. This control fails if recovery points do not meet compliance requirements for backup frequency and retention.

Maintaining compliant recovery points ensures that EFS file systems are backed up according to organizational policies and regulatory requirements. Regular, compliant backups are essential for data protection, disaster recovery, and meeting audit requirements. This control verifies that backup schedules are followed and recovery points are available within specified timeframes.

This rule is covered by the [efs-recovery-point-compliance](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/efs/efs-recovery-point-compliance.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - efs-recovery-point-compliance.sentinel

      Description:
        This policy checks if 'aws_efs_file_system' have compliant recovery points.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy efs-recovery-point-compliance.

      ✓ Found 0 resource violations

      efs-recovery-point-compliance.sentinel:47:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - efs-recovery-point-compliance.sentinel

      Description:
        This policy checks if 'aws_efs_file_system' have compliant recovery points.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy efs-recovery-point-compliance.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_efs_file_system.example
          | ✗ failed
          | 'aws_efs_file_system' must have compliant recovery points. Refer to https://docs.aws.amazon.com/aws-backup/latest/devguide/working-with-other-services.html#working-with-other-services-efs for more details.


      efs-recovery-point-compliance.sentinel:47:1 - Rule "main"
        Value:
          false
```

---