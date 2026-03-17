# IAM Policies Should Be Attached to Users, Groups, or Roles

| Provider            | Category  |
| ------------------- | --------  |
| Amazon Web Services |  Security |

## Description

This control checks if IAM policies are attached to IAM users, groups, or roles. This control fails if an IAM policy exists but is not attached to any IAM entity.

Unattached IAM policies represent unused permissions that can create confusion and increase the attack surface. Policies should either be attached to appropriate entities or removed to maintain a clean and secure IAM configuration.

This rule is covered by the [iam-policy-arn-should-be-attached](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/iam/iam-policy-arn-should-be-attached.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
    Pass - iam-policy-arn-should-be-attached.sentinel

    Description:
      This policy checks if IAM policies are attached to users, groups, or roles.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy iam-policy-arn-should-be-attached.

    ✓ Found 0 resource violations

    iam-policy-arn-should-be-attached.sentinel:47:1 - Rule "main"
      Value:
        true
```

---

## Policy Results (Fail)

```bash
trace:
    Fail - iam-policy-arn-should-be-attached.sentinel

    Description:
      This policy checks if IAM policies are attached to users, groups, or roles.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy iam-policy-arn-should-be-attached.

    ✗ Found 1 resource violations

    → Module name: root
      ↳ Resource Address: aws_iam_policy.example
        | ✗ failed
        | IAM policy must be attached to at least one user, group, or role. Unattached policies should be removed. Refer to https://docs.aws.amazon.com/config/latest/developerguide/iam-policy-in-use.html for more details.


    iam-policy-arn-should-be-attached.sentinel:47:1 - Rule "main"
      Value:
        false
```

---
