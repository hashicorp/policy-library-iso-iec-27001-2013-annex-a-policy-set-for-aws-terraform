# CloudTrail should have S3 data events enabled

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Logging      |

## Description

This control checks if AWS CloudTrail trails have S3 data events logging enabled. This control fails if S3 data events are not configured for CloudTrail.

S3 data events provide detailed information about object-level API operations performed on S3 buckets, such as GetObject, PutObject, and DeleteObject. Enabling S3 data events logging helps track access to sensitive data, detect unauthorized access patterns, and meet compliance requirements for data access auditing. This is crucial for security monitoring and forensic investigations.

This rule is covered by the [cloudtrail-s3-dataevents-enabled](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/cloudtrail/cloudtrail-s3-dataevents-enabled.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - cloudtrail-s3-dataevents-enabled.sentinel

      Description:
        This policy checks if 'aws_cloudtrail' have S3 data events enabled.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy cloudtrail-s3-dataevents-enabled.

      ✓ Found 0 resource violations

      cloudtrail-s3-dataevents-enabled.sentinel:47:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - cloudtrail-s3-dataevents-enabled.sentinel

      Description:
        This policy checks if 'aws_cloudtrail' have S3 data events enabled.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy cloudtrail-s3-dataevents-enabled.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_cloudtrail.example
          | ✗ failed
          | 'aws_cloudtrail' must have S3 data events enabled. Refer to https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-data-events-with-cloudtrail.html for more details.


      cloudtrail-s3-dataevents-enabled.sentinel:47:1 - Rule "main"
        Value:
          false
```

---