# EventBridge schema registries should have resource policies attached

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Security     |

## Description

This control checks if custom Amazon EventBridge schema registries have a resource policy attached. This control fails when an `aws_schemas_registry` resource does not have a corresponding `aws_schemas_registry_policy` resource whose `registry_name` matches the registry `name` and whose `policy` content is non-blank.

Resource policies for EventBridge schema registries control access to schemas and define who can discover, view, or modify schemas in the registry. Attaching resource policies ensures that access to schemas is properly controlled and follows the principle of least privilege. This is essential for protecting sensitive event schemas and maintaining secure event-driven architectures.

This rule is covered by the [eventbridge-schema-registry-policy-attached](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/eventbridge/eventbridge-schema-registry-policy-attached.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - eventbridge-schema-registry-policy-attached.sentinel

      Description:
        This policy checks if custom Amazon EventBridge schema registries have resource policies attached.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy eventbridge-schema-registry-policy-attached.

      ✓ Found 0 resource violations

      eventbridge-schema-registry-policy-attached.sentinel:71:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - eventbridge-schema-registry-policy-attached.sentinel

      Description:
        This policy checks if custom Amazon EventBridge schema registries have resource policies attached.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy eventbridge-schema-registry-policy-attached.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_schemas_registry.example
          | ✗ failed
          | Custom Amazon EventBridge schema registries must have a resource policy attached. Registry 'my-custom-registry' does not have a resource policy attached. Refer to https://docs.aws.amazon.com/config/latest/developerguide/custom-schema-registry-policy-attached.html for more details.


      eventbridge-schema-registry-policy-attached.sentinel:71:1 - Rule "main"
        Value:
          false
```

---

## Terraform Resources

- `aws_schemas_registry`
- `aws_schemas_registry_policy`

## Terraform Attributes

- `aws_schemas_registry.name`
- `aws_schemas_registry_policy.registry_name`
- `aws_schemas_registry_policy.policy`