# CloudWatch log groups should be encrypted with KMS

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Encryption   |

## Description

This control checks whether `aws_cloudwatch_log_group` resources are encrypted using AWS Key Management Service (KMS). It fails when a log group does not set `kms_key_id`, or when an optional required key parameter is provided and the configured value does not match it.

Encrypting CloudWatch log groups with KMS provides an additional layer of security for sensitive log data. KMS encryption ensures that log data is protected at rest and allows you to control access to encryption keys through IAM policies. This policy validates the `kms_key_id` attribute exposed by the Terraform `aws_cloudwatch_log_group` resource.

This rule is covered by the [cloudwatch-log-group-kms-encryption](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/cloudwatch/cloudwatch-log-group-kms-encryption.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - cloudwatch-log-group-kms-encryption.sentinel

      Description:
        This policy checks if 'aws_cloudwatch_log_group' are encrypted with KMS.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy cloudwatch-log-group-kms-encryption.

      ✓ Found 0 resource violations

      cloudwatch-log-group-kms-encryption.sentinel:93:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - cloudwatch-log-group-kms-encryption.sentinel

      Description:
        This policy checks if 'aws_cloudwatch_log_group' are encrypted with KMS.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy cloudwatch-log-group-kms-encryption.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_cloudwatch_log_group.example
          | ✗ failed
          | CloudWatch Log Group must be encrypted with an AWS KMS key. Attribute 'kms_key_id' is not set. Refer to https://docs.aws.amazon.com/config/latest/developerguide/cloudwatch-log-group-encrypted.html for more details.


      cloudwatch-log-group-kms-encryption.sentinel:93:1 - Rule "main"
        Value:
          false
```

---