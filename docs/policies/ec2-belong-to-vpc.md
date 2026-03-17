# EC2 Instances Should Belong to a VPC

| Provider            | Category  |
| ------------------- | --------  |
| Amazon Web Services |  Security |

## Description

This control checks whether your Amazon EC2 instances are launched within a Virtual Private Cloud (VPC). This control fails if an EC2 instance is not associated with a VPC.

VPCs provide network isolation and enhanced security controls for your EC2 instances. Instances launched in EC2-Classic (outside of a VPC) lack the security features and fine-grained network controls that VPCs provide, such as security groups, network ACLs, and private IP addressing. Using VPCs is a security best practice for protecting your cloud resources.

This rule is covered by the [ec2-belong-to-vpc](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-belong-to-vpc.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
    Pass - ec2-belong-to-vpc.sentinel

    Description:
      This policy checks if EC2 instances are launched within a VPC.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy ec2-belong-to-vpc.

    ✓ Found 0 resource violations

    ec2-belong-to-vpc.sentinel:47:1 - Rule "main"
      Value:
        true
```

---

## Policy Results (Fail)

```bash
trace:
    Fail - ec2-belong-to-vpc.sentinel

    Description:
      This policy checks if EC2 instances are launched within a VPC.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy ec2-belong-to-vpc.

    ✗ Found 1 resource violations

    → Module name: root
      ↳ Resource Address: aws_instance.example
        | ✗ failed
        | EC2 instance must be launched within a VPC. Instances without VPC association lack essential security controls. Refer to https://docs.aws.amazon.com/config/latest/developerguide/ec2-instances-in-vpc.html for more details.


    ec2-belong-to-vpc.sentinel:47:1 - Rule "main"
      Value:
        false
```

---
