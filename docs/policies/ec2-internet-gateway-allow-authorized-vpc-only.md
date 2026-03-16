# Internet Gateways Should Be Attached to Authorized VPCs Only

| Provider            | Category  |
| ------------------- | --------  |
| Amazon Web Services |  Security |

## Description

This control checks if internet gateways are attached to an authorized virtual private cloud (Amazon VPC). This control fails if internet gateways are attached to an unauthorized VPC.

Restricting internet gateway attachments to authorized VPCs helps prevent unauthorized network access and ensures that only approved network architectures are deployed. This is important for maintaining network security boundaries and preventing accidental exposure of resources.

This rule is covered by the [ec2-internet-gateway-allow-authorized-vpc-only](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-internet-gateway-allow-authorized-vpc-only.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
    Pass - ec2-internet-gateway-allow-authorized-vpc-only.sentinel

    Description:
      This policy checks if internet gateways are attached to authorized VPCs only.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy ec2-internet-gateway-allow-authorized-vpc-only.

    ✓ Found 0 resource violations

    ec2-internet-gateway-allow-authorized-vpc-only.sentinel:47:1 - Rule "main"
      Value:
        true
```

---

## Policy Results (Fail)

```bash
trace:
    Fail - ec2-internet-gateway-allow-authorized-vpc-only.sentinel

    Description:
      This policy checks if internet gateways are attached to authorized VPCs only.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy ec2-internet-gateway-allow-authorized-vpc-only.

    ✗ Found 1 resource violations

    → Module name: root
      ↳ Resource Address: aws_internet_gateway.example
        | ✗ failed
        | Internet gateway is attached to an unauthorized VPC. Only authorized VPCs should have internet gateway attachments. Refer to https://docs.aws.amazon.com/config/latest/developerguide/internet-gateway-authorized-vpc-only.html for more details.


    ec2-internet-gateway-allow-authorized-vpc-only.sentinel:47:1 - Rule "main"
      Value:
        false
```

---
