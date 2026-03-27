# Pre-written Sentinel AWS International Organization for standardization (ISO)/International Electrotechnical Commission (IEC) 27001:2013 Annex A Benchmarking

Pre-written Sentinel policies are ready to use compliance checks for 
International Organization for standardization (ISO)/International Electrotechnical Commission (IEC) 27001:2013 Annex A AWS Benchmarking to help enable your AWS resources meet industry security standards.

At HashiCorp, we’re committed to making policy management easier for our customers. We understand that developing policies from scratch can be time-consuming and resource-intensive. To address this, we’re introducing our Prewritten Policy Libraries—expertly crafted, ready-to-use policies designed to streamline your compliance processes and enhance security across your infrastructure.

This repository contains several policies designed to accelerate the adoption of the International Organization for standardization (ISO)/International Electrotechnical Commission (IEC) 27001:2013 Annex A AWS Benchmark within HCP Terraform. These policies can be utilized to enforce best practices and security standards across your AWS environment.

For more details on how to work with these policies and to understand the Sentinel language and framework, please refer to the [Sentinel documentation](https://developer.hashicorp.com/sentinel/) or the README documentation included with each of the policy [libraries](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies).

## Feedback

We aim to validate the effectiveness of our policies by collecting diverse user feedback and understanding real-world use cases. This input will help refine our policies and enhance their overall impact.

1. You can submit your feedback via a [public survey](https://docs.google.com/forms/d/e/1FAIpQLScswwLMaVaRuYRGJzDjNiycwM4BUa_gAIsAE_zOPdgyFeLXCA/viewform).

2. If you have any issues or enhancement suggestions to the library, please create [a new GitHub issue](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/issues/new).

3. Alternatively, we welcome any contributions that improve the impact of this library! To learn more about contributing and suggesting changes to this library, refer to the [contributing guide](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/CONTRIBUTING.md).

## Getting Started

This getting started guide assumes that:

1. You are familiar with core workflows in HCP Terraform and Terraform Enterprise, and you have an existing workspace configured with AWS access credentials.

   > **Tip:** If you do not have these prerequisites, please refer to the [Use VCS-Driven Workflow](https://developer.hashicorp.com/terraform/tutorials/cloud-get-started/cloud-vcs-change) and [Create a Variable Set](https://developer.hashicorp.com/terraform/tutorials/cloud-get-started/cloud-create-variable-set) tutorials for guidance.

2. You have a user account that is part of the ["owners"](https://developer.hashicorp.com/terraform/cloud-docs/users-teams-organizations/permissions#organization-owners) team or have ["Manage Policies"](https://developer.hashicorp.com/terraform/cloud-docs/users-teams-organizations/permissions#manage-policies) organization-level permissions to create new policy sets and policies.

3. Ensure you are using HCP Terraform or Terraform Enterprise [v202312-1](https://developer.hashicorp.com/terraform/enterprise/releases/2023/v202312-1) or a later version.

4. You are using Sentinel version 0.26.x and later version.

By default, the module will enable all policies within the library, and they will be enforced by the HCP Platform with the `enforcement_level` set to `advisory` only.

**Example:**

```
policy "iam-password-policy-strong-configuration" {
  source = "./policies/iam/iam-password-policy-strong-configuration.sentinel"
  enforcement_level = "advisory"
  params = {
    minimum_password_length_param = 14
  }
}
```

If you want to enable only a subset of the policies or change the [enforcement levels](https://developer.hashicorp.com/sentinel/docs/concepts/enforcement-levels) to either `soft-mandatory` or `hard-mandatory`, we recommend updating the contents of the `sentinel.hcl` file in each library before applying the Terraform configuration.

> **Important:**
> The policies in each library are opinionated and depend on several Sentinel modules. To learn more about modules, please refer to the [Sentinel module](https://developer.hashicorp.com/sentinel/docs/extending/modules) documentation.
>
> To learn more about how to configure a policy set as a [policy evaluation](https://developer.hashicorp.com/terraform/cloud-docs/policy-enforcement/manage-policy-sets#policy-evaluations), please review the Terraform Enterprise provider [documentation](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/policy_set#agent_enabled).

## Consuming Pre-Written Sentinel Policies for International Organization for standardization (ISO)/International Electrotechnical Commission (IEC) 27001:2013 Annex A AWS Benchmark

Following methods outlines various ways to consume and implement pre-written Sentinel policies for the International Organization for standardization (ISO)/International Electrotechnical Commission (IEC) 27001:2013 Annex A AWS Benchmark. These policies can be used in both Terraform Enterprise (TFE) and HCP Terraform environments. Below are the recommended methods for integrating these policies into your workflows.

### Terraform Registry Method:

- Navigate to the [Terraform Registry](https://registry.terraform.io/browse/policies) and select the desired Sentinel policy.
- Copy the provided policy snippet from the registry.
- Create a GitHub repository (or use an existing one) to store your policies.
- Add a Sentinel.hcl file to the repository and paste the copied policy snippet(s) into this file.
- Connect the repository to HCP Terraform or Terraform Enterprise using the VCS (Version Control System) workflow.
- Trigger policy execution automatically during the plan stage in HCP Terraform or Terraform Enterprise.

### Using the Public GitHub Repository:

- Access the public GitHub repository containing the policy library.
- You can directly use the repository as-is or fork it to customize the policies for your specific requirements.
- If forking, ensure you sync your fork with the upstream repository periodically to stay updated with the latest changes.
- Avoid using the default branch for consumption in HCP Terraform or Terraform Enterprise. Instead, use the release branches for better stability.
- Attach the repository (or your fork) to HCP Terraform or Terraform Enterprise using the VCS workflow.
- Run a Terraform plan to execute the policies during the post-plan stage.

#### Notes and Best Practices

- These policies are compatible with both HCP Terraform (HCPT) and Terraform Enterprise (TFE). Ensure your workflow is configured accordingly.
- When using the public GitHub repository, it is recommended to use release branches for stability and avoid consuming policies directly from the default branch.
- Regularly update your policies to align with the latest International Organization for standardization (ISO)/International Electrotechnical Commission (IEC) 27001:2013 Annex A AWS Benchmark standards and Terraform best practices.
- Customize policies as needed to meet your organization's specific compliance and security requirements.

## Resources

- [Get Started - HCP Terraform](https://developer.hashicorp.com/terraform/tutorials/cloud-get-started)
- [Connecting VCS Providers to HCP Terraform](https://developer.hashicorp.com/terraform/cloud-docs/vcs)
- [Policy Enforcement](https://developer.hashicorp.com/terraform/cloud-docs/policy-enforcement)
- [Managing Policy Sets](https://developer.hashicorp.com/terraform/cloud-docs/policy-enforcement/manage-policy-sets)
- [Introduction to Sentinel](https://developer.hashicorp.com/sentinel/intro/what)
- [Sentinel Documentation](https://developer.hashicorp.com/sentinel/docs)
- [Sentinel Language](https://developer.hashicorp.com/sentinel/docs/language/)
- [Sentinel Language Specification](https://developer.hashicorp.com/sentinel/docs/language/spec)
- [Policy Libraries](https://registry.terraform.io/browse/policies)

### Policies Included

- ECR private repositories should have image scanning configured ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/ecr-image-scanning-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ecr/ecr-image-scanning-enabled.sentinel))

- EKS cluster endpoints should not be publicly accessible ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/eks-cluster-endpoints-restrict-public-access.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/eks/eks-cluster-endpoints-restrict-public-access.sentinel))

- ECS task definitions should have a logging configuration ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/ecs-task-definition-log-configuration-present.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ecs/ecs-task-definition-log-configuration-present.sentinel))

- Secrets should not be passed as container environment variables ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/ecs-task-definition-no-secrets-as-environment-variables.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ecs/ecs-task-definition-no-secrets-as-environment-variables.sentinel))

- Amazon ElastiCache for Redis cluster should have automatic backups scheduled ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/elasticache-redis-cluster-auto-backup-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/elasticache/elasticache-redis-cluster-auto-backup-enabled.sentinel))

- Amazon ElastiCache for Redis replication groups should have encryption at rest enabled ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/elasticache-redis-replication-group-encryption-at-rest-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/elasticache/elasticache-redis-replication-group-encryption-at-rest-enabled.sentinel))

- Amazon ElastiCache for Redis replication groups should have encryption at transit enabled ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/elasticache-redis-replication-group-encryption-at-transit-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/elasticache/elasticache-redis-replication-group-encryption-at-transit-enabled.sentinel))

- Classic Load Balancers should have cross-zone load balancing enabled ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/elb-cross-zone-load-balancing-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/elb/elb-cross-zone-load-balancing-enabled.sentinel))

- Application and Classic Load Balancers logging should be enabled ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/elb-ensure-access-logging-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/elb/elb-ensure-access-logging-enabled.sentinel))

- Application Load Balancer should be configured to redirect all HTTP requests to HTTPS ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/elb-ensure-http-request-redirection.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/elb/elb-ensure-http-request-redirection.sentinel))

- Classic Load Balancers with SSL/HTTPS listeners should use a certificate provided by AWS Certificate Manager ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/elb-ensure-ssl-listener-acm-cert-classic-load-balancer.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/elb/elb-ensure-ssl-listener-acm-cert-classic-load-balancer.sentinel))

- Application Load Balancer should be configured with defensive or strictest desync mitigation mode ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/elb-ensure-valid-desync-mitigation-mode-application-load-balancer.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/elb/elb-ensure-valid-desync-mitigation-mode.sentinel))

- Classic Load Balancer should be configured with defensive or strictest desync mitigation mode ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/elb-ensure-valid-desync-mitigation-mode-classic-load-balancer.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/elb/elb-ensure-valid-desync-mitigation-mode.sentinel))

- AWS RDS instance should be private ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/rds-instance-should-be-private.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/rds/rds-instance-should-be-private.sentinel))

- AWS RDS DB instances should have encryption at-rest enabled ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/rds-encryption-at-rest-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/rds/rds-encryption-at-rest-enabled.sentinel))

- AWS RDS cluster snapshots and database snapshots should be encrypted at rest ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/rds-cluster-and-db-snapshot-encrypted.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/rds/rds-cluster-and-db-snapshot-encrypted.sentinel))

- AWS RDS instance should have logging configured ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/rds-ensure-cloudwatch-logs-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/rds/rds-ensure-cloudwatch-logs-enabled.sentinel))

- AWS RDS cluster should be configured for multiple Availability Zones ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/rds-ensure-cluster-multi-az-configured.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/rds/rds-ensure-cluster-multi-az-configured.sentinel))

- AWS RDS DB instances should have automatic backups enabled ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/rds-ensure-automatic-backups-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/rds/rds-ensure-automatic-backups-enabled.sentinel))

- AWS RDS Cluster should have the storage_encrypted attribute set to true ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/rds-cluster-encrypted-at-rest.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/rds/rds-cluster-encrypted-at-rest.sentinel))

- AWS RDS instance ensure IAM authentication configured ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/rds-ensure-iam-auth-configured-for-db-instance.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/rds/rds-ensure-cluster-and-db-instance-iam-auth-configured.sentinel))

- AWS RDS cluster ensure IAM authentication configured ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/rds-ensure-iam-auth-configured-for-rds-cluster.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/rds/rds-ensure-cluster-and-db-instance-iam-auth-configured.sentinel))

- S3 general purpose buckets should have block public access settings enabled ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/s3-block-public-access-account-level.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/s3/s3-block-public-access-account-level.sentinel))

- Ensure that S3 Buckets are configured with 'Block public access (bucket settings)' ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/s3-block-public-access-bucket-level.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/s3/s3-block-public-access-bucket-level.sentinel))

- Amazon Dynamo DB tables should have point in time recovery enabled ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/dynamo-db-tables-point-in-time-recovery-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/dynamo-db/dynamo-db-tables-point-in-time-recovery-enabled.sentinel))

- AWS DocumentDB clusters should have backup_retention_period set between '7 to 35' ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/docdb-cluster-backup-retention-check.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/docdb/docdb-cluster-backup-retention-check.sentinel))

- AWS DocumentDB clusters should be encrypted at rest ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/docdb-cluster-storage-encrypted.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/docdb/docdb-cluster-storage-encrypted.sentinel))

- Amazon Dynamo DB accelerator clusters should have encryption at rest enabled ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/dynamo-db-accelerator-clusters-encryption-at-rest-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/dynamo-db/dynamo-db-accelerator-clusters-encryption-at-rest-enabled.sentinel))

- Amazon Dynamo DB accelerator clusters should have encryption in transit enabled ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/dynamo-db-accelerator-clusters-encryption-in-transit-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/dynamo-db/dynamo-db-accelerator-clusters-encryption-in-transit-enabled.sentinel))

- Amazon Dynamo DB tables should scale its read and write capacity as needed ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/dynamo-db-tables-scales-capacity-with-demand.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/dynamo-db/dynamo-db-tables-scales-capacity-with-demand.sentinel))

- Amazon EMR block public access setting should be enabled ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/emr-block-public-access-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/emr/emr-block-public-access-enabled.sentinel))

- Neptune DB clusters should be encrypted at rest ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/neptune-cluster-encryption-at-rest-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/neptune/neptune-cluster-encryption-at-rest-enabled.sentinel))

- Neptune DB clusters should have automated backups enabled ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/neptune-cluster-automated-backups-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/neptune/neptune-cluster-automated-backups-enabled.sentinel))

- Neptune DB clusters should have IAM database authentication enabled ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/neptune-cluster-db-auth-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/neptune/neptune-cluster-db-auth-enabled.sentinel))

- Neptune DB cluster snapshots should be encrypted at rest ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/neptune-cluster-snapshot-encryption-at-rest-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/neptune/neptune-cluster-snapshot-encryption-at-rest-enabled.sentinel))

- AWS Sagemaker Notebook instance should have the direct_internet_access set to "Disabled" ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/sagemaker-notebook-no-direct-internet-access.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/sagemaker/sagemaker-notebook-no-direct-internet-access.sentinel))

- AWS Sagemaker Notebook instance should have the root_access set to "Disabled" ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/sagemaker-notebook-instance-root-access-check.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/sagemaker/sagemaker-notebook-instance-root-access-check.sentinel))

- AWS Redshift Cluster should have the publicly_accessible attribute set to false ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/redshift-cluster-public-access-check.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/redshift/redshift-cluster-public-access-check.sentinel))

- AWS Redshift Cluster should have the require_ssl parameter in the AWS Redshift Parameter Group set to true ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/redshift-cluster-should-be-encrypted-at-transit.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/redshift/redshift-cluster-should-be-encrypted-at-transit.sentinel))

- AWS Redshift clusters should have automated_snapshot_retention_period set between '7 to 35' ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/redshift-cluster-automated-snapshot-retention-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/redshift/redshift-cluster-automated-snapshot-retention-enabled.sentinel))

- AWS Redshift Cluster should have the encrypted attribute set to true ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/redshift-cluster-should-be-encrypted-at-rest.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/redshift/redshift-cluster-should-be-encrypted-at-rest.sentinel))

- AWS DMS Endpoint resource should have the certificate for ssl configured ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/dms-endpoint-should-be-ssl-configured.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/dms/dms-endpoint-should-be-ssl-configured.sentinel))

- AWS DMS Endpoint resource should have the 'ssl_security_protocol' attribute is 'ssl-encryption' in 'redis_settings' for engine of type redis ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/dms-redis-tls-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/dms/dms-redis-tls-enabled.sentinel))

- AWS DMS Replication Task should have Logging enabled for the attribute 'replication_task_settings' for target db ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/dms-replication-task-targetdb-logging-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/dms/dms-replication-task-logging-enabled.sentinel))

- AWS DMS Replication Task should have Logging enabled for the attribute 'replication_task_settings' for source db ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/dms-replication-task-sourcedb-logging-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/dms/dms-replication-task-logging-enabled.sentinel))

- Network Firewall logging should be enabled ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/network-firewall-logging-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/network-firewall/network-firewall-logging-enabled.sentinel))

- Network Firewall policies should have at least one rule group associated ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/network-firewall-policy-rule-group-associated.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/network-firewall/network-firewall-policy-rule-group-associated.sentinel))

- ActiveMQ brokers should stream audit logs to CloudWatch ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/mq-cloudwatch-audit-log-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/mq/mq-cloudwatch-audit-log-enabled.sentinel))

- AWS MQ Broker should have the in_cluster attribute set to true for encryption_in_transit of encryption_info attribute ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/msk-in-cluster-node-require-encrypted-in-transit.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/msk/msk-in-cluster-node-require-encrypted-in-transit.sentinel))

- Kinesis streams should be encrypted at rest ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/kinesis-stream-encrypted.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/kinesis/kinesis-stream-encrypted.sentinel))

- KMS restrict IAM inline policies decrypt all KMS keys ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/kms-restrict-iam-inline-policies-decrypt-all-kms-keys.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/kms/kms-restrict-iam-inline-policies-decrypt-all-kms-keys.sentinel))

- Network Firewall policy default action full packets ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/network-firewall-policy-default-action-full-packets.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/network-firewall/network-firewall-policy-default-action-full-packets.sentinel))

- The default stateless action for Network Firewall policies should be drop or forward for fragmented packets ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/network-firewall-policy-default-action-fragmented-packets.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/network-firewall/network-firewall-policy-default-action-fragmented-packets.sentinel))

- Stateless Network Firewall rule group should not be empty in AWS Network Firewall ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/network-firewall-stateless-rule-group.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/network-firewall/network-firewall-stateless-rule-group.sentinel))

- API Gateway REST and WebSocket API execution logging should be enabled ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/api-gateway-rest-and-websocket-api-logging-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/api-gateway/api-gateway-rest-and-websocket-api-logging-enabled.sentinel))

- Access logging should be configured for API Gateway V2 Stages ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/api-gateway-access-logging-should-be-configured.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/api-gateway/api-gateway-access-logging-should-be-configured.sentinel))

- API Gateway REST API stages should be configured to use SSL certificates for backend authentication ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/api-gateway-rest-configure-ssl-certificates.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/api-gateway/api-gateway-rest-configure-ssl-certificates.sentinel))

- CloudFront distributions should encrypt traffic to custom origins ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/cloudfront-distributions-should-encrypt-traffic-to-custom-origins.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/cloudfront/cloudfront-distributions-should-encrypt-traffic-to-custom-origins.sentinel))

- CloudFront distributions should use custom SSL/TLS certificates ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/cloudfront-distributions-should-use-custom-ssl-tls-certificates.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/cloudfront/cloudfront-distributions-should-use-custom-ssl-tls-certificates.sentinel))

- CloudFront distributions should have logging enabled ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/cloudfront-distributions-should-have-logging-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/cloudfront/cloudfront-distributions-should-have-logging-enabled.sentinel))

- CloudFront distributions should require encryption in transit ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/cloudfront-should-require-encryption-in-transit.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/cloudfront/cloudfront-should-require-encryption-in-transit.sentinel))

- AWS Backup Framework Recovery Point should be encrypted at rest ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/backup-recovery-point-encrypted.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/backup/backup-recovery-point-encrypted.sentinel))

- EC2 - Network Acls should not allow ingress traffic from 0.0.0.0/0 or ::/0 to ports 22 or 3389 ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/ec2-network-acl.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-network-acl.sentinel))

- AWS EC2 Client VPN endpoints should have client connection logging enabled ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/ec2-client-vpn-connection-log-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-client-vpn-connection-log-enabled.sentinel))

- EC2 - AWS EBS volume are encrypted ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/ec2-ebs-encryption-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-ebs-encryption-enabled.sentinel))

- Amazon EC2 launch templates should not assign public IPs to network interfaces ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/ec2-launch-template-public-ip-disabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-launch-template-public-ip-disabled.sentinel))

- AWS Elasticsearch domain should be encrypted at rest ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/elasticsearch-encrypted-at-rest.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/elasticsearch/elasticsearch-encrypted-at-rest.sentinel))

- AWS Elasticsearch domain should not be publicly accessible ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/elasticsearch-in-vpc-only.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/elasticsearch/elasticsearch-in-vpc-only.sentinel))

- AWS Elasticsearch domain should be encrypt data between nodes ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/elasticsearch-node-to-node-encryption-check.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/elasticsearch/elasticsearch-node-to-node-encryption-check.sentinel))

- CodeBuild project environments should have a logging AWS Configuration ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/codebuild-project-environments-should-have-a-logging-aws-configuration.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/codebuild/codebuild-project-environments-should-have-a-logging-aws-configuration.sentinel))

- CodeBuild S3 logs should be encrypted ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/codebuild-s3-logs-should-be-encrypted.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/codebuild/codebuild-s3-logs-should-be-encrypted.sentinel))

- AWS OpenSearch Domain should have the enabled in encrypt_at_rest attribute set to true ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/opensearch-encrypted-at-rest.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/opensearch/opensearch-encrypted-at-rest.sentinel))

- AWS OpenSearch should have the enabled in node-to-node-encryption attribute set to true ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/opensearch-node-to-node-encryption-check.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/opensearch/opensearch-node-to-node-encryption-check.sentinel))

- AWS OpenSearch domains should have fine-grained access control enabled ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/opensearch-access-control-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/opensearch/opensearch-access-control-enabled.sentinel))

- Connections to AWS OpenSearch domains should be encrypted using the latest TLS security policy ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/opensearch-https-required.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/opensearch/opensearch-https-required.sentinel))

- IAM customer managed policies that you create should not allow wildcard actions for services ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/iam-policy-no-statements-with-full-access.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/iam/iam-policy-no-statements-with-full-access.sentinel))

- IAM users should not have IAM policies attached ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/iam-no-policies-attached-to-users.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/iam/iam-no-policies-attached-to-users.sentinel))

- Password policies for IAM users should have strong configurations ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/iam-password-policy-strong-configuration.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/iam/iam-password-policy-strong-configuration.sentinel))

- S3 access points should have block public access settings enabled ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/s3-access-point-block-public-access-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/s3/s3-access-point-block-public-access-enabled.sentinel))

- S3 general purpose buckets should block public read access ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/s3-bucket-block-public-read-access.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/s3/s3-bucket-block-public-read-access.sentinel))

- S3 general purpose buckets should block public write access ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/s3-bucket-block-public-write-access.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/s3/s3-bucket-block-public-write-access.sentinel))

- AWS WAF Classic Global Web ACL logging should be enabled ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/waf-classic-logging-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/waf/waf-classic-logging-enabled.sentinel))

- Amazon EBS snapshots should not be publicly restorable ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/ec2-ebs-snapshot-public-restorable-check-account-level.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-ebs-snapshot-public-restorable-check-account-level.sentinel))

- Lambda function policies should prohibit public access ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/lambda-function-public-access-prohibited.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/lambda/lambda-function-public-access-prohibited.sentinel))

- Step Functions state machines should have logging turned on ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/step-functions-state-machine-logging-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/stepfunction/step-functions-state-machine-logging-enabled.sentinel))

- Attached Amazon EBS volumes should be encrypted at-rest ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/ec2-attached-ebs-volumes-encrypted-at-rest.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-attached-ebs-volumes-encrypted-at-rest.sentinel))

- Unused Network Access Control Lists should be removed ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/ec2-network-acl-should-have-subnet-ids.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-network-acl-should-have-subnet-ids.sentinel))

- EC2 VPC Flow Logging Enabled ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/ec2-vpc-flow-logging-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-vpc-flow-logging-enabled.sentinel))

- OpenSearch domains should not be publicly accessible ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/opensearch-in-vpc-only.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/opensearch/opensearch-in-vpc-only.sentinel))

- Security groups should only allow unrestricted incoming traffic for authorized ports ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/ec2-security-group-ingress-traffic-restriction-to-unauthorized-ports.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-security-group-ingress-traffic-restriction-to-unauthorized-ports.sentinel))

- IAM policies should not allow full "*" administrative privileges ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/iam-no-admin-privileges-allowed-by-policies.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/iam/iam-no-admin-privileges-allowed-by-policies.sentinel))

- DMS endpoints should use SSL ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/dms-endpoints-should-use-ssl.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/dms/dms-endpoints-should-use-ssl.sentinel))

- EventBridge custom event buses should have a resource-based policy attached ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/eventbridge-custom-event-bus-should-have-attached-policy.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/eventbridge/eventbridge-custom-event-bus-should-have-attached-policy.sentinel))

- SSM documents should not be public ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/ssm-documents-should-not-be-public.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ssm/ssm-documents-should-not-be-public.sentinel))

- Application, Network and Gateway Load Balancers should span multiple Availability Zones ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/elb-multiple-az.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/elb/elb-multiple-az.sentinel))

- EFS access points should enforce a user identity ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/efs-access-point-should-enforce-user-identity.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/efs/efs-access-point-should-enforce-user-identity.sentinel))

- Elastic File System should be configured to encrypt file data at-rest using AWS KMS ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/efs-file-systems-should-be-encrypted-at-rest.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/efs/efs-file-systems-should-be-encrypted-at-rest.sentinel))

- Cloudtrail LogFile Validation is enabled ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/cloudtrail-log-file-validation-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/cloudtrail/cloudtrail-log-file-validation-enabled.sentinel))

- CloudTrail should have encryption at-rest enabled ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/cloudtrail-server-side-encryption-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/cloudtrail/cloudtrail-server-side-encryption-enabled.sentinel))

- AWS AppSync should have field-level logging enabled ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/appsync-field-level-logging-should-be-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/appsync/appsync-field-level-logging-should-be-enabled.sentinel))

- Route 53 public hosted zones should log DNS queries ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/route-53-public-hosted-zones-should-log-dns-queries.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/route53/route-53-public-hosted-zones-should-log-dns-queries.sentinel))

- CloudWatch log groups should be retained for a specified time period ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/cloudwatch-log-groups-should-be-retained-for-a-specified-time-period.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/cloudwatch/cloudwatch-log-groups-should-be-retained-for-a-specified-time-period.sentinel))

- S3 general purpose buckets should be encrypted at rest with AWS KMS keys ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/s3-bucket-should-be-encrypted-at-rest.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/s3/s3-bucket-should-be-encrypted-at-rest.sentinel))

- SNS topics should be encrypted at-rest using AWS KMS ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/sns-topic-should-be-encrypted-at-rest.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/sns/sns-topic-should-be-encrypted-at-rest.sentinel))

- CloudWatch alarms should have specified actions configured ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/cloudwatch-alarms-should-have-specified-actions-configured.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/cloudwatch/cloudwatch-alarms-should-have-specified-actions-configured.sentinel))

- AWS WAF web ACL logging should be enabled ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/wafv2-webacl-should-have-logging-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/waf/wafv2-webacl-should-have-logging-enabled.sentinel))

- EBS volumes should be covered by a backup plan ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/ebs-volumes-should-be-in-a-backup-plan.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ec2/ebs-volumes-should-be-in-a-backup-plan.sentinel))

- Network Firewall firewalls should be deployed across multiple Availability Zones ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/network-firewall-should-be-deployed-across-multiple-azs.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/networkfirewall/network-firewall-should-be-deployed-across-multiple-azs.sentinel))

- EventBridge global endpoints should have event replication enabled ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/eventbridge-global-endpoints-should-have-event-replication-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/eventbridge/eventbridge-global-endpoints-should-have-event-replication-enabled.sentinel))

- CloudTrail should follow security best practices ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/cloudtrail-security-best-practices.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/cloudtrail/cloudtrail-security-best-practices.sentinel))

- CloudTrail should have S3 data events enabled ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/cloudtrail-s3-dataevents-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/cloudtrail/cloudtrail-s3-dataevents-enabled.sentinel))

- Cache should be enabled and encrypted for API Gateway REST API stages ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/api-gateway-cache-enabled-and-encrypted.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/api-gateway/api-gateway-cache-enabled-and-encrypted.sentinel))

- Athena workgroups should be encrypted at rest ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/athena-workgroup-encrypted-at-rest.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/athena/athena-workgroup-encrypted-at-rest.sentinel))

- Aurora DB clusters should have recovery points created ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/aurora-recovery-point-created.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/aurora/aurora-recovery-point-created.sentinel))

- CloudWatch log groups should be encrypted with KMS ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/cloudwatch-log-group-kms-encryption.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/cloudwatch/cloudwatch-log-group-kms-encryption.sentinel))

- CodeBuild project artifacts should be encrypted ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/codebuild-project-artifact-encryption.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/codebuild/codebuild-project-artifact-encryption.sentinel))

- CodeBuild projects should have privileged mode disabled ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/codebuild-project-privileged-mode-disabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/codebuild/codebuild-project-privileged-mode-disabled.sentinel))

- DynamoDB tables should have recovery points created ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/dynamo-db-recovery-point-created.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/dynamo-db/dynamo-db-recovery-point-created.sentinel))

- DynamoDB tables should have encryption enabled ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/dynamo-db-table-encryption-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/dynamo-db/dynamo-db-table-encryption-enabled.sentinel))

- DynamoDB tables should be encrypted with KMS ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/dynamo-db-table-encrypted-kms.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/dynamo-db/dynamo-db-table-encrypted-kms.sentinel))

- ECS task definitions should run containers as non-root users ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/ecs-task-definition-nonroot-user.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ecs/ecs-task-definition-nonroot-user.sentinel))

- EFS file systems should be covered by compliant backup plans ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/efs-recovery-point-compliance.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/efs/efs-recovery-point-compliance.sentinel))

- EKS clusters should have control plane logging enabled ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/eks-cluster-logging-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/eks/eks-cluster-logging-enabled.sentinel))

- EventBridge schema registries should have resource policies attached ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/eventbridge-schema-registry-policy-attached.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/eventbridge/eventbridge-schema-registry-policy-attached.sentinel))

- EBS volumes should have recovery points created ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/ebs-backup-recovery-point-created.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ec2/ebs-backup-recovery-point-created.sentinel))

- EBS volumes should be protected by backup plans ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/ebs-volumes-backup-plan-protection.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ec2/ebs-volumes-backup-plan-protection.sentinel))

- EC2 Auto Scaling groups should have capacity rebalancing enabled ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/ec2-autoscaling-capacity-rebalancing-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-autoscaling-capacity-rebalancing-enabled.sentinel))

- EBS volumes should have recovery points created within specified time period ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/ec2-backup-recovery-point-time-period.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-backup-recovery-point-time-period.sentinel))

- EC2 instances should have IAM instance profiles attached ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/ec2-instance-profile-required.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-instance-profile-required.sentinel))

- EC2 security groups should be attached to network interfaces ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/ec2-non-default-security-groups-attached-to-eni.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-non-default-security-groups-attached-to-eni.sentinel))

- EC2 security groups should be attached to network interfaces ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/ec2-security-group-attached-to-eni-periodic.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-security-group-attached-to-eni-periodic.sentinel))

- Manual deletion should be disabled for AWS Backup recovery points ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/backup-recovery-point-manual-deletion-disabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/backup/backup-recovery-point-manual-deletion-disabled.sentinel))

- Kerberos Authentication Should Be Enabled for Amazon EMR Clusters ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/emr-kerberos-should-be-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/emr/emr-kerberos-should-be-enabled.sentinel))

- IAM Resources Should Not Have Blacklisted Policy ARNs Attached ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/iam-policy-no-blacklisted-arn-allowed.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/iam/iam-policy-no-blacklisted-arn-allowed.sentinel))

- IAM Roles Should Have Required Managed Policies Attached ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/iam-managed-policy-should-be-attached-to-role.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/iam/iam-managed-policy-should-be-attached-to-role.sentinel))

- Incoming SSH Traffic Should Be Restricted ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/ec2-incoming-ssh-should-be-restricted.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-incoming-ssh-should-be-restricted.sentinel))

- EC2 Instances Should Belong to a VPC ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/ec2-belong-to-vpc.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-belong-to-vpc.sentinel))

- Internet Gateways Should Be Attached to Authorized VPCs Only ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/ec2-internet-gateway-allow-authorized-vpc-only.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-internet-gateway-allow-authorized-vpc-only.sentinel))

- Amazon MQ Brokers Should Have Audit Logging Enabled ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/mq-should-have-audit-logging-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/mq/mq-should-have-audit-logging-enabled.sentinel))

- Network Load Balancer Cross-Zone Load Balancing Should Be Enabled ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/elb-nlb-cross-zone-load-balancing-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/elb/elb-nlb-cross-zone-load-balancing-enabled.sentinel))

- No Unrestricted Routes to Internet Gateway Should Exist ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/ec2-no-public-route-to-igw.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/ec2/ec2-no-public-route-to-igw.sentinel))

- RDS Aurora Databases Should Be Included in Backup Plans ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/rds-aurora-in-backup-plan.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/rds/rds-aurora-in-backup-plan.sentinel))

- RDS Recovery Points Should Be Created Within Required Time Period ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/rds-recovery-point-created-within-time-period.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/rds/rds-recovery-point-created-within-time-period.sentinel))

- Redshift Clusters Should Have Audit Logging Enabled ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/redshift-audit-logging-should-be-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/redshift/redshift-audit-logging-should-be-enabled.sentinel))

- Redshift Clusters Should Have Encryption and Audit Logging Enabled ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/redshift-cluster-encryption-audit-logging-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/redshift/redshift-cluster-encryption-audit-logging-enabled.sentinel))

- S3 Account-Level Public Access Block Should Be Configured ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/s3-account-level-public-access-configured.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/s3/s3-account-level-public-access-configured.sentinel))

- S3 Bucket Policies Should Not Allow Blacklisted Actions ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/s3-bucket-blacklisted-actions-prohibited.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/s3/s3-bucket-blacklisted-actions-prohibited.sentinel))

- S3 Bucket Policy Principals Should Be Validated ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/s3-bucket-policy-principal-validation.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/s3/s3-bucket-policy-principal-validation.sentinel))

- S3 Bucket Policies Should Not Grant More Permissive Inter-Account Access ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/s3-bucket-inter-account-permissions-check.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/s3/s3-bucket-inter-account-permissions-check.sentinel))

- S3 Buckets Should Have Replication Enabled ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/s3-bucket-replication-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/s3/s3-bucket-replication-enabled.sentinel))

- S3 Buckets Should Have Server-Side Encryption Enabled ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/s3-bucket-server-side-encryption-enabled.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/s3/s3-bucket-server-side-encryption-enabled.sentinel))

- SageMaker Endpoint Configurations Should Have KMS Key Configured ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/sagemaker-endpoint-configuration-kms-key-configured.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/sagemaker/sagemaker-endpoint-configuration-kms-key-configured.sentinel))

- SageMaker Notebook Instances Should Have KMS Key Configured ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/sagemaker-notebook-instance-kms-key-configured.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/sagemaker/sagemaker-notebook-instance-kms-key-configured.sentinel))

- Secrets in AWS Secrets Manager should be encrypted using customer managed keys ([docs](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/docs/policies/secretsmanager-secrets-encrypted-using-cmk.md) | [code](https://github.com/hashicorp/policy-library-iso-iec-27001-2013-annex-a-policy-set-for-aws-terraform/blob/main/policies/secretsmanager/secretsmanager-secrets-encrypted-using-cmk.sentinel))

