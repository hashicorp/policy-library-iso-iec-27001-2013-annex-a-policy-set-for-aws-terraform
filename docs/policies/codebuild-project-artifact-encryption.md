# CodeBuild project artifacts should be encrypted

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Encryption   |

## Description

This control checks if AWS CodeBuild project artifacts are encrypted. This control fails if artifact encryption is not enabled for CodeBuild projects.

CodeBuild artifacts contain build outputs that may include sensitive information such as compiled code, configuration files, or credentials. Encrypting artifacts ensures that this data is protected at rest in S3 or other storage locations. This is essential for maintaining the confidentiality of build outputs and meeting security compliance requirements.

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

      codebuild-project-artifact-encryption.sentinel:47:1 - Rule "main"
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
          | 'aws_codebuild_project' artifacts must be encrypted. Refer to https://docs.aws.amazon.com/codebuild/latest/userguide/security-encryption.html for more details.


      codebuild-project-artifact-encryption.sentinel:47:1 - Rule "main"
        Value:
          false
```

---