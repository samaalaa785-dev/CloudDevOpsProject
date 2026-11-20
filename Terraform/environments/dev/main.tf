terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {}
}

provider "aws" {
  region = var.aws_region
}

locals {
  project_name = "clouddevops"
  environment  = "dev"
  cluster_name = "${local.project_name}-${local.environment}-eks"
}

module "network" {
  source = "../../modules/network"

  project_name         = local.project_name
  environment          = local.environment
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.11.0/24", "10.0.12.0/24"]
  enable_nat_gateway   = true
}

module "ecr" {
  source = "../../modules/ecr"

  project_name = local.project_name
}

module "eks" {
  source = "../../modules/eks"

  project_name        = local.project_name
  cluster_name        = local.cluster_name
  kubernetes_version  = var.kubernetes_version
  private_subnet_ids  = module.network.private_subnet_ids
  public_access_cidrs = var.public_access_cidrs
  node_instance_types = var.node_instance_types
  desired_size        = 2
  min_size            = 2
  max_size            = 2
}
