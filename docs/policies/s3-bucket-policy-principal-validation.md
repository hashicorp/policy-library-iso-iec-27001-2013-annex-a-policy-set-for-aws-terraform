# S3 Bucket Policy Principals Should Be Validated

| Provider            | Category  |
| ------------------- | --------  |
| Amazon Web Services |  Security |

## Description

DISCLAIMER - This policy works when all resources are present in root module

This control checks that S3 bucket access is restricted to authorized AWS principals, federated users, service principals, IP addresses, or VPCs. This control is compliant if a bucket policy is not present, or if the policy only grants access to approved entities.

Validating S3 bucket policy principals helps prevent unauthorized access by ensuring that only trusted entities can access your S3 data. This is critical for maintaining data confidentiality and preventing data breaches.

This rule is covered by the [s3-bucket-policy-principal-validation](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/s3/s3-bucket-policy-principal-validation.sentinel) policy.

## Parameters

| Parameter | Description | Type | Default | Constraints |
| --- | --- | --- | --- | --- |
| `awsPrincipals` | Comma-separated list of principals such as IAM User ARNs, IAM Role ARNs, and AWS accounts. You must provide the full ARN or use partial matching. For example, "arn:aws:iam::AccountID:role/role_name" or "arn:aws:iam::AccountID:role/*". If the provided value is not an exact match with the principal ARN specified in the bucket policy, the rule is NON_COMPLIANT. | `string` | `""` | `{ format: csv }` |
| `servicePrincipals` | Comma-separated list of service principals, for example 'cloudtrail.amazonaws.com, lambda.amazonaws.com'. | `string` | `""` | `{ format: csv }` |
| `federatedUsers` | Comma-separated list of identity providers for web identity federation such as Amazon Cognito and SAML identity providers. For example 'cognito-identity.amazonaws.com, arn:aws:iam::111122223333:saml-provider/my-provider'. | `string` | `""` | `{ format: csv }` |
| `ipAddresses` | Comma-separated list of CIDR formatted IP addresses, for example '10.0.0.1, 192.168.1.0/24, 2001:db8::/32'. | `string` | `""` | `{ format: csv }` |
| `vpcIds` | Comma-separated list of Amazon Virtual Private Clouds (Amazon VPC) IDs, for example 'vpc-1234abc0, vpc-ab1234c0'. | `string` | `""` | `{ format: csv }` |

## Policy Results (Pass)

```bash
trace:
    Pass - s3-bucket-policy-principal-validation.sentinel

    Description:
      This policy checks if S3 bucket policies grant access only to authorized principals.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy s3-bucket-policy-principal-validation.

    ✓ Found 0 resource violations

    s3-bucket-policy-principal-validation.sentinel:47:1 - Rule "main"
      Value:
        true
```

---

## Policy Results (Fail)

```bash
trace:
    Fail - s3-bucket-policy-principal-validation.sentinel

    Description:
      This policy checks if S3 bucket policies grant access only to authorized principals.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy s3-bucket-policy-principal-validation.

    ✗ Found 1 resource violations

    → Module name: root
      ↳ Resource Address: aws_s3_bucket_policy.example
        | ✗ failed
        | S3 bucket policy grants access to unauthorized principals. Ensure only approved AWS principals, IPs, or VPCs have access. Refer to https://docs.aws.amazon.com/config/latest/developerguide/s3-bucket-policy-grantee-check.html for more details.


    s3-bucket-policy-principal-validation.sentinel:47:1 - Rule "main"
      Value:
        false
```

---
