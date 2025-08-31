resource "aws_msk_cluster" "this" {
  cluster_name           = "dev-msk"
  kafka_version          = "3.7.0"
  number_of_broker_nodes = 2

  broker_node_group_info {
    instance_type   = "kafka.m5.large"
    client_subnets  = ["subnet-abc123", "subnet-def456"]
    security_groups = ["sg-0fedcba9876543210"]
  }
}
