# ECS task definitions should run containers as non-root users

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Security     |

## Description

This control checks if Amazon ECS task definitions are configured to run containers as non-root users. This control fails if task definitions do not specify a non-root user for container execution.

Running containers as non-root users follows the principle of least privilege and reduces the potential impact of container compromises. If a container is compromised while running as root, an attacker could gain elevated privileges on the host system. Configuring containers to run as non-root users limits the damage that can be done in case of a security breach.

This rule is covered by the [ecs-task-definition-nonroot-user](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ecs/ecs-task-definition-nonroot-user.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - ecs-task-definition-nonroot-user.sentinel

      Description:
        This policy checks if 'aws_ecs_task_definition' run containers as non-root users.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy ecs-task-definition-nonroot-user.

      ✓ Found 0 resource violations

      ecs-task-definition-nonroot-user.sentinel:47:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - ecs-task-definition-nonroot-user.sentinel

      Description:
        This policy checks if 'aws_ecs_task_definition' run containers as non-root users.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy ecs-task-definition-nonroot-user.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_ecs_task_definition.example
          | ✗ failed
          | 'aws_ecs_task_definition' must run containers as non-root users. Refer to https://docs.aws.amazon.com/AmazonECS/latest/bestpracticesguide/security-tasks-containers.html for more details.


      ecs-task-definition-nonroot-user.sentinel:47:1 - Rule "main"
        Value:
          false
```

---