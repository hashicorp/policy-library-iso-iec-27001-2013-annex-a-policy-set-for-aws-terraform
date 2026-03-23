# ECS task definitions should run containers as non-root users

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Security     |

## Description

This control checks if Amazon ECS task definitions used for the EC2 launch type are configured to run containers as non-root users. This control fails if any applicable container definition does not specify a `user` value or sets that value to `root` or `0`.

Running containers as non-root users follows the principle of least privilege and reduces the potential impact of container compromises. If a container is compromised while running as root, an attacker could gain elevated privileges on the host system. Configuring containers to run as non-root users limits the damage that can be done in case of a security breach.

Terraform models `aws_ecs_task_definition.container_definitions` as a single JSON document string, so this policy must parse that JSON and validate each container definition individually. The AWS Config rule is specific to ECS EC2 launch type containers, so Fargate-only task definitions are not evaluated by this policy.

This policy depends on `aws_ecs_task_definition` and uses `container_definitions` plus `requires_compatibilities` to determine whether the rule applies and whether each container has a valid non-root `user` value.

This rule is covered by the [ecs-task-definition-nonroot-user](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ecs/ecs-task-definition-nonroot-user.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - ecs-task-definition-nonroot-user.sentinel

      Description:
        This policy checks if EC2 launch type 'aws_ecs_task_definition' resources run containers as non-root users.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy ecs-task-definition-nonroot-user.

      ✓ Found 0 resource violations

      ecs-task-definition-nonroot-user.sentinel:64:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - ecs-task-definition-nonroot-user.sentinel

      Description:
        This policy checks if EC2 launch type 'aws_ecs_task_definition' resources run containers as non-root users.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy ecs-task-definition-nonroot-user.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_ecs_task_definition.example
          | ✗ failed
          | ECS task definition 'aws_ecs_task_definition.example' must specify a non-root user for all EC2 launch type container definitions. Each applicable container must have a 'user' attribute set to a non-root user (not '0' or 'root'). Refer to https://docs.aws.amazon.com/config/latest/developerguide/ecs-task-definition-nonroot-user.html for more details.


      ecs-task-definition-nonroot-user.sentinel:64:1 - Rule "main"
        Value:
          false
```

---

## Notes

- This policy depends on `aws_ecs_task_definition`.
- Relevant Terraform attributes are `container_definitions` and `requires_compatibilities`.
- `container_definitions` is parsed as JSON and every container definition must have a non-root `user` value.
- Fargate-only task definitions are ignored because the AWS Config rule applies to ECS EC2 launch type containers.
- AWS Config mentions the latest active revision; Terraform plan evaluation can only validate the task definition revisions present in the plan.