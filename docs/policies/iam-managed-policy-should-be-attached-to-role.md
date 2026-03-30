# IAM Roles Should Have Required Managed Policies Attached

| Provider            | Category  |
| ------------------- | --------  |
| Amazon Web Services |  Security |

## Description

DISCLAIMER - This policy works when all resources are present in root module

This control checks if all required managed policies are attached to AWS Identity and Access Management (IAM) roles. This control fails if a required managed policy is not attached to the IAM role.

Ensuring that IAM roles have the appropriate managed policies attached helps maintain consistent permissions across your AWS environment and ensures that roles have the necessary permissions to perform their intended functions securely.

This rule is covered by the [iam-managed-policy-should-be-attached-to-role](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/iam/iam-managed-policy-should-be-attached-to-role.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
    Pass - iam-managed-policy-should-be-attached-to-role.sentinel

    Description:
      This policy checks if required managed policies are attached to IAM roles.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy iam-managed-policy-should-be-attached-to-role.

    ✓ Found 0 resource violations

    iam-managed-policy-should-be-attached-to-role.sentinel:47:1 - Rule "main"
      Value:
        true
```

---

## Policy Results (Fail)

```bash
trace:
    Fail - iam-managed-policy-should-be-attached-to-role.sentinel

    Description:
      This policy checks if required managed policies are attached to IAM roles.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy iam-managed-policy-should-be-attached-to-role.

    ✗ Found 1 resource violations

    → Module name: root
      ↳ Resource Address: aws_iam_role.example
        | ✗ failed
        | IAM role must have all required managed policies attached. Refer to https://docs.aws.amazon.com/config/latest/developerguide/iam-role-managed-policy-check.html for more details.


    iam-managed-policy-should-be-attached-to-role.sentinel:47:1 - Rule "main"
      Value:
        false
```

---
