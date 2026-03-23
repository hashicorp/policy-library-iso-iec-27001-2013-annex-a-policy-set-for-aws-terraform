# DynamoDB tables should be encrypted with KMS

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Encryption   |

## Description

This control checks if Amazon DynamoDB tables are encrypted using AWS Key Management Service (KMS). This control fails if a table is not configured to use AWS KMS encryption, or if the optional `kmsKeyArns` parameter is provided and the configured `kms_key_arn` is not one of the allowed keys.

Encrypting DynamoDB tables with KMS provides enhanced security for sensitive data stored in your tables. In Terraform, this policy validates the `server_side_encryption` block on `aws_dynamodb_table`. When `server_side_encryption.enabled = true` and `kms_key_arn` is omitted, the table uses the default KMS-managed DynamoDB key and is compliant unless `kmsKeyArns` restricts the allowed keys.

This rule is covered by the [dynamo-db-table-encrypted-kms](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/dynamo-db/dynamo-db-table-encrypted-kms.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - dynamo-db-table-encrypted-kms.sentinel

      Description:
        This policy checks if 'aws_dynamodb_table' are encrypted with KMS.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy dynamo-db-table-encrypted-kms.

      ✓ Found 0 resource violations

      dynamo-db-table-encrypted-kms.sentinel:1:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - dynamo-db-table-encrypted-kms.sentinel

      Description:
        This policy checks if 'aws_dynamodb_table' are encrypted with KMS.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy dynamo-db-table-encrypted-kms.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_dynamodb_table.example
          | ✗ failed
          | DynamoDB table must have 'server_side_encryption.enabled' set to true so the table uses AWS KMS encryption instead of the default AWS-owned key. Refer to https://docs.aws.amazon.com/config/latest/developerguide/dynamodb-table-encrypted-kms.html for more details.


      dynamo-db-table-encrypted-kms.sentinel:1:1 - Rule "main"
        Value:
          false
```

---

## Notes

This policy depends only on `aws_dynamodb_table`.

Relevant Terraform attributes:

- `server_side_encryption[].enabled`
- `server_side_encryption[].kms_key_arn`

If `kmsKeyArns` is provided, the policy requires an explicit `kms_key_arn` that matches one of the allowed keys. Without `kmsKeyArns`, `enabled = true` is sufficient even when `kms_key_arn` is omitted, because the provider then uses the default KMS-managed DynamoDB key.