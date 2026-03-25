# No Unrestricted Routes to Internet Gateway Should Exist

| Provider            | Category  |
| ------------------- | --------  |
| Amazon Web Services |  Security |

## Description

DISCLAIMER - This policy works when all resources are present in root module

This control checks if there are public routes in the route table to an Internet Gateway (IGW). This control fails if a route to an IGW has a destination CIDR block of 0.0.0.0/0 or ::/0.

Public routes to internet gateways with unrestricted CIDR blocks (0.0.0.0/0 or ::/0) can expose resources to the internet unnecessarily. Route tables should use specific CIDR blocks to limit exposure and maintain proper network segmentation.

This rule is covered by the [ec2-no-public-route-to-igw](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-no-public-route-to-igw.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
    Pass - ec2-no-public-route-to-igw.sentinel

    Description:
      This policy checks if route tables have unrestricted public routes to an Internet Gateway.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy ec2-no-public-route-to-igw.

    ✓ Found 0 resource violations

    ec2-no-public-route-to-igw.sentinel:47:1 - Rule "main"
      Value:
        true
```

---

## Policy Results (Fail)

```bash
trace:
    Fail - ec2-no-public-route-to-igw.sentinel

    Description:
      This policy checks if route tables have unrestricted public routes to an Internet Gateway.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy ec2-no-public-route-to-igw.

    ✗ Found 1 resource violations

    → Module name: root
      ↳ Resource Address: aws_route.example
        | ✗ failed
        | Route table contains an unrestricted public route (0.0.0.0/0 or ::/0) to an Internet Gateway. Use specific CIDR blocks instead. Refer to https://docs.aws.amazon.com/config/latest/developerguide/no-unrestricted-route-to-igw.html for more details.


    ec2-no-public-route-to-igw.sentinel:47:1 - Rule "main"
      Value:
        false
```

---
