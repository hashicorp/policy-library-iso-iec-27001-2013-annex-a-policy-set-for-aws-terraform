# DynamoDB tables should have encryption enabled

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Encryption   |

## Description

This control checks if Amazon DynamoDB tables have encryption enabled. In Terraform, a table is compliant either when the `server_side_encryption` block sets `enabled = true`, or when the block is omitted and DynamoDB falls back to its default encryption at rest.

Encrypting DynamoDB tables ensures that data is protected at rest, preventing unauthorized access to sensitive information stored in your tables. DynamoDB encryption uses AWS-owned, AWS-managed, or customer-managed keys to encrypt table data, indexes, streams, and backups. The AWS Config rule describes status values such as enabled or enabling, but Terraform plan data only exposes the configured encryption block, not the runtime encryption status transition.

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

      dynamo-db-table-encryption-enabled.sentinel:1:1 - Rule "main"
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
          | DynamoDB table 'aws_dynamodb_table.example' must have encryption enabled. The 'enabled' attribute in the server_side_encryption block must be set to true. Refer to https://docs.aws.amazon.com/config/latest/developerguide/dynamodb-table-encryption-enabled.html for more details.


      dynamo-db-table-encryption-enabled.sentinel:1:1 - Rule "main"
        Value:
          false
```

---

## Notes

This policy depends only on `aws_dynamodb_table`.

Relevant Terraform attribute:

- `server_side_encryption[].enabled`

If the `server_side_encryption` block is omitted, DynamoDB still encrypts the table at rest by default, so the table remains compliant for this rule.