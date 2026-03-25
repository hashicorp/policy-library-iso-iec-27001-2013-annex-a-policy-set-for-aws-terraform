# CloudTrail should follow security best practices

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Logging      |

## Description

This control checks if at least one `aws_cloudtrail` trail follows the security settings enforced by this policy. It fails when no trail has logging enabled, records global service events, is multi-region, enables log file validation, uses a KMS key for encryption, and logs all management events for both reads and writes without exclusions.

Following these settings improves the integrity and confidentiality of audit logs. This policy validates fields on the `aws_cloudtrail` resource itself. It does not inspect related S3 bucket policies or CloudWatch Logs integration resources.

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

      cloudtrail-security-best-practices.sentinel:128:1 - Rule "main"
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
        ↳ Resource Address: No compliant CloudTrail trail found
          | ✗ failed
          | No AWS CloudTrail trail found that meets all security best practices. At least one trail must: have logging enabled, record global service events, be multi-region, have log file validation enabled, be encrypted with a KMS key, and log all management events for both reads and writes without exclusions. Refer to https://docs.aws.amazon.com/config/latest/developerguide/cloudtrail-security-trail-enabled.html for more details.


      cloudtrail-security-best-practices.sentinel:128:1 - Rule "main"
        Value:
          false
```

---