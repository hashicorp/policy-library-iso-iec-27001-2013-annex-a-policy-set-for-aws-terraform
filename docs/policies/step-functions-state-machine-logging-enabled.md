# Step Functions state machines should have logging turned on

| Provider            | Category  |
| ------------------- | --------  |
| Amazon Web Services |  Logging  |

## Description

This controls checks whether an AWS Step Functions state machine has logging turned on. The control fails if a state machine doesn't have logging turned on. If you provide a custom value for the logLevel parameter, the control passes only if the state machine has the specified logging level turned on.

Monitoring helps you maintain the reliability, availability, and performance of Step Functions. You should collect as much monitoring data from the AWS services that you use so you can more easily debug multi-point failures. Having a logging configuration defined for your Step Functions state machines allows for you to track execution history and results in Amazon CloudWatch Logs. Optionally, you can track only errors or fatal events.

This rule is covered by the [step-functions-state-machine-logging-enabled](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/stepfunction/step-functions-state-machine-logging-enabled.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
    Pass - step-functions-state-machine-logging-enabled.sentinel

    Description:
    This Sentinel policy requires AWS Step Functions state machines to have
    logging configuration enabled with level set to "ALL", "ERROR", or "FATAL".

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy sfn-logging-enabled.

    ✓ Found 0 resource violations

    step-functions-state-machine-logging-enabled.sentinel:51:1 - Rule "main"
    Description:
        Rules

    Value:
        true
```

---

## Policy Results (Fail)

```bash
trace:
    Fail - step-functions-state-machine-logging-enabled.sentinel

    Description:
    This policy requires AWS Step Functions state machines to have logging
    configuration enabled with level set to "ALL", "ERROR", or "FATAL".

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy sfn-logging-enabled.

    Found 1 resource violations

    → Module name: root
    ↳ Resource Address: aws_sfn_state_machine.sfn_state_machine
        | ✗ failed
        | AWS Step Functions state machines must have logging enabled with level set to 'ALL', 'ERROR', or 'FATAL'. For more information, refer to AWS documentation.


    step-functions-state-machine-logging-enabled.sentinel:51:1 - Rule "main"
    Description:
        Rules

    Value:
        false
```

---
