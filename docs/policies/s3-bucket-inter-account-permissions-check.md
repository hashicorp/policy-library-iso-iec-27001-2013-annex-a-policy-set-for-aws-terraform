# S3 Bucket Policies Should Not Grant More Permissive Inter-Account Access

| Provider            | Category  |
| ------------------- | --------  |
| Amazon Web Services |  Security |

## Description

This control verifies that S3 bucket policies do not allow more permissive inter-account permissions than the control policy you provide. This control fails if bucket policies grant additional cross-account permissions beyond what is specified in the control policy.

Limiting inter-account S3 bucket access helps prevent unauthorized data access from external AWS accounts. By comparing bucket policies against a baseline control policy, you can ensure that only approved cross-account access patterns are permitted.

This rule is covered by the [s3-bucket-inter-account-permissions-check](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/s3/s3-bucket-inter-account-permissions-check.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
    Pass - s3-bucket-inter-account-permissions-check.sentinel

    Description:
      This policy checks if S3 bucket policies grant excessive inter-account permissions.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy s3-bucket-inter-account-permissions-check.

    ✓ Found 0 resource violations

    s3-bucket-inter-account-permissions-check.sentinel:47:1 - Rule "main"
      Value:
        true
```

---

## Policy Results (Fail)

```bash
trace:
    Fail - s3-bucket-inter-account-permissions-check.sentinel

    Description:
      This policy checks if S3 bucket policies grant excessive inter-account permissions.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy s3-bucket-inter-account-permissions-check.

    ✗ Found 1 resource violations

    → Module name: root
      ↳ Resource Address: aws_s3_bucket_policy.example
        | ✗ failed
        | S3 bucket policy grants more permissive inter-account access than allowed by the control policy. Review and restrict cross-account permissions. Refer to https://docs.aws.amazon.com/config/latest/developerguide/s3-bucket-policy-not-more-permissive.html for more details.


    s3-bucket-inter-account-permissions-check.sentinel:47:1 - Rule "main"
      Value:
        false
```

---
