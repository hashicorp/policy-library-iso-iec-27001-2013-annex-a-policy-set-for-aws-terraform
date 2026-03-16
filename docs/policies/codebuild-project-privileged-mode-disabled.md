# CodeBuild projects should have privileged mode disabled

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Security     |

## Description

This control checks if AWS CodeBuild projects have privileged mode disabled. This control fails if privileged mode is enabled for CodeBuild projects.

Privileged mode grants elevated permissions to the Docker daemon running in the build environment, allowing containers to run with extended privileges. While this may be necessary for certain build operations like building Docker images, it poses security risks by potentially allowing container escape and unauthorized access to the host system. Disabling privileged mode when not required follows the principle of least privilege and reduces the attack surface.

This rule is covered by the [codebuild-project-privileged-mode-disabled](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/codebuild/codebuild-project-privileged-mode-disabled.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - codebuild-project-privileged-mode-disabled.sentinel

      Description:
        This policy checks if 'aws_codebuild_project' have privileged mode disabled.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy codebuild-project-privileged-mode-disabled.

      ✓ Found 0 resource violations

      codebuild-project-privileged-mode-disabled.sentinel:47:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - codebuild-project-privileged-mode-disabled.sentinel

      Description:
        This policy checks if 'aws_codebuild_project' have privileged mode disabled.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy codebuild-project-privileged-mode-disabled.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_codebuild_project.example
          | ✗ failed
          | 'aws_codebuild_project' must have privileged mode disabled. Refer to https://docs.aws.amazon.com/codebuild/latest/userguide/security-best-practices.html for more details.


      codebuild-project-privileged-mode-disabled.sentinel:47:1 - Rule "main"
        Value:
          false
```

---