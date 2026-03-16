# Secrets in AWS Secrets Manager should be encrypted using customer managed keys

| Provider            | Category  |
| ------------------- | --------  |
| Amazon Web Services | Security  |

## Description

This control checks if all secrets in AWS Secrets Manager are encrypted using customer managed keys (CMK) in AWS Key Management Service (AWS KMS) instead of AWS managed keys. This control fails if a secret is encrypted using the AWS managed key (aws/secretsmanager) or if no KMS key is specified.

Using customer managed KMS keys provides you with more granular control over your encryption keys and enables you to define key rotation policies, access controls, and audit trails. This is essential for compliance with security standards and regulations, and helps protect sensitive data by ensuring only authorized entities can decrypt secrets.

This rule is covered by the [secretsmanager-secrets-encrypted-using-cmk](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/secretsmanager/secretsmanager-secrets-encrypted-using-cmk.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
      Pass - secretsmanager-secrets-encrypted-using-cmk.sentinel

      Description:
        This policy checks if 'aws_secretsmanager_secret' are encrypted using customer managed KMS keys.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy secretsmanager-secrets-encrypted-using-cmk.

      ✓ Found 0 resource violations

      secretsmanager-secrets-encrypted-using-cmk.sentinel:47:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)

```bash
trace:
      Fail - secretsmanager-secrets-encrypted-using-cmk.sentinel

      Description:
        This policy checks if 'aws_secretsmanager_secret' are encrypted using customer managed KMS keys.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy secretsmanager-secrets-encrypted-using-cmk.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_secretsmanager_secret.example
          | ✗ failed
          | Secrets Manager secret 'aws_secretsmanager_secret.example' must be encrypted with a customer managed KMS key (CMK). The 'kms_key_id' attribute is not specified, which means it uses AWS managed keys. Refer to https://docs.aws.amazon.com/config/latest/developerguide/secretsmanager-using-cmk.html for more details.


      secretsmanager-secrets-encrypted-using-cmk.sentinel:47:1 - Rule "main"
        Value:
          false
```

---
