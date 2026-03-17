# S3 Bucket Policies Should Not Allow Blacklisted Actions

| Provider            | Category  |
| ------------------- | --------  |
| Amazon Web Services |  Security |

## Description

This control checks if S3 bucket policies allow blacklisted bucket-level and object-level actions for principals from other AWS accounts. This control fails if any blacklisted actions are allowed by the S3 bucket policy.

Restricting specific S3 actions helps prevent unauthorized data access, modification, or deletion. Blacklisted actions typically include dangerous operations like DeleteBucket, DeleteObject, or PutBucketPolicy that could compromise data security when granted to external accounts.

This rule is covered by the [s3-bucket-blacklisted-actions-prohibited](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/s3/s3-bucket-blacklisted-actions-prohibited.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
    Pass - s3-bucket-blacklisted-actions-prohibited.sentinel

    Description:
      This policy checks if S3 bucket policies prohibit blacklisted actions for external accounts.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy s3-bucket-blacklisted-actions-prohibited.

    ✓ Found 0 resource violations

    s3-bucket-blacklisted-actions-prohibited.sentinel:47:1 - Rule "main"
      Value:
        true
```

---

## Policy Results (Fail)

```bash
trace:
    Fail - s3-bucket-blacklisted-actions-prohibited.sentinel

    Description:
      This policy checks if S3 bucket policies prohibit blacklisted actions for external accounts.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy s3-bucket-blacklisted-actions-prohibited.

    ✗ Found 1 resource violations

    → Module name: root
      ↳ Resource Address: aws_s3_bucket_policy.example
        | ✗ failed
        | S3 bucket policy allows blacklisted actions for external AWS accounts. Remove dangerous permissions to maintain data security. Refer to https://docs.aws.amazon.com/config/latest/developerguide/s3-bucket-blacklisted-actions-prohibited.html for more details.


    s3-bucket-blacklisted-actions-prohibited.sentinel:47:1 - Rule "main"
      Value:
        false
```

---
