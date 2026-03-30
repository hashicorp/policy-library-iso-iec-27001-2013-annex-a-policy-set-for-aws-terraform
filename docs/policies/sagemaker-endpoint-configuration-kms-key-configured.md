# SageMaker Endpoint Configurations Should Have KMS Key Configured

| Provider            | Category  |
| ------------------- | --------  |
| Amazon Web Services |  Security |

## Description

This control checks if AWS Key Management Service (KMS) keys are configured for Amazon SageMaker endpoint configurations. This control fails if a KMS key is not configured for the endpoint configuration.

Configuring KMS keys for SageMaker endpoint configurations ensures that data processed by the endpoints is encrypted at rest. This protects sensitive machine learning data and model artifacts from unauthorized access.

This rule is covered by the [sagemaker-endpoint-configuration-kms-key-configured](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/sagemaker/sagemaker-endpoint-configuration-kms-key-configured.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
    Pass - sagemaker-endpoint-configuration-kms-key-configured.sentinel

    Description:
      This policy checks if SageMaker endpoint configurations have KMS keys configured.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy sagemaker-endpoint-configuration-kms-key-configured.

    ✓ Found 0 resource violations

    sagemaker-endpoint-configuration-kms-key-configured.sentinel:47:1 - Rule "main"
      Value:
        true
```

---

## Policy Results (Fail)

```bash
trace:
    Fail - sagemaker-endpoint-configuration-kms-key-configured.sentinel

    Description:
      This policy checks if SageMaker endpoint configurations have KMS keys configured.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy sagemaker-endpoint-configuration-kms-key-configured.

    ✗ Found 1 resource violations

    → Module name: root
      ↳ Resource Address: aws_sagemaker_endpoint_configuration.example
        | ✗ failed
        | SageMaker endpoint configuration must have a KMS key configured to encrypt data at rest. Refer to https://docs.aws.amazon.com/config/latest/developerguide/sagemaker-endpoint-configuration-kms-key-configured.html for more details.


    sagemaker-endpoint-configuration-kms-key-configured.sentinel:47:1 - Rule "main"
      Value:
        false
```

---
