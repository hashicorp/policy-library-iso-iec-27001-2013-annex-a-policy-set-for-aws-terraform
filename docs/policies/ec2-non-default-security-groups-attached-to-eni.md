# EC2 security groups should be attached to network interfaces

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Security     |

## Description

DISCLAIMER - This policy works when all resources are present in root module

This control checks if non-default Amazon EC2 security groups are attached to elastic network interfaces (ENIs). This control fails if a managed non-default security group is not associated with any ENI.

AWS Config reports this rule on the security group resource type, not on the ENI resource type. In Terraform, the relevant evidence comes from attachments configured through `aws_network_interface.security_groups`, `aws_network_interface_sg_attachment.security_group_id`, and `aws_instance.vpc_security_group_ids` for primary ENIs.

This means the policy depends on managed `aws_security_group` resources and then checks whether each of those groups is referenced by an ENI attachment path. Default security groups are out of scope for this rule and are not evaluated here.

This rule is covered by the [ec2-non-default-security-groups-attached-to-eni](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-non-default-security-groups-attached-to-eni.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - ec2-non-default-security-groups-attached-to-eni.sentinel

      Description:
        This policy checks if managed 'aws_security_group' resources are attached to elastic network interfaces.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy ec2-non-default-security-groups-attached-to-eni.

      ✓ Found 0 resource violations

      ec2-non-default-security-groups-attached-to-eni.sentinel:1:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - ec2-non-default-security-groups-attached-to-eni.sentinel

      Description:
        This policy checks if managed 'aws_security_group' resources are attached to elastic network interfaces.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy ec2-non-default-security-groups-attached-to-eni.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_security_group.example
          | ✗ failed
          | Security group 'aws_security_group.example' is not attached to any elastic network interface in this Terraform plan. Non-default security groups must be attached to an elastic network interface. Refer to https://docs.aws.amazon.com/config/latest/developerguide/ec2-security-group-attached-to-eni.html for more details.


      ec2-non-default-security-groups-attached-to-eni.sentinel:1:1 - Rule "main"
        Value:
          false
```

---

## Notes

- This policy depends on `aws_security_group` and uses attachment evidence from `aws_network_interface`, `aws_network_interface_sg_attachment`, and `aws_instance`.
- Relevant Terraform attributes are `aws_network_interface.security_groups`, `aws_network_interface_sg_attachment.security_group_id`, and `aws_instance.vpc_security_group_ids`.
- `aws_default_security_group` resources are not evaluated because the AWS Config rule applies to non-default security groups.