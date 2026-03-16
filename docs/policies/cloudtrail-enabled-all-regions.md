# CloudTrail should be enabled in all regions

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Logging      |

## Description

This control checks if AWS CloudTrail is enabled in all regions. This control fails if CloudTrail is not configured to log events in all AWS regions.

CloudTrail provides a record of actions taken by users, roles, or AWS services across all regions in your AWS account. Enabling CloudTrail in all regions ensures comprehensive visibility and audit trails for security analysis, resource change tracking, and compliance auditing. This is essential for detecting unauthorized access, troubleshooting operational issues, and meeting regulatory requirements.

This rule is covered by the [cloudtrail-enabled-all-regions](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/cloudtrail/cloudtrail-enabled-all-regions.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - cloudtrail-enabled-all-regions.sentinel

      Description:
        This policy checks if 'aws_cloudtrail' is enabled in all regions.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy cloudtrail-enabled-all-regions.

      ✓ Found 0 resource violations

      cloudtrail-enabled-all-regions.sentinel:47:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - cloudtrail-enabled-all-regions.sentinel

      Description:
        This policy checks if 'aws_cloudtrail' is enabled in all regions.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy cloudtrail-enabled-all-regions.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_cloudtrail.example
          | ✗ failed
          | 'aws_cloudtrail' must be enabled in all regions. Refer to https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-concepts.html#cloudtrail-concepts-trails for more details.


      cloudtrail-enabled-all-regions.sentinel:47:1 - Rule "main"
        Value:
          false
```

---