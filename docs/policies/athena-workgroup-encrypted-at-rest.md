# Athena workgroups should be encrypted at rest

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Encryption   |

## Description

This control checks if Amazon Athena workgroups have encryption at rest configured for query results. This control fails if the workgroup does not configure valid query result encryption in its result configuration, or when KMS-based encryption is selected without the required KMS key attribute.

Athena workgroups allow you to isolate queries for different teams, applications, or workloads. Encrypting query results at rest ensures that sensitive data returned by queries is protected from unauthorized access. This is a critical security measure for maintaining data confidentiality and meeting compliance requirements.

This rule is covered by the [athena-workgroup-encrypted-at-rest](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/athena/athena-workgroup-encrypted-at-rest.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - athena-workgroup-encrypted-at-rest.sentinel

      Description:
        This policy checks if 'aws_athena_workgroup' have encryption at rest configured.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy athena-workgroup-encrypted-at-rest.

      ✓ Found 0 resource violations

      athena-workgroup-encrypted-at-rest.sentinel:47:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - athena-workgroup-encrypted-at-rest.sentinel

      Description:
        This policy checks if 'aws_athena_workgroup' have encryption at rest configured.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy athena-workgroup-encrypted-at-rest.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_athena_workgroup.example
          | ✗ failed
          | 'aws_athena_workgroup' must have encryption at rest configured. Refer to https://docs.aws.amazon.com/athena/latest/ug/encryption.html for more details.


      athena-workgroup-encrypted-at-rest.sentinel:47:1 - Rule "main"
        Value:
          false
```

---