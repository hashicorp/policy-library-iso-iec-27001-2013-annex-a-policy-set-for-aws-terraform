# EC2 Auto Scaling groups should have capacity rebalancing enabled

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Availability |

## Description

This control checks if Capacity Rebalancing is enabled for Amazon EC2 Auto Scaling groups that use multiple instance types. In Terraform, the policy treats an Auto Scaling group as using multiple instance types when its `mixed_instances_policy.launch_template.override` list defines more than one explicit `instance_type`, or when any override uses `instance_requirements`, which allows Auto Scaling to select from multiple instance types dynamically.

This aligns with AWS Config rule `AUTOSCALING_CAPACITY_REBALANCING`, which focuses on Auto Scaling groups using multiple instance types rather than on all Spot-based groups generically.

This rule is covered by the [ec2-autoscaling-capacity-rebalancing-enabled](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-autoscaling-capacity-rebalancing-enabled.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - ec2-autoscaling-capacity-rebalancing-enabled.sentinel

      Description:
        This policy checks if 'aws_autoscaling_group' that use multiple instance types have capacity rebalancing enabled.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy ec2-autoscaling-capacity-rebalancing-enabled.

      ✓ Found 0 resource violations

      ec2-autoscaling-capacity-rebalancing-enabled.sentinel:1:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - ec2-autoscaling-capacity-rebalancing-enabled.sentinel

      Description:
        This policy checks if 'aws_autoscaling_group' that use multiple instance types have capacity rebalancing enabled.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy ec2-autoscaling-capacity-rebalancing-enabled.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_autoscaling_group.example
          | ✗ failed
          | Capacity Rebalancing must be enabled (capacity_rebalance = true) for Auto Scaling groups that use multiple instance types. Refer to https://docs.aws.amazon.com/config/latest/developerguide/autoscaling-capacity-rebalancing.html for more details.


      ec2-autoscaling-capacity-rebalancing-enabled.sentinel:1:1 - Rule "main"
        Value:
          false
```

---

## Notes

- This policy depends only on `aws_autoscaling_group`.
- Relevant Terraform attributes are `capacity_rebalance` and `mixed_instances_policy.launch_template.override`.
- A single `override` with `instance_requirements` is treated as multiple-instance-type usage because Auto Scaling can launch any instance type matching those requirements.