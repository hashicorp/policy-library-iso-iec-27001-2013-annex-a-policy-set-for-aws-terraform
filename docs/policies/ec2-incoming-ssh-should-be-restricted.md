# Incoming SSH Traffic Should Be Restricted

| Provider            | Category  |
| ------------------- | --------  |
| Amazon Web Services |  Security |

## Description

This control checks whether security groups allow unrestricted incoming SSH traffic from the internet (0.0.0.0/0 or ::/0). This control fails if a security group allows SSH access from 0.0.0.0/0 or ::/0.

Allowing unrestricted SSH access increases the risk of unauthorized access to your EC2 instances. SSH access should be restricted to specific IP addresses or ranges that require administrative access. This is a critical security best practice to prevent brute-force attacks and unauthorized access attempts.

This rule is covered by the [ec2-incoming-ssh-should-be-restricted](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-incoming-ssh-should-be-restricted.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
    Pass - ec2-incoming-ssh-should-be-restricted.sentinel

    Description:
      This policy checks if security groups disallow unrestricted incoming SSH traffic.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy ec2-incoming-ssh-should-be-restricted.

    ✓ Found 0 resource violations

    ec2-incoming-ssh-should-be-restricted.sentinel:141:1 - Rule "main"
      Value:
        true
```

---

## Policy Results (Fail)

```bash
trace:
    Fail - ec2-incoming-ssh-should-be-restricted.sentinel

    Description:
      This policy checks if security groups disallow unrestricted incoming SSH traffic.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy ec2-incoming-ssh-should-be-restricted.

    ✗ Found 1 resource violations

    → Module name: root
      ↳ Resource Address: aws_security_group.example
        | ✗ failed
        | Security group allows unrestricted SSH access (0.0.0.0/0 or ::/0) on port 22. The rule is COMPLIANT if the IP addresses of the incoming SSH traffic in the security groups are restricted (CIDR other than 0.0.0.0/0 or ::/0). Resource type: aws_security_group. Refer to https://docs.aws.amazon.com/config/latest/developerguide/restricted-ssh.html for more details.


    ec2-incoming-ssh-should-be-restricted.sentinel:141:1 - Rule "main"
      Value:
        false
```

---
