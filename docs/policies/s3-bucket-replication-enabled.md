# S3 Buckets Should Have Replication Enabled

| Provider            | Category  |
| ------------------- | --------  |
| Amazon Web Services |  Backup   |

## Description

This control checks if S3 buckets have replication rules enabled. This control fails if an S3 bucket does not have a replication rule or has a replication rule that is not enabled.

S3 replication automatically copies objects across buckets in different AWS Regions or within the same Region. This provides data redundancy, disaster recovery capabilities, and helps meet compliance requirements for data residency and availability.

This rule is covered by the [s3-bucket-replication-enabled](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/s3/s3-bucket-replication-enabled.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
    Pass - s3-bucket-replication-enabled.sentinel

    Description:
      This policy checks if S3 buckets have replication rules enabled.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy s3-bucket-replication-enabled.

    ✓ Found 0 resource violations

    s3-bucket-replication-enabled.sentinel:47:1 - Rule "main"
      Value:
        true
```

---

## Policy Results (Fail)

```bash
trace:
    Fail - s3-bucket-replication-enabled.sentinel

    Description:
      This policy checks if S3 buckets have replication rules enabled.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy s3-bucket-replication-enabled.

    ✗ Found 1 resource violations

    → Module name: root
      ↳ Resource Address: aws_s3_bucket.example
        | ✗ failed
        | S3 bucket must have replication enabled to ensure data redundancy and disaster recovery capabilities. Refer to https://docs.aws.amazon.com/config/latest/developerguide/s3-bucket-replication-enabled.html for more details.


    s3-bucket-replication-enabled.sentinel:47:1 - Rule "main"
      Value:
        false
```

---
