# Network Load Balancer Cross-Zone Load Balancing Should Be Enabled

| Provider            | Category  |
| ------------------- | --------  |
| Amazon Web Services |  Availability |

## Description

This control checks if cross-zone load balancing is enabled on Network Load Balancers (NLBs). This control fails if cross-zone load balancing is not enabled for an NLB.

Cross-zone load balancing distributes traffic evenly across all registered targets in all enabled Availability Zones. This improves application availability and fault tolerance by ensuring that traffic is distributed even if some Availability Zones have fewer healthy targets.

This rule is covered by the [elb-nlb-cross-zone-load-balancing-enabled](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/elb/elb-nlb-cross-zone-load-balancing-enabled.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
    Pass - elb-nlb-cross-zone-load-balancing-enabled.sentinel

    Description:
      This policy checks if cross-zone load balancing is enabled on Network Load Balancers.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy elb-nlb-cross-zone-load-balancing-enabled.

    ✓ Found 0 resource violations

    elb-nlb-cross-zone-load-balancing-enabled.sentinel:47:1 - Rule "main"
      Value:
        true
```

---

## Policy Results (Fail)

```bash
trace:
    Fail - elb-nlb-cross-zone-load-balancing-enabled.sentinel

    Description:
      This policy checks if cross-zone load balancing is enabled on Network Load Balancers.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy elb-nlb-cross-zone-load-balancing-enabled.

    ✗ Found 1 resource violations

    → Module name: root
      ↳ Resource Address: aws_lb.example
        | ✗ failed
        | Network Load Balancer must have cross-zone load balancing enabled to ensure even traffic distribution across Availability Zones. Refer to https://docs.aws.amazon.com/config/latest/developerguide/nlb-cross-zone-load-balancing-enabled.html for more details.


    elb-nlb-cross-zone-load-balancing-enabled.sentinel:47:1 - Rule "main"
      Value:
        false
```

---
