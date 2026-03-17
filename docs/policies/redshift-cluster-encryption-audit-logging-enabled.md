# Redshift Clusters Should Have Encryption and Audit Logging Enabled

| Provider            | Category  |
| ------------------- | --------  |
| Amazon Web Services |  Security |

## Description

This control checks if Amazon Redshift clusters have encryption and audit logging enabled. This control fails if the Redshift cluster is not encrypted, is encrypted with an incorrect key, or does not have audit logging enabled.

Encryption protects data at rest from unauthorized access, while audit logging captures cluster activities for security monitoring and compliance. Together, these features provide comprehensive data protection and visibility into cluster operations.

This rule is covered by the [redshift-cluster-encryption-audit-logging-enabled](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/redshift/redshift-cluster-encryption-audit-logging-enabled.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
    Pass - redshift-cluster-encryption-audit-logging-enabled.sentinel

    Description:
      This policy checks if Redshift clusters have encryption and audit logging enabled.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy redshift-cluster-encryption-audit-logging-enabled.

    ✓ Found 0 resource violations

    redshift-cluster-encryption-audit-logging-enabled.sentinel:47:1 - Rule "main"
      Value:
        true
```

---

## Policy Results (Fail)

```bash
trace:
    Fail - redshift-cluster-encryption-audit-logging-enabled.sentinel

    Description:
      This policy checks if Redshift clusters have encryption and audit logging enabled.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy redshift-cluster-encryption-audit-logging-enabled.

    ✗ Found 1 resource violations

    → Module name: root
      ↳ Resource Address: aws_redshift_cluster.example
        | ✗ failed
        | Redshift cluster must have both encryption and audit logging enabled with the correct KMS key configuration. Refer to https://docs.aws.amazon.com/config/latest/developerguide/redshift-cluster-configuration-check.html for more details.


    redshift-cluster-encryption-audit-logging-enabled.sentinel:47:1 - Rule "main"
      Value:
        false
```

---
