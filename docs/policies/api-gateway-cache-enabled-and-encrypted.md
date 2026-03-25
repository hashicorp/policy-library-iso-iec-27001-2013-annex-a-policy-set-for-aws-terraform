# Cache should be enabled and encrypted for API Gateway REST API stages

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Encryption   |

## Description


DISCLAIMER - This policy works when all resources are present in root module

This control checks if Amazon API Gateway REST API stages have the cache cluster enabled and if the associated method settings have caching and cache encryption enabled. This control fails if the stage cache cluster is disabled or if the related method settings do not enable caching and cache encryption.

API Gateway caching improves performance by storing responses from your backend and serving them directly for subsequent identical requests. Encrypting the cache ensures that sensitive data stored in the cache is protected at rest, preventing unauthorized access to cached API responses.

This rule is covered by the [api-gateway-cache-enabled-and-encrypted](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/api-gateway/api-gateway-cache-enabled-and-encrypted.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - api-gateway-cache-enabled-and-encrypted.sentinel

      Description:
        This policy checks if 'aws_api_gateway_stage' have caching enabled and encrypted.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy api-gateway-cache-enabled-and-encrypted.

      ✓ Found 0 resource violations

      api-gateway-cache-enabled-and-encrypted.sentinel:47:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - api-gateway-cache-enabled-and-encrypted.sentinel

      Description:
        This policy checks if 'aws_api_gateway_stage' have caching enabled and encrypted.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy api-gateway-cache-enabled-and-encrypted.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_api_gateway_stage.example
          | ✗ failed
          | 'aws_api_gateway_stage' must have caching enabled and encrypted. Refer to https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-caching.html for more details.


      api-gateway-cache-enabled-and-encrypted.sentinel:47:1 - Rule "main"
        Value:
          false
```

---