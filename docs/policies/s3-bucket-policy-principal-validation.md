# S3 Bucket Policy Principals Should Be Validated

| Provider            | Category  |
| ------------------- | --------  |
| Amazon Web Services |  Security |

## Description

This control checks that S3 bucket access is restricted to authorized AWS principals, federated users, service principals, IP addresses, or VPCs. This control is compliant if a bucket policy is not present, or if the policy only grants access to approved entities.

Validating S3 bucket policy principals helps prevent unauthorized access by ensuring that only trusted entities can access your S3 data. This is critical for maintaining data confidentiality and preventing data breaches.

This rule is covered by the [s3-bucket-policy-principal-validation](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/s3/s3-bucket-policy-principal-validation.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
    Pass - s3-bucket-policy-principal-validation.sentinel

    Description:
      This policy checks if S3 bucket policies grant access only to authorized principals.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy s3-bucket-policy-principal-validation.

    ✓ Found 0 resource violations

    s3-bucket-policy-principal-validation.sentinel:47:1 - Rule "main"
      Value:
        true
```

---

## Policy Results (Fail)

```bash
trace:
    Fail - s3-bucket-policy-principal-validation.sentinel

    Description:
      This policy checks if S3 bucket policies grant access only to authorized principals.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy s3-bucket-policy-principal-validation.

    ✗ Found 1 resource violations

    → Module name: root
      ↳ Resource Address: aws_s3_bucket_policy.example
        | ✗ failed
        | S3 bucket policy grants access to unauthorized principals. Ensure only approved AWS principals, IPs, or VPCs have access. Refer to https://docs.aws.amazon.com/config/latest/developerguide/s3-bucket-policy-grantee-check.html for more details.


    s3-bucket-policy-principal-validation.sentinel:47:1 - Rule "main"
      Value:
        false
```

---
