# RDS Aurora Databases Should Be Included in Backup Plans

| Provider            | Category  |
| ------------------- | --------  |
| Amazon Web Services |  Backup   |

## Description

DISCLAIMER - This policy works when all resources are present in root module

This control checks if Amazon RDS Aurora databases are included in AWS Backup plans. This control fails if RDS Aurora databases are not included in any AWS Backup plan.

Including RDS databases in AWS Backup plans ensures that your data is regularly backed up and can be recovered in case of data loss, corruption, or disaster. This is a critical component of business continuity and disaster recovery strategies.

This rule is covered by the [rds-aurora-in-backup-plan](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/rds/rds-aurora-in-backup-plan.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
    Pass - rds-aurora-in-backup-plan.sentinel

    Description:
      This policy checks if RDS Aurora databases are included in AWS Backup plans.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy rds-aurora-in-backup-plan.

    ✓ Found 0 resource violations

    rds-aurora-in-backup-plan.sentinel:47:1 - Rule "main"
      Value:
        true
```

---

## Policy Results (Fail)

```bash
trace:
    Fail - rds-aurora-in-backup-plan.sentinel

    Description:
      This policy checks if RDS Aurora databases are included in AWS Backup plans.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy rds-aurora-in-backup-plan.

    ✗ Found 1 resource violations

    → Module name: root
      ↳ Resource Address: aws_rds_cluster.example
        | ✗ failed
        | RDS Aurora database must be included in an AWS Backup plan to ensure data protection and recovery capabilities. Refer to https://docs.aws.amazon.com/config/latest/developerguide/rds-in-backup-plan.html for more details.


    rds-aurora-in-backup-plan.sentinel:47:1 - Rule "main"
      Value:
        false
```

---
