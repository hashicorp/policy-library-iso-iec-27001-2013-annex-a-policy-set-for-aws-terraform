# Kerberos Authentication Should Be Enabled for Amazon EMR Clusters

| Provider            | Category  |
| ------------------- | --------  |
| Amazon Web Services |  Security |

## Description

This control checks if Amazon EMR clusters have Kerberos authentication enabled. This control fails if Kerberos is not configured for the EMR cluster.

Amazon EMR releases 5.10.0 and higher support Kerberos, a network authentication protocol that uses secret-key cryptography to provide strong authentication. Kerberos ensures that passwords and other credentials are not transmitted over the network in plain text, significantly improving cluster security and preventing unauthorized access.

This rule is covered by the [emr-kerberos-should-be-enabled](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/emr/emr-kerberos-should-be-enabled.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
    Pass - emr-kerberos-should-be-enabled.sentinel

    Description:
      This policy checks if Amazon EMR clusters have Kerberos authentication enabled.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy emr-kerberos-should-be-enabled.

    ✓ Found 0 resource violations

    emr-kerberos-should-be-enabled.sentinel:47:1 - Rule "main"
      Value:
        true
```

---

## Policy Results (Fail)

```bash
trace:
    Fail - emr-kerberos-should-be-enabled.sentinel

    Description:
      This policy checks if Amazon EMR clusters have Kerberos authentication enabled.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy emr-kerberos-should-be-enabled.

    ✗ Found 1 resource violations

    → Module name: root
      ↳ Resource Address: aws_emr_cluster.example
        | ✗ failed
        | EMR cluster must have Kerberos authentication enabled to ensure secure authentication and prevent credential exposure. Refer to https://docs.aws.amazon.com/config/latest/developerguide/emr-kerberos-enabled.html for more details.


    emr-kerberos-should-be-enabled.sentinel:47:1 - Rule "main"
      Value:
        false
```

---
