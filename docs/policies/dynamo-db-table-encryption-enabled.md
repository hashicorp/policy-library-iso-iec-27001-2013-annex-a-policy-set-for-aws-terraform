# DynamoDB tables should have encryption enabled

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Encryption   |

## Description

This control checks if Amazon DynamoDB tables have encryption enabled. This control fails if encryption is not configured for DynamoDB tables.

Encrypting DynamoDB tables ensures that data is protected at rest, preventing unauthorized access to sensitive information stored in your tables. DynamoDB encryption uses AWS-managed or customer-managed keys to encrypt table data, indexes, streams, and backups. Enabling encryption is a fundamental security practice for protecting data confidentiality and meeting compliance requirements.

This rule is covered by the [dynamo-db-table-encryption-enabled](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/dynamo-db/dynamo-db-table-encryption-enabled.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - dynamo-db-table-encryption-enabled.sentinel

      Description:
        This policy checks if 'aws_dynamodb_table' have encryption enabled.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy dynamo-db-table-encryption-enabled.

      ✓ Found 0 resource violations

      dynamo-db-table-encryption-enabled.sentinel:47:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - dynamo-db-table-encryption-enabled.sentinel

      Description:
        This policy checks if 'aws_dynamodb_table' have encryption enabled.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy dynamo-db-table-encryption-enabled.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_dynamodb_table.example
          | ✗ failed
          | 'aws_dynamodb_table' must have encryption enabled. Refer to https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/EncryptionAtRest.html for more details.


      dynamo-db-table-encryption-enabled.sentinel:47:1 - Rule "main"
        Value:
          false
```

---