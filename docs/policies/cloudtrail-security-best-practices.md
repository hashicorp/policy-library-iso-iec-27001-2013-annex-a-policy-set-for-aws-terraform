# CloudTrail should follow security best practices

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Logging      |

## Description

This control checks if AWS CloudTrail trails follow security best practices. This control fails if CloudTrail is not configured with recommended security settings such as log file validation, encryption, and proper access controls.

Following CloudTrail security best practices ensures the integrity and confidentiality of audit logs. This includes enabling log file validation to detect tampering, encrypting logs at rest, configuring proper S3 bucket policies, and enabling CloudWatch Logs integration. These measures are essential for maintaining a secure audit trail and meeting compliance requirements.

This rule is covered by the [cloudtrail-security-best-practices](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/cloudtrail/cloudtrail-security-best-practices.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - cloudtrail-security-best-practices.sentinel

      Description:
        This policy checks if 'aws_cloudtrail' follow security best practices.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy cloudtrail-security-best-practices.

      ✓ Found 0 resource violations

      cloudtrail-security-best-practices.sentinel:47:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - cloudtrail-security-best-practices.sentinel

      Description:
        This policy checks if 'aws_cloudtrail' follow security best practices.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy cloudtrail-security-best-practices.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_cloudtrail.example
          | ✗ failed
          | 'aws_cloudtrail' must follow security best practices. Refer to https://docs.aws.amazon.com/awscloudtrail/latest/userguide/best-practices-security.html for more details.


      cloudtrail-security-best-practices.sentinel:47:1 - Rule "main"
        Value:
          false
```

---