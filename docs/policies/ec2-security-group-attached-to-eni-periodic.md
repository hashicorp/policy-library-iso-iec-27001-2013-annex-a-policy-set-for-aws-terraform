# EC2 network interfaces should have security groups attached

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Security     |

## Description

This control checks if Amazon EC2 network interfaces (ENIs) have security groups attached. This control fails if ENIs do not have at least one security group configured.

Security groups act as virtual firewalls that control inbound and outbound traffic for network interfaces. Every ENI must have at least one security group to define access rules and protect resources from unauthorized access. Without security groups, network interfaces would be vulnerable to unrestricted traffic, posing significant security risks.

This rule is covered by the [ec2-security-group-attached-to-eni-periodic](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-security-group-attached-to-eni-periodic.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - ec2-security-group-attached-to-eni-periodic.sentinel

      Description:
        This policy checks if 'aws_network_interface' have security groups attached.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy ec2-security-group-attached-to-eni-periodic.

      ✓ Found 0 resource violations

      ec2-security-group-attached-to-eni-periodic.sentinel:47:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - ec2-security-group-attached-to-eni-periodic.sentinel

      Description:
        This policy checks if 'aws_network_interface' have security groups attached.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy ec2-security-group-attached-to-eni-periodic.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_network_interface.example
          | ✗ failed
          | 'aws_network_interface' must have security groups attached. Refer to https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html for more details.


      ec2-security-group-attached-to-eni-periodic.sentinel:47:1 - Rule "main"
        Value:
          false
```

---