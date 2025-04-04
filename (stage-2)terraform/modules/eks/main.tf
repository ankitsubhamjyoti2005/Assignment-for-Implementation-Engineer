module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = "1.27"
  subnets         = var.subnet_ids
  vpc_id          = var.vpc_id

  manage_aws_auth = true

  node_groups = {
    onfinance-ng = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_types = ["t3.medium"]
    }
  }

  tags = {
    Environment = "dev"
    Project     = "onfinance"
  }
}

output "kubeconfig" {
  value = module.eks.kubeconfig
}
