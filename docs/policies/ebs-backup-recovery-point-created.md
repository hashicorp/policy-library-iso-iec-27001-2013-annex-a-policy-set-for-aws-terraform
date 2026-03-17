# EBS volumes should have recovery points created

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Backup       |

## Description

This control checks if Amazon EBS volumes have recovery points created through AWS Backup. This control fails if no recovery points exist for the EBS volume.

Recovery points are backups of your EBS volumes that can be used to restore data in case of accidental deletion, corruption, or disaster. Having recovery points ensures business continuity and data protection by enabling point-in-time recovery. Regular backups are essential for meeting compliance requirements and maintaining data integrity for critical storage volumes.

This rule is covered by the [ebs-backup-recovery-point-created](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ec2/ebs-backup-recovery-point-created.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - ebs-backup-recovery-point-created.sentinel

      Description:
        This policy checks if 'aws_ebs_volume' have recovery points created.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy ebs-backup-recovery-point-created.

      ✓ Found 0 resource violations

      ebs-backup-recovery-point-created.sentinel:47:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - ebs-backup-recovery-point-created.sentinel

      Description:
        This policy checks if 'aws_ebs_volume' have recovery points created.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy ebs-backup-recovery-point-created.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_ebs_volume.example
          | ✗ failed
          | 'aws_ebs_volume' must have recovery points created. Refer to https://docs.aws.amazon.com/aws-backup/latest/devguide/working-with-other-services.html#working-with-other-services-ebs for more details.


      ebs-backup-recovery-point-created.sentinel:47:1 - Rule "main"
        Value:
          false
```

---