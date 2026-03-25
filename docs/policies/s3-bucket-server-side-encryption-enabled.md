# S3 Buckets Should Have Server-Side Encryption Enabled

| Provider            | Category  |
| ------------------- | --------  |
| Amazon Web Services |  Security |

## Description

DISCLAIMER - This policy works when all resources are present in root module

This control checks if S3 buckets have default encryption enabled or have bucket policies that explicitly deny put-object requests without server-side encryption using AES-256 or AWS KMS. This control fails if an S3 bucket is not encrypted by default.

Server-side encryption protects data at rest in S3 buckets from unauthorized access. Enabling default encryption ensures that all objects stored in the bucket are automatically encrypted, providing an additional layer of security for sensitive data.

This rule is covered by the [s3-bucket-server-side-encryption-enabled](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/s3/s3-bucket-server-side-encryption-enabled.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
    Pass - s3-bucket-server-side-encryption-enabled.sentinel

    Description:
      This policy checks if S3 buckets have server-side encryption enabled.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy s3-bucket-server-side-encryption-enabled.

    ✓ Found 0 resource violations

    s3-bucket-server-side-encryption-enabled.sentinel:192:1 - Rule "main"
      Value:
        true
```

---

## Policy Results (Fail)

```bash
trace:
    Fail - s3-bucket-server-side-encryption-enabled.sentinel

    Description:
      This policy checks if S3 buckets have server-side encryption enabled.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy s3-bucket-server-side-encryption-enabled.

    ✗ Found 1 resource violations

    → Module name: root
      ↳ Resource Address: aws_s3_bucket.example
        | ✗ failed
        | S3 bucket 'aws_s3_bucket.example' must have default encryption enabled or a bucket policy that explicitly denies put-object requests without server side encryption. Refer to https://docs.aws.amazon.com/config/latest/developerguide/s3-bucket-server-side-encryption-enabled.html for more details.


    s3-bucket-server-side-encryption-enabled.sentinel:192:1 - Rule "main"
      Value:
        false
```

---
