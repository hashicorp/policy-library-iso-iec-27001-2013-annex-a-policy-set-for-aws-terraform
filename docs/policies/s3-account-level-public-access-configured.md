# S3 Account-Level Public Access Block Should Be Configured

| Provider            | Category  |
| ------------------- | --------  |
| Amazon Web Services |  Security |

## Description

This control checks if the required public access block settings are configured at the account level for Amazon S3. This control fails when public access block settings are not configured at the account level.

Account-level S3 public access blocks provide a centralized way to prevent public access to all S3 buckets in your AWS account. This helps prevent accidental data exposure and ensures consistent security posture across all buckets.

This rule is covered by the [s3-account-level-public-access-configured](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/s3/s3-account-level-public-access-configured.sentinel) policy.

## Parameters

Custom values are set with `params` in the policy block in [sentinel.hcl](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/sentinel.hcl). Descriptions follow the [AWS Config managed rule reference](https://docs.aws.amazon.com/config/latest/developerguide/s3-account-level-public-access-blocks.html).

| Parameter | Description | Type | Default | Constraints |
| --- | --- | --- | --- | --- |
| `ignore_public_acls` | IgnorePublicAcls is enforced or not, default True | `bool` | `true` | - |
| `block_public_policy` | BlockPublicPolicy is enforced or not, default True | `bool` | `true` | - |
| `block_public_acls` | BlockPublicAcls is enforced or not, default True | `bool` | `true` | - |
| `restrict_public_buckets` | RestrictPublicBuckets is enforced or not, default True | `bool` | `true` | - |

Setting a parameter to `false` turns that check off.

## Policy Results (Pass)

```bash
trace:
    Pass - s3-account-level-public-access-configured.sentinel

    Description:
      This policy checks if S3 account-level public access block settings are configured.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy s3-account-level-public-access-configured.

    ✓ Found 0 resource violations

    s3-account-level-public-access-configured.sentinel:47:1 - Rule "main"
      Value:
        true
```

---

## Policy Results (Fail)

```bash
trace:
    Fail - s3-account-level-public-access-configured.sentinel

    Description:
      This policy checks if S3 account-level public access block settings are configured.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy s3-account-level-public-access-configured.

    ✗ Found 1 resource violations

    → Module name: root
      ↳ Resource Address: aws_s3_account_public_access_block.example
        | ✗ failed
        | S3 account must have all public access block settings enabled to prevent accidental data exposure. Refer to https://docs.aws.amazon.com/config/latest/developerguide/s3-account-level-public-access-blocks.html for more details.


    s3-account-level-public-access-configured.sentinel:47:1 - Rule "main"
      Value:
        false
```

---
