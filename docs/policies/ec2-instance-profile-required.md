# EC2 instances should have IAM instance profiles attached

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Security     |

## Description

This control checks if Amazon EC2 instances have IAM instance profiles attached. This control fails if EC2 instances do not have an IAM instance profile configured.

IAM instance profiles provide EC2 instances with temporary credentials to access AWS services securely without embedding long-term credentials in the instance. Using instance profiles follows security best practices by enabling role-based access control and eliminating the need to store access keys on instances. This is essential for maintaining secure access to AWS resources and meeting compliance requirements.

This rule is covered by the [ec2-instance-profile-required](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-instance-profile-required.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - ec2-instance-profile-required.sentinel

      Description:
        This policy checks if 'aws_instance' have IAM instance profiles attached.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy ec2-instance-profile-required.

      ✓ Found 0 resource violations

      ec2-instance-profile-required.sentinel:47:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - ec2-instance-profile-required.sentinel

      Description:
        This policy checks if 'aws_instance' have IAM instance profiles attached.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy ec2-instance-profile-required.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_instance.example
          | ✗ failed
          | 'aws_instance' must have IAM instance profiles attached. Refer to https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2_instance-profiles.html for more details.


      ec2-instance-profile-required.sentinel:47:1 - Rule "main"
        Value:
          false
```

---