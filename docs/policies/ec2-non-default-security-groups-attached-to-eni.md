# EC2 network interfaces should have non-default security groups attached

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Security     |

## Description

This control checks if Amazon EC2 network interfaces (ENIs) have non-default security groups attached. This control fails if ENIs are using the default security group.

The default security group has permissive rules that may not align with security best practices. Using custom security groups allows you to implement the principle of least privilege by defining specific inbound and outbound rules tailored to your application's requirements. This helps prevent unauthorized access and reduces the attack surface of your EC2 instances.

This rule is covered by the [ec2-non-default-security-groups-attached-to-eni](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-non-default-security-groups-attached-to-eni.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - ec2-non-default-security-groups-attached-to-eni.sentinel

      Description:
        This policy checks if 'aws_network_interface' have non-default security groups attached.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy ec2-non-default-security-groups-attached-to-eni.

      ✓ Found 0 resource violations

      ec2-non-default-security-groups-attached-to-eni.sentinel:47:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - ec2-non-default-security-groups-attached-to-eni.sentinel

      Description:
        This policy checks if 'aws_network_interface' have non-default security groups attached.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy ec2-non-default-security-groups-attached-to-eni.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_network_interface.example
          | ✗ failed
          | 'aws_network_interface' must have non-default security groups attached. Refer to https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html for more details.


      ec2-non-default-security-groups-attached-to-eni.sentinel:47:1 - Rule "main"
        Value:
          false
```

---