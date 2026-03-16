# EC2 Auto Scaling groups should have capacity rebalancing enabled

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Availability |

## Description

This control checks if Amazon EC2 Auto Scaling groups have capacity rebalancing enabled. This control fails if capacity rebalancing is not configured for Auto Scaling groups using Spot Instances.

Capacity rebalancing helps maintain application availability by proactively replacing Spot Instances that are at elevated risk of interruption. When enabled, Auto Scaling attempts to launch new instances before terminating instances that are at risk, ensuring smooth transitions and minimizing disruptions. This is particularly important for applications running on Spot Instances to maintain high availability and resilience.

This rule is covered by the [ec2-autoscaling-capacity-rebalancing-enabled](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-autoscaling-capacity-rebalancing-enabled.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - ec2-autoscaling-capacity-rebalancing-enabled.sentinel

      Description:
        This policy checks if 'aws_autoscaling_group' have capacity rebalancing enabled.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy ec2-autoscaling-capacity-rebalancing-enabled.

      ✓ Found 0 resource violations

      ec2-autoscaling-capacity-rebalancing-enabled.sentinel:47:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - ec2-autoscaling-capacity-rebalancing-enabled.sentinel

      Description:
        This policy checks if 'aws_autoscaling_group' have capacity rebalancing enabled.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy ec2-autoscaling-capacity-rebalancing-enabled.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_autoscaling_group.example
          | ✗ failed
          | 'aws_autoscaling_group' must have capacity rebalancing enabled. Refer to https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-capacity-rebalancing.html for more details.


      ec2-autoscaling-capacity-rebalancing-enabled.sentinel:47:1 - Rule "main"
        Value:
          false
```

---