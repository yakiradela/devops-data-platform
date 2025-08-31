terraform {
  required_version = ">= 1.6.0"
}

provider "aws" {
  region = "us-east-2"
}

module "vpc" {
  source = "../../modules/vpc"
}

module "eks" {
  source          = "../../modules/eks"
  vpc_id          = "vpc-0123456789abcdef0"
  private_subnets = ["subnet-abc123", "subnet-def456"]
}

module "rds" {
  source          = "../../modules/rds"
  private_subnets = ["subnet-abc123", "subnet-def456"]
  sg_id           = "sg-0123456789abcdef0"
  username        = "etl"
  password        = "chance-me"
}

module "kafka" {
  source          = "../../modules/kafka"
  private_subnets = ["subnet-abc123", "subnet-def456"]
  sg_id           = "sg-0fedcba9876543210"
}

module "s3" {
  source              = "../../modules/s3"
  bucket_name         = "dev-data-platform-bucket"
  force_destroy       = true
  versioning_enabled  = true
}

module "redshift" {
  source                  = "../../modules/redshift"
  subnet_ids              = ["subnet-abc123", "subnet-def456"]
  master_username         = "adminuser"
  master_password         = "yakiradela@A"
  redshift_database_name  = "dataplatform"
}
