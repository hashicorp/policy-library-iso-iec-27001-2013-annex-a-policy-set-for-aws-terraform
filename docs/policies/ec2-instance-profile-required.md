# EC2 instances should have IAM instance profiles attached

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Security     |

## Description

This control checks if Amazon EC2 instances have IAM instance profiles attached. This control fails if EC2 instances do not have an IAM instance profile configured. When the optional `IamInstanceProfileArnList` parameter is supplied, the policy restricts instances to the allowed instance profiles represented by those ARNs.

IAM instance profiles provide EC2 instances with temporary credentials to access AWS services securely without embedding long-term credentials in the instance. Using instance profiles follows security best practices by enabling role-based access control and eliminating the need to store access keys on instances. This is essential for maintaining secure access to AWS resources and meeting compliance requirements.

In Terraform, the `aws_instance.iam_instance_profile` argument is configured as the instance profile name rather than as an ARN. The policy therefore treats a profile as allowed when the configured name matches the name component of one of the ARNs in `IamInstanceProfileArnList`.

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

      ec2-instance-profile-required.sentinel:1:1 - Rule "main"
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
          | EC2 instance 'aws_instance.example' must have an IAM instance profile attached. The 'iam_instance_profile' attribute is required for proper identity and access management. Refer to https://docs.aws.amazon.com/config/latest/developerguide/ec2-instance-profile-attached.html for more details.


      ec2-instance-profile-required.sentinel:1:1 - Rule "main"
        Value:
          false
```

---

## Notes

- This policy depends only on `aws_instance`.
- The relevant Terraform attribute is `iam_instance_profile`.
- The AWS Config parameter `IamInstanceProfileArnList` contains ARNs, but Terraform configures `iam_instance_profile` as the instance profile name. The policy matches both exact ARN strings and the profile-name suffix extracted from those ARNs.