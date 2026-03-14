# Copyright IBM Corp. 2025
# SPDX-License-Identifier: BUSL-1.1

import "module" "report" {
  source = "./modules/report/report.sentinel"
}

import "module" "tfresources" {
  source = "./modules/tfresources/tfresources.sentinel"
}

import "module" "tfplan-functions" {
  source = "./modules/tfplan-functions/tfplan-functions.sentinel"
}

import "module" "tfconfig-functions" {
  source = "./modules/tfconfig-functions/tfconfig-functions.sentinel"
}

policy "ecr-image-scanning-enabled" {
  source = "./policies/ecr/ecr-image-scanning-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "eks-cluster-endpoints-restrict-public-access" {
  source = "./policies/eks/eks-cluster-endpoints-restrict-public-access.sentinel"
  enforcement_level = "advisory"
}

policy "ecs-task-definition-log-configuration-present" {
  source = "./policies/ecs/ecs-task-definition-log-configuration-present.sentinel"
  enforcement_level = "advisory"
}

policy "ecs-task-definition-no-secrets-as-environment-variables" {
  source = "./policies/ecs/ecs-task-definition-no-secrets-as-environment-variables.sentinel"
  enforcement_level = "advisory"
}

policy "elasticache-redis-cluster-auto-backup-enabled" {
  source = "./policies/elasticache/elasticache-redis-cluster-auto-backup-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "elasticache-redis-replication-group-encryption-at-rest-enabled" {
  source = "./policies/elasticache/elasticache-redis-replication-group-encryption-at-rest-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "elasticache-redis-replication-group-encryption-at-transit-enabled" {
  source = "./policies/elasticache/elasticache-redis-replication-group-encryption-at-transit-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "elb-cross-zone-load-balancing-enabled" {
  source = "./policies/elb/elb-cross-zone-load-balancing-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "elb-ensure-access-logging-enabled" {
  source = "./policies/elb/elb-ensure-access-logging-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "elb-ensure-http-request-redirection" {
  source = "./policies/elb/elb-ensure-http-request-redirection.sentinel"
  enforcement_level = "advisory"
}

policy "elb-ensure-ssl-listener-acm-cert-classic-load-balancer" {
  source = "./policies/elb/elb-ensure-ssl-listener-acm-cert-classic-load-balancer.sentinel"
  enforcement_level = "advisory"
}

policy "elb-ensure-valid-desync-mitigation-mode-application-load-balancer" {
  source = "./policies/elb/elb-ensure-valid-desync-mitigation-mode.sentinel"
  enforcement_level = "advisory"
  params = {
    lb_type = "application"
  }
}

policy "elb-ensure-valid-desync-mitigation-mode-classic-load-balancer" {
  source = "./policies/elb/elb-ensure-valid-desync-mitigation-mode.sentinel"
  enforcement_level = "advisory"
  params = {
    lb_type = "classic"
  }
}

policy "rds-instance-should-be-private" {
  source = "./policies/rds/rds-instance-should-be-private.sentinel"
  enforcement_level = "advisory"
}

policy "rds-encryption-at-rest-enabled" {
  source = "./policies/rds/rds-encryption-at-rest-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "rds-cluster-and-db-snapshot-encrypted" {
  source = "./policies/rds/rds-cluster-and-db-snapshot-encrypted.sentinel"
  enforcement_level = "advisory"
}

policy "rds-ensure-cloudwatch-logs-enabled" {
  source = "./policies/rds/rds-ensure-cloudwatch-logs-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "rds-ensure-cluster-multi-az-configured" {
  source = "./policies/rds/rds-ensure-cluster-multi-az-configured.sentinel"
  enforcement_level = "advisory"
}

policy "rds-ensure-cluster-iam-auth-configured" {
  source = "./policies/rds/rds-ensure-cluster-and-db-instance-iam-auth-configured.sentinel"
  enforcement_level = "advisory"
  params = {
    resource_type = "aws_rds_cluster"
  }
}

policy "rds-ensure-db-instance-iam-auth-configured" {
  source = "./policies/rds/rds-ensure-cluster-and-db-instance-iam-auth-configured.sentinel"
  enforcement_level = "advisory"
  params = {
    resource_type = "aws_db_instance"
  }
}

policy "rds-ensure-automatic-backups-enabled" {
  source = "./policies/rds/rds-ensure-automatic-backups-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "rds-cluster-encrypted-at-rest" {
  source = "./policies/rds/rds-cluster-encrypted-at-rest.sentinel"
  enforcement_level = "advisory"
}

policy "s3-block-public-access-account-level" {
  source = "./policies/s3/s3-block-public-access-account-level.sentinel"
  enforcement_level = "advisory"
}

policy "s3-block-public-access-bucket-level" {
  source = "./policies/s3/s3-block-public-access-bucket-level.sentinel"
  enforcement_level = "advisory"
}

policy "dynamo-db-tables-point-in-time-recovery-enabled" {
  source = "./policies/dynamo-db/dynamo-db-tables-point-in-time-recovery-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "docdb-cluster-backup-retention-check" {
  source = "./policies/docdb/docdb-cluster-backup-retention-check.sentinel"
  enforcement_level = "advisory"
}

policy "docdb-cluster-storage-encrypted" {
  source = "./policies/docdb/docdb-cluster-storage-encrypted.sentinel"
  enforcement_level = "advisory"
}

policy "dynamo-db-accelerator-clusters-encryption-at-rest-enabled" {
  source = "./policies/dynamo-db/dynamo-db-accelerator-clusters-encryption-at-rest-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "dynamo-db-accelerator-clusters-encryption-in-transit-enabled" {
  source = "./policies/dynamo-db/dynamo-db-accelerator-clusters-encryption-in-transit-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "dynamo-db-tables-scales-capacity-with-demand" {
  source = "./policies/dynamo-db/dynamo-db-tables-scales-capacity-with-demand.sentinel"
  enforcement_level = "advisory"
  params = {
    max_read_capacity = 40000
    max_target_read_utilization = 90
    max_target_write_utilization = 90
    max_write_capacity = 40000
    min_read_capacity = 1
    min_target_read_utilization = 20
    min_target_write_utilization = 20
    min_write_capacity = 1
  }
}

policy "emr-block-public-access-enabled" {
  source = "./policies/emr/emr-block-public-access-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "neptune-cluster-encryption-at-rest-enabled" {
  source = "./policies/neptune/neptune-cluster-encryption-at-rest-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "neptune-cluster-automated-backups-enabled" {
  source = "./policies/neptune/neptune-cluster-automated-backups-enabled.sentinel"
  enforcement_level = "advisory"
  params = {
    backup_retention_period = 7
  }
}

policy "neptune-cluster-db-auth-enabled" {
  source = "./policies/neptune/neptune-cluster-db-auth-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "neptune-cluster-snapshot-encryption-at-rest-enabled" {
  source = "./policies/neptune/neptune-cluster-snapshot-encryption-at-rest-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "sagemaker-notebook-no-direct-internet-access" {
  source = "./policies/sagemaker/sagemaker-notebook-no-direct-internet-access.sentinel"
  enforcement_level = "advisory"
}

policy "sagemaker-notebook-instance-root-access-check" {
  source = "./policies/sagemaker/sagemaker-notebook-instance-root-access-check.sentinel"
  enforcement_level = "advisory"
}

policy "redshift-cluster-public-access-check" {
  source = "./policies/redshift/redshift-cluster-public-access-check.sentinel"
  enforcement_level = "advisory"
}

policy "redshift-cluster-should-be-encrypted-at-transit" {
  source = "./policies/redshift/redshift-cluster-should-be-encrypted-at-transit.sentinel"
  enforcement_level = "advisory"
}

policy "redshift-cluster-automated-snapshot-retention-enabled" {
  source = "./policies/redshift/redshift-cluster-automated-snapshot-retention-enabled.sentinel"
  enforcement_level = "advisory"
  params = {
    automated_snapshot_retention_period_lower_limit = 7
    automated_snapshot_retention_period_upper_limit = 35
  }
}

policy "redshift-cluster-should-be-encrypted-at-rest" {
  source = "./policies/redshift/redshift-cluster-should-be-encrypted-at-rest.sentinel"
  enforcement_level = "advisory"
}

policy "dms-endpoint-should-be-ssl-configured" {
  source = "./policies/dms/dms-endpoint-should-be-ssl-configured.sentinel"
  enforcement_level = "advisory"
}

policy "dms-redis-tls-enabled" {
  source = "./policies/dms/dms-redis-tls-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "dms-replication-task-targetdb-logging-enabled" {
  source = "./policies/dms/dms-replication-task-logging-enabled.sentinel"
  enforcement_level = "advisory"
  params = {
    db_type = "target"
  }
}

policy "dms-replication-task-sourcedb-logging-enabled" {
  source = "./policies/dms/dms-replication-task-logging-enabled.sentinel"
  enforcement_level = "advisory"
  params = {
    db_type = "source"
  }
}

policy "network-firewall-logging-enabled" {
  source = "./policies/network-firewall/network-firewall-logging-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "network-firewall-policy-rule-group-associated" {
  source = "./policies/network-firewall/network-firewall-policy-rule-group-associated.sentinel"
  enforcement_level = "advisory"
}

policy "mq-cloudwatch-audit-log-enabled" {
  source = "./policies/mq/mq-cloudwatch-audit-log-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "msk-in-cluster-node-require-encrypted-in-transit" {
  source = "./policies/msk/msk-in-cluster-node-require-encrypted-in-transit.sentinel"
  enforcement_level = "advisory"
}

policy "kinesis-stream-encrypted" {
  source = "./policies/kinesis/kinesis-stream-encrypted.sentinel"
  enforcement_level = "advisory"
}

policy "kms-restrict-iam-inline-policies-decrypt-all-kms-keys" {
  source = "./policies/kms/kms-restrict-iam-inline-policies-decrypt-all-kms-keys.sentinel"
  enforcement_level = "advisory"
}

policy "network-firewall-policy-default-action-full-packets" {
  source = "./policies/network-firewall/network-firewall-policy-default-action-full-packets.sentinel"
  enforcement_level = "advisory"
}

policy "network-firewall-policy-default-action-fragmented-packets" {
  source = "./policies/network-firewall/network-firewall-policy-default-action-fragmented-packets.sentinel"
  enforcement_level = "advisory"
}

policy "network-firewall-stateless-rule-group" {
  source = "./policies/network-firewall/network-firewall-stateless-rule-group.sentinel"
  enforcement_level = "advisory"
}

policy "api-gateway-rest-and-websocket-api-logging-enabled" {
  source = "./policies/api-gateway/api-gateway-rest-and-websocket-api-logging-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "api-gateway-access-logging-should-be-configured" {
  source = "./policies/api-gateway/api-gateway-access-logging-should-be-configured.sentinel"
  enforcement_level = "advisory"
}

policy "api-gateway-rest-configure-ssl-certificates" {
  source = "./policies/api-gateway/api-gateway-rest-configure-ssl-certificates.sentinel"
  enforcement_level = "advisory"
}

policy "cloudfront-distributions-should-encrypt-traffic-to-custom-origins" {
  source = "./policies/cloudfront/cloudfront-distributions-should-encrypt-traffic-to-custom-origins.sentinel"
  enforcement_level = "advisory"
}

policy "cloudfront-distributions-should-use-custom-ssl-tls-certificates" {
  source = "./policies/cloudfront/cloudfront-distributions-should-use-custom-ssl-tls-certificates.sentinel"
  enforcement_level = "advisory"
}

policy "cloudfront-distributions-should-have-logging-enabled" {
  source = "./policies/cloudfront/cloudfront-distributions-should-have-logging-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "cloudfront-should-require-encryption-in-transit" {
  source = "./policies/cloudfront/cloudfront-should-require-encryption-in-transit.sentinel"
  enforcement_level = "advisory"
}

policy "backup-recovery-point-encrypted" {
  source = "./policies/backup/backup-recovery-point-encrypted.sentinel"
  enforcement_level = "advisory"
}

policy "ec2-network-acl" {
  source = "./policies/ec2/ec2-network-acl.sentinel"
  enforcement_level = "advisory"
}

policy "ec2-client-vpn-connection-log-enabled" {
  source = "./policies/ec2/ec2-client-vpn-connection-log-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "ec2-ebs-encryption-enabled" {
  source = "./policies/ec2/ec2-ebs-encryption-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "ec2-launch-template-public-ip-disabled" {
  source = "./policies/ec2/ec2-launch-template-public-ip-disabled.sentinel"
  enforcement_level = "advisory"
}

policy "elasticsearch-encrypted-at-rest" {
  source = "./policies/elasticsearch/elasticsearch-encrypted-at-rest.sentinel"
  enforcement_level = "advisory"
}

policy "elasticsearch-in-vpc-only" {
  source = "./policies/elasticsearch/elasticsearch-in-vpc-only.sentinel"
  enforcement_level = "advisory"
}

policy "elasticsearch-node-to-node-encryption-check" {
  source = "./policies/elasticsearch/elasticsearch-node-to-node-encryption-check.sentinel"
  enforcement_level = "advisory"
}

policy "codebuild-project-environments-should-have-a-logging-aws-configuration" {
  source = "./policies/codebuild/codebuild-project-environments-should-have-a-logging-aws-configuration.sentinel"
  enforcement_level = "advisory"
}

policy "codebuild-s3-logs-should-be-encrypted" {
  source = "./policies/codebuild/codebuild-s3-logs-should-be-encrypted.sentinel"
  enforcement_level = "advisory"
}

policy "opensearch-encrypted-at-rest" {
  source = "./policies/opensearch/opensearch-encrypted-at-rest.sentinel"
  enforcement_level = "advisory"
}

policy "opensearch-node-to-node-encryption-check" {
  source = "./policies/opensearch/opensearch-node-to-node-encryption-check.sentinel"
  enforcement_level = "advisory"
}

policy "opensearch-access-control-enabled" {
  source = "./policies/opensearch/opensearch-access-control-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "opensearch-https-required" {
  source = "./policies/opensearch/opensearch-https-required.sentinel"
  enforcement_level = "advisory"
}

policy "iam-policy-no-statements-with-full-access" {
  source = "./policies/iam/iam-policy-no-statements-with-full-access.sentinel"
  enforcement_level = "advisory"
}

policy "iam-no-policies-attached-to-users" {
  source = "./policies/iam/iam-no-policies-attached-to-users.sentinel"
  enforcement_level = "advisory"
}

policy "iam-password-policy-strong-configuration" {
  source = "./policies/iam/iam-password-policy-strong-configuration.sentinel"
  enforcement_level = "advisory"
  params = {
    max_password_age_param = 90
    min_password_reuse_prevention_param = 24
    minimum_password_length_param = 14
  }
}

policy "s3-access-point-block-public-access-enabled" {
  source = "./policies/s3/s3-access-point-block-public-access-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "s3-bucket-block-public-read-access" {
  source = "./policies/s3/s3-bucket-block-public-read-access.sentinel"
  enforcement_level = "advisory"
}

policy "s3-bucket-block-public-write-access" {
  source = "./policies/s3/s3-bucket-block-public-write-access.sentinel"
  enforcement_level = "advisory"
}

policy "waf-classic-logging-enabled" {
  source = "./policies/waf/waf-classic-logging-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "ec2-ebs-snapshot-public-restorable-check-account-level" {
  source = "./policies/ec2/ec2-ebs-snapshot-public-restorable-check-account-level.sentinel"
  enforcement_level = "advisory"
}

policy "lambda-function-public-access-prohibited" {
  source = "./policies/lambda/lambda-function-public-access-prohibited.sentinel"
  enforcement_level = "advisory"
}

policy "step-functions-state-machine-logging-enabled" {
  source = "./policies/stepfunction/step-functions-state-machine-logging-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "ec2-attached-ebs-volumes-encrypted-at-rest" {
  source = "./policies/ec2/ec2-attached-ebs-volumes-encrypted-at-rest.sentinel"
  enforcement_level = "advisory"
}

policy "ec2-network-acl-should-have-subnet-ids" {
  source = "./policies/ec2/ec2-network-acl-should-have-subnet-ids.sentinel"
  enforcement_level = "advisory"
}

policy "ec2-vpc-flow-logging-enabled" {
  source = "./policies/ec2/ec2-vpc-flow-logging-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "opensearch-in-vpc-only" {
  source = "./policies/opensearch/opensearch-in-vpc-only.sentinel"
  enforcement_level = "advisory"
}

policy "ec2-security-group-ingress-traffic-restriction-to-unauthorized-ports" {
  source = "./policies/ec2/ec2-security-group-ingress-traffic-restriction-to-unauthorized-ports.sentinel"
  enforcement_level = "advisory"
  params = {
  }
}

policy "iam-no-admin-privileges-allowed-by-policies" {
  source = "./policies/iam/iam-no-admin-privileges-allowed-by-policies.sentinel"
  enforcement_level = "advisory"
}

policy "dms-endpoints-should-use-ssl" {
  source = "./policies/dms/dms-endpoints-should-use-ssl.sentinel"
  enforcement_level = "advisory"
}

policy "eventbridge-custom-event-bus-should-have-attached-policy" {
  source = "./policies/eventbridge/eventbridge-custom-event-bus-should-have-attached-policy.sentinel"
  enforcement_level = "advisory"
}

policy "ssm-documents-should-not-be-public" {
  source = "./policies/ssm/ssm-documents-should-not-be-public.sentinel"
  enforcement_level = "advisory"
}

policy "elb-multiple-az" {
  source = "./policies/elb/elb-multiple-az.sentinel"
  enforcement_level = "advisory"
}

policy "efs-access-point-should-enforce-user-identity" {
  source = "./policies/efs/efs-access-point-should-enforce-user-identity.sentinel"
  enforcement_level = "advisory"
}

policy "efs-file-systems-should-be-encrypted-at-rest" {
  source = "./policies/efs/efs-file-systems-should-be-encrypted-at-rest.sentinel"
  enforcement_level = "advisory"
}

policy "cloudtrail-log-file-validation-enabled" {
  source = "./policies/cloudtrail/cloudtrail-log-file-validation-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "cloudtrail-server-side-encryption-enabled" {
  source = "./policies/cloudtrail/cloudtrail-server-side-encryption-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "appsync-field-level-logging-should-be-enabled" {
  source = "./policies/appsync/appsync-field-level-logging-should-be-enabled.sentinel"
  enforcement_level = "advisory"
  params = {
  }
}

policy "route-53-public-hosted-zones-should-log-dns-queries" {
  source = "./policies/route53/route-53-public-hosted-zones-should-log-dns-queries.sentinel"
  enforcement_level = "advisory"
}

policy "cloudwatch-log-groups-should-be-retained-for-a-specified-time-period"{
  source = "./policies/cloudwatch/cloudwatch-log-groups-should-be-retained-for-a-specified-time-period.sentinel"
  enforcement_level = "advisory"
}

policy "s3-bucket-should-be-encrypted-at-rest" {
  source = "./policies/s3/s3-bucket-should-be-encrypted-at-rest.sentinel"
  enforcement_level = "advisory"
}

policy "sns-topic-should-be-encrypted-at-rest" {
  source = "./policies/sns/sns-topic-should-be-encrypted-at-rest.sentinel"
  enforcement_level = "advisory"
}

policy "cloudwatch-alarms-should-have-specified-actions-configured" {
  source = "./policies/cloudwatch/cloudwatch-alarms-should-have-specified-actions-configured.sentinel"
  enforcement_level = "advisory"
}

policy "wafv2-webacl-should-have-logging-enabled" {
  source = "./policies/waf/wafv2-webacl-should-have-logging-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "ebs-volumes-should-be-in-a-backup-plan" {
  source = "./policies/ec2/ebs-volumes-should-be-in-a-backup-plan.sentinel"
  enforcement_level = "advisory"
}

policy "network-firewall-should-be-deployed-across-multiple-azs" {
  source = "./policies/networkfirewall/network-firewall-should-be-deployed-across-multiple-azs.sentinel"
  enforcement_level = "advisory"
}

policy "eventbridge-global-endpoints-should-have-event-replication-enabled" {
  source = "./policies/eventbridge/eventbridge-global-endpoints-should-have-event-replication-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "emr-kerberos-should-be-enabled" {
  source = "./policies/emr/emr-kerberos-should-be-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "iam-policy-no-blacklisted-arn-allowed" {
  source = "./policies/iam/iam-policy-no-blacklisted-arn-allowed.sentinel"
  enforcement_level = "advisory"
}

policy "iam-policy-arn-should-be-attached" {
  source = "./policies/iam/iam-policy-arn-should-be-attached.sentinel"
  enforcement_level = "advisory"
}

policy "iam-managed-policy-should-be-attached-to-role" {
  source = "./policies/iam/iam-managed-policy-should-be-attached-to-role.sentinel"
  enforcement_level = "advisory"
}

policy "ec2-incoming-ssh-should-be-restricted" {
  source = "./policies/ec2/ec2-incoming-ssh-should-be-restricted.sentinel"
  enforcement_level = "advisory"
}

policy "ec2-belong-to-vpc" {
  source = "./policies/ec2/ec2-belong-to-vpc.sentinel"
  enforcement_level = "advisory"
}

policy "ec2-internet-gateway-allow-authorized-vpc-only" {
  source = "./policies/ec2/ec2-internet-gateway-allow-authorized-vpc-only.sentinel"
  enforcement_level = "advisory"
}

policy "mq-should-have-audit-logging-enabled" {
  source = "./policies/mq/mq-should-have-audit-logging-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "cloudtrail-multi-region-enabled" {
  source = "./policies/cloudtrail/cloudtrail-multi-region-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "elb-nlb-cross-zone-load-balancing-enabled" {
  source = "./policies/elb/elb-nlb-cross-zone-load-balancing-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "ec2-no-public-route-to-igw" {
  source = "./policies/ec2/ec2-no-public-route-to-igw.sentinel"
  enforcement_level = "advisory"
}

policy "rds-aurora-in-backup-plan" {
  source = "./policies/rds/rds-aurora-in-backup-plan.sentinel"
  enforcement_level = "advisory"
}

policy "rds-recovery-point-created-within-time-period" {
  source = "./policies/rds/rds-recovery-point-created-within-time-period.sentinel"
  enforcement_level = "advisory"
}

policy "redshift-audit-logging-should-be-enabled" {
  source = "./policies/redshift/redshift-audit-logging-should-be-enabled.sentinel"
  enforcement_level = "advisory"
}
