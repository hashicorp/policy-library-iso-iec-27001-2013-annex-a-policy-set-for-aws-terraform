# CodeBuild project artifacts should be encrypted

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Encryption   |

## Description

This control checks whether `aws_codebuild_project` artifacts keep output encryption enabled. It evaluates the `artifacts[*].encryption_disabled` and `secondary_artifacts[*].encryption_disabled` fields and treats omitted values as encrypted, which matches the Terraform provider default.

CodeBuild artifacts can contain build outputs such as compiled code, configuration files, or other sensitive content. Encrypting those artifacts protects the data at rest. For artifact blocks whose `type` is `NO_ARTIFACTS`, the provider ignores `encryption_disabled`, so those blocks are treated as compliant.

This rule is covered by the [codebuild-project-artifact-encryption](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/codebuild/codebuild-project-artifact-encryption.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - codebuild-project-artifact-encryption.sentinel

      Description:
        This policy checks if 'aws_codebuild_project' artifacts are encrypted.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy codebuild-project-artifact-encryption.

      ✓ Found 0 resource violations

      codebuild-project-artifact-encryption.sentinel:56:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - codebuild-project-artifact-encryption.sentinel

      Description:
        This policy checks if 'aws_codebuild_project' artifacts are encrypted.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy codebuild-project-artifact-encryption.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_codebuild_project.example
          | ✗ failed
          | AWS CodeBuild project 'aws_codebuild_project.example' must have encryption enabled for all artifacts. Set 'encryption_disabled' to false or omit it to enable encryption. Refer to https://docs.aws.amazon.com/config/latest/developerguide/codebuild-project-artifact-encryption.html for more details.


      codebuild-project-artifact-encryption.sentinel:56:1 - Rule "main"
        Value:
          false
```

---