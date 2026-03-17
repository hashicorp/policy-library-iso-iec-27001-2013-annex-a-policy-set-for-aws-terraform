# Load balancers should be configured with defensive or strictest desync mitigation mode

| Provider            | Category        |
|---------------------|-----------------|
| Amazon Web Services | Load Balancing  |

## Description

This policy checks if load balancer resources have the 'desync_mitigation_mode' attribute set to either 'defensive' or 'strictest'. This is a parameterized policy that can check both Classic Load Balancers (aws_elb) and Application Load Balancers (aws_lb).

HTTP Desync attacks exploit inconsistencies in how front-end and back-end systems parse HTTP requests. Setting the desync mitigation mode to 'defensive' or 'strictest' helps protect against these attacks by enforcing stricter HTTP parsing rules.

This rule is covered by the [elb-ensure-valid-desync-mitigation-mode](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/elb/elb-ensure-valid-desync-mitigation-mode.sentinel) policy.

## Policy Variants

This policy is registered twice in sentinel.hcl with different parameters:
- `elb-ensure-valid-desync-mitigation-mode-application-load-balancer` - checks Application Load Balancers (lb_type = "application")
- `elb-ensure-valid-desync-mitigation-mode-classic-load-balancer` - checks Classic Load Balancers (lb_type = "classic")

## Policy Results (Pass)
```bash
trace:
      Pass - elb-ensure-valid-desync-mitigation-mode.sentinel

      Description:
        This policy checks if load_balancer resources have the
        'desync_mitigation_mode' attribute set to either 'defensive' or
        'strictest'

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy elb-ensure-valid-desync-mitigation-mode.

      ✓ Found 0 resource violations

      elb-ensure-valid-desync-mitigation-mode.sentinel:79:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - elb-ensure-valid-desync-mitigation-mode.sentinel

      Description:
        This policy checks if load_balancer resources have the
        'desync_mitigation_mode' attribute set to either 'defensive' or
        'strictest'

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy elb-ensure-valid-desync-mitigation-mode.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_lb.example
          | ✗ failed
          | Application load balancers should be configured with defensive or strictest desync mitigation mode.


      elb-ensure-valid-desync-mitigation-mode.sentinel:79:1 - Rule "main"
        Value:
          false
```

---