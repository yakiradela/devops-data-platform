module "eks_cluster" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "dev-eks"
  cluster_version = "1.29"
  vpc_id          = "vpc-0123456789abcdef0"
  subnet_ids      = ["subnet-abc123", "subnet-def456"]

  manage_node_groups = {
    default = {
      instance_types = ["m5.large"]
      min_size       = 2
      max_size       = 5
    }
  }
}
