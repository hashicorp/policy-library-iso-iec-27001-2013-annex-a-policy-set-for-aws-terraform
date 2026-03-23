# EKS clusters should have control plane logging enabled

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Logging      |

## Description

This control checks if Amazon EKS clusters have control plane logging enabled. This control fails if EKS cluster logging is not configured for all log types.

EKS control plane logging provides visibility into cluster operations by capturing API server, audit, authenticator, controller manager, and scheduler logs. These logs are essential for troubleshooting cluster issues, monitoring security events, detecting unauthorized access attempts, and meeting compliance requirements. Enabling comprehensive logging helps maintain cluster security and operational visibility.

Terraform exposes this requirement directly through `aws_eks_cluster.enabled_cluster_log_types`, which maps cleanly to the AWS Config rule. This policy therefore depends only on managed `aws_eks_cluster` resources and verifies that all required log types are present: `api`, `audit`, `authenticator`, `controllerManager`, and `scheduler`.

This rule is covered by the [eks-cluster-logging-enabled](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/eks/eks-cluster-logging-enabled.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - eks-cluster-logging-enabled.sentinel

      Description:
        This policy checks if 'aws_eks_cluster' resources have all required control plane logging enabled.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy eks-cluster-logging-enabled.

      ✓ Found 0 resource violations

      eks-cluster-logging-enabled.sentinel:1:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - eks-cluster-logging-enabled.sentinel

      Description:
        This policy checks if 'aws_eks_cluster' resources have all required control plane logging enabled.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy eks-cluster-logging-enabled.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_eks_cluster.example
          | ✗ failed
          | EKS cluster is missing the following required log types: api, audit, authenticator, controllerManager, scheduler. All log types (api, audit, authenticator, controllerManager, scheduler) must be enabled. Refer to https://docs.aws.amazon.com/config/latest/developerguide/eks-cluster-logging-enabled.html for more details.


      eks-cluster-logging-enabled.sentinel:1:1 - Rule "main"
        Value:
          false
```

---

## Notes

- This policy depends on `aws_eks_cluster`.
- The relevant Terraform attribute is `enabled_cluster_log_types`.
- All five AWS Config-required log types must be present: `api`, `audit`, `authenticator`, `controllerManager`, and `scheduler`.