# SageMaker Notebook Instances Should Have KMS Key Configured

| Provider            | Category  |
| ------------------- | --------  |
| Amazon Web Services |  Security |

## Description

DISCLAIMER - This policy works when all resources are present in root module

This control checks if AWS Key Management Service (KMS) keys are configured for Amazon SageMaker notebook instances. This control fails if a KMS key is not configured for the notebook instance.

Configuring KMS keys for SageMaker notebook instances ensures that data stored on the notebook's storage volumes is encrypted at rest. This protects sensitive machine learning code, data, and model artifacts from unauthorized access.

This rule is covered by the [sagemaker-notebook-instance-kms-key-configured](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/sagemaker/sagemaker-notebook-instance-kms-key-configured.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
    Pass - sagemaker-notebook-instance-kms-key-configured.sentinel

    Description:
      This policy checks if SageMaker notebook instances have KMS keys configured.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy sagemaker-notebook-instance-kms-key-configured.

    ✓ Found 0 resource violations

    sagemaker-notebook-instance-kms-key-configured.sentinel:47:1 - Rule "main"
      Value:
        true
```

---

## Policy Results (Fail)

```bash
trace:
    Fail - sagemaker-notebook-instance-kms-key-configured.sentinel

    Description:
      This policy checks if SageMaker notebook instances have KMS keys configured.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy sagemaker-notebook-instance-kms-key-configured.

    ✗ Found 1 resource violations

    → Module name: root
      ↳ Resource Address: aws_sagemaker_notebook_instance.example
        | ✗ failed
        | SageMaker notebook instance must have a KMS key configured to encrypt data at rest on storage volumes. Refer to https://docs.aws.amazon.com/config/latest/developerguide/sagemaker-notebook-instance-kms-key-configured.html for more details.


    sagemaker-notebook-instance-kms-key-configured.sentinel:47:1 - Rule "main"
      Value:
        false
```

---
