# IAM Resources Should Not Have Blacklisted Policy ARNs Attached

| Provider            | Category  |
| ------------------- | --------  |
| Amazon Web Services |  Security |

## Description

DISCLAIMER - This policy works when all resources are present in root module

This control checks if blacklisted policy ARNs are attached to IAM resources (users, groups, or roles). This control fails if a blacklisted policy ARN is attached to any IAM resource.

Preventing the use of specific policy ARNs helps enforce security standards and compliance requirements by ensuring that overly permissive or deprecated policies are not used in your AWS environment.

This rule is covered by the [iam-policy-no-blacklisted-arn-allowed](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/iam/iam-policy-no-blacklisted-arn-allowed.sentinel) policy.

## Parameters

| Parameter | Description | Type | Default | Constraints |
| --- | --- | --- | --- | --- |
| `policyArns` | Comma separated list of IAM policy arns which should not be attached to any IAM entity. | `list(string)` | `["arn:aws:iam::aws:policy/AdministratorAccess"]` | `{ min_items: 1 }` |
| `exceptionList` | Comma separated list of resourcetypes and list of resource name pairs. For example, users:[user1;user2], groups:[group1;group2], roles:[role1;role2;role3]. Specify the name of the resource and not the full ARN. | `string` | `""` | - |

## Policy Results (Pass)

```bash
trace:
    Pass - iam-policy-no-blacklisted-arn-allowed.sentinel

    Description:
      This policy checks if blacklisted policy ARNs are attached to IAM resources.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy iam-policy-no-blacklisted-arn-allowed.

    ✓ Found 0 resource violations

    iam-policy-no-blacklisted-arn-allowed.sentinel:47:1 - Rule "main"
      Value:
        true
```

---

## Policy Results (Fail)

```bash
trace:
    Fail - iam-policy-no-blacklisted-arn-allowed.sentinel

    Description:
      This policy checks if blacklisted policy ARNs are attached to IAM resources.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy iam-policy-no-blacklisted-arn-allowed.

    ✗ Found 1 resource violations

    → Module name: root
      ↳ Resource Address: aws_iam_role_policy_attachment.example
        | ✗ failed
        | IAM resource has a blacklisted policy ARN attached. Remove the blacklisted policy to comply with security standards. Refer to https://docs.aws.amazon.com/config/latest/developerguide/iam-policy-blacklisted-check.html for more details.


    iam-policy-no-blacklisted-arn-allowed.sentinel:47:1 - Rule "main"
      Value:
        false
```

---
