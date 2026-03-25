# Redshift Clusters Should Have Audit Logging Enabled

| Provider            | Category  |
| ------------------- | --------  |
| Amazon Web Services |  Logging  |

## Description

DISCLAIMER - This policy works when all resources are present in root module

This control checks if Amazon Redshift clusters have audit logging enabled and are logging to a specific S3 bucket. This control fails if audit logging is not enabled for a Redshift cluster or if logs are not being sent to the designated bucket.

Audit logging for Redshift captures information about connections, queries, and user activities. These logs are essential for security monitoring, compliance auditing, troubleshooting performance issues, and forensic investigation.

This rule is covered by the [redshift-audit-logging-should-be-enabled](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/redshift/redshift-audit-logging-should-be-enabled.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
    Pass - redshift-audit-logging-should-be-enabled.sentinel

    Description:
      This policy checks if Redshift clusters have audit logging enabled.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy redshift-audit-logging-should-be-enabled.

    ✓ Found 0 resource violations

    redshift-audit-logging-should-be-enabled.sentinel:47:1 - Rule "main"
      Value:
        true
```

---

## Policy Results (Fail)

```bash
trace:
    Fail - redshift-audit-logging-should-be-enabled.sentinel

    Description:
      This policy checks if Redshift clusters have audit logging enabled.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy redshift-audit-logging-should-be-enabled.

    ✗ Found 1 resource violations

    → Module name: root
      ↳ Resource Address: aws_redshift_cluster.example
        | ✗ failed
        | Redshift cluster must have audit logging enabled and configured to log to an S3 bucket for security monitoring and compliance. Refer to https://docs.aws.amazon.com/config/latest/developerguide/redshift-audit-logging-enabled.html for more details.


    redshift-audit-logging-should-be-enabled.sentinel:47:1 - Rule "main"
      Value:
        false
```

---
