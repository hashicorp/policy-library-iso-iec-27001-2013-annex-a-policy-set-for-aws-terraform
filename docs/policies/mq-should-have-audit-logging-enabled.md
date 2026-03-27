# Amazon MQ Brokers Should Have Audit Logging Enabled

| Provider            | Category  |
| ------------------- | --------  |
| Amazon Web Services |  Logging  |

## Description

This control checks if Amazon MQ brokers have audit logging enabled. This control fails if audit logging is not enabled for an MQ broker.

Audit logging for Amazon MQ captures detailed information about broker activities, including authentication attempts, message operations, and configuration changes. These logs are essential for security monitoring, compliance auditing, troubleshooting, and forensic investigation.

This rule is covered by the [mq-should-have-audit-logging-enabled](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/mq/mq-should-have-audit-logging-enabled.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
    Pass - mq-should-have-audit-logging-enabled.sentinel

    Description:
      This policy checks if Amazon MQ brokers have audit logging enabled.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy mq-should-have-audit-logging-enabled.

    ✓ Found 0 resource violations

    mq-should-have-audit-logging-enabled.sentinel:47:1 - Rule "main"
      Value:
        true
```

---

## Policy Results (Fail)

```bash
trace:
    Fail - mq-should-have-audit-logging-enabled.sentinel

    Description:
      This policy checks if Amazon MQ brokers have audit logging enabled.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy mq-should-have-audit-logging-enabled.

    ✗ Found 1 resource violations

    → Module name: root
      ↳ Resource Address: aws_mq_broker.example
        | ✗ failed
        | Amazon MQ broker must have audit logging enabled for security monitoring and compliance. Refer to https://docs.aws.amazon.com/config/latest/developerguide/mq-cloudwatch-audit-logging-enabled.html for more details.


    mq-should-have-audit-logging-enabled.sentinel:47:1 - Rule "main"
      Value:
        false
```

---
