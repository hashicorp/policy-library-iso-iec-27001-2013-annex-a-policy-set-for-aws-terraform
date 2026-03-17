# RDS DB instances and clusters should have IAM database authentication enabled

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Database     |

## Description

This policy checks if RDS DB instances and RDS clusters have IAM database authentication enabled. This is a parameterized policy that can check both `aws_db_instance` and `aws_rds_cluster` resources.

IAM database authentication provides an additional layer of security by using AWS IAM to manage database access instead of traditional database passwords. This allows you to leverage IAM's centralized access management, temporary credentials, and audit capabilities.

For DB instances, the policy only checks resources with supported engine types: mysql, postgres, aurora, aurora-mysql, aurora-postgresql, and mariadb.

The policy validates that the `iam_database_authentication_enabled` attribute is set to `true`.

This rule is covered by the [rds-ensure-cluster-and-db-instance-iam-auth-configured](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/rds/rds-ensure-cluster-and-db-instance-iam-auth-configured.sentinel) policy.

## Policy Variants

This policy is registered twice in sentinel.hcl with different parameters:
- `rds-ensure-cluster-iam-auth-configured` - checks RDS clusters (resource_type = "aws_rds_cluster")
- `rds-ensure-db-instance-iam-auth-configured` - checks RDS DB instances (resource_type = "aws_db_instance")

## Policy Results (Pass)
```bash
trace:
      Pass - rds-ensure-cluster-and-db-instance-iam-auth-configured.sentinel

      Description:
        This policy requires resources of type `aws_db_instance` and `aws_rds_cluster` to have `iam_database_authentication_enabled` set to true

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy rds-ensure-cluster-and-db-instance-iam-auth-configured.

      ✓ Found 0 resource violations

      rds-ensure-cluster-and-db-instance-iam-auth-configured.sentinel:62:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - rds-ensure-cluster-and-db-instance-iam-auth-configured.sentinel

      Description:
        This policy requires resources of type `aws_db_instance` and `aws_rds_cluster` to have `iam_database_authentication_enabled` set to true

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy rds-ensure-cluster-and-db-instance-iam-auth-configured.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_db_instance.example
          | ✗ failed
          | Attribute 'iam_database_authentication_enabled' must be set to true for 'aws_db_instance' resources.


      rds-ensure-cluster-and-db-instance-iam-auth-configured.sentinel:62:1 - Rule "main"
        Value:
          false
```

---