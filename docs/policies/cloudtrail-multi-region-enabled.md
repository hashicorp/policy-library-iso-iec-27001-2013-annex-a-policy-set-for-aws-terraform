# Multi-Region CloudTrail Should Be Enabled

| Provider            | Category  |
| ------------------- | --------  |
| Amazon Web Services |  Logging  |

## Description

This control checks whether there is at least one multi-region AWS CloudTrail trail configured. This control fails if no multi-region trail exists, or if the trail excludes management events such as AWS Key Management Service (KMS) or Amazon RDS Data API events.

CloudTrail records AWS API calls and related events made by or on behalf of an AWS account. Multi-region trails help ensure that all API activity across all AWS regions is logged, which is essential for security monitoring, compliance auditing, and forensic investigation.

This rule is covered by the [cloudtrail-multi-region-enabled](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/cloudtrail/cloudtrail-multi-region-enabled.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
    Pass - cloudtrail-multi-region-enabled.sentinel

    Description:
      This policy checks whether there is at least one multi-region AWS CloudTrail trail configured.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy cloudtrail-multi-region-enabled.

    ✓ Found 0 resource violations

    cloudtrail-multi-region-enabled.sentinel:47:1 - Rule "main"
      Value:
        true
```

---

## Policy Results (Fail)

```bash
trace:
    Fail - cloudtrail-multi-region-enabled.sentinel

    Description:
      This policy checks whether there is at least one multi-region AWS CloudTrail trail configured.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy cloudtrail-multi-region-enabled.

    ✗ Found 1 resource violations

    → Module name: root
      ↳ Resource Address: aws_cloudtrail.example
        | ✗ failed
        | CloudTrail must be configured as a multi-region trail with all management events enabled. Refer to https://docs.aws.amazon.com/config/latest/developerguide/multi-region-cloudtrail-enabled.html for more details.


    cloudtrail-multi-region-enabled.sentinel:47:1 - Rule "main"
      Value:
        false
```

---
