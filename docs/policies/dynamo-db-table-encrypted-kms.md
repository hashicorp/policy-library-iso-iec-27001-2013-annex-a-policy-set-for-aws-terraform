# DynamoDB tables should be encrypted with KMS

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Encryption   |

## Description

This control checks if Amazon DynamoDB tables are encrypted using AWS Key Management Service (KMS). This control fails if DynamoDB tables are not encrypted with a customer-managed KMS key.

Encrypting DynamoDB tables with KMS provides enhanced security for sensitive data stored in your tables. KMS encryption ensures that data is protected at rest and allows you to control access to encryption keys through IAM policies. Using customer-managed KMS keys instead of AWS-managed keys provides additional control over key rotation, access policies, and audit trails, which is essential for meeting compliance requirements.

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

      dynamo-db-table-encrypted-kms.sentinel:47:1 - Rule "main"
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
          | 'aws_dynamodb_table' must be encrypted with KMS. Refer to https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/EncryptionAtRest.html for more details.


      dynamo-db-table-encrypted-kms.sentinel:47:1 - Rule "main"
        Value:
          false
```

---