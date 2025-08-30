resource "aws_redshift_subnet_group" "default" {
  name       = "redshift-subnet-group"
  description = "Subnet group for Redshift cluster"
  subnet_ids = [
    "subnet-abc123", 
    "subnet-def456"
  ]
}

resource "aws_redshift_cluster" "main" {
  cluster_identifier = "data-platform-redshift"
  node_type          = "dc2.large"
  master_username    = "adminuser"
  master_password    = "yakiradela@A"
  database_name      = "dataplatform"
  cluster_type       = "single-node"

  port                      = 5439
  publicly_accessible       = false
  skip_final_snapshot       = true
  cluster_subnet_group_name = aws_redshift_subnet_group.default.name

  tags = {
    Environment = "dev"
    Name        = "RedshiftDataPlatform"
  }
}
