module "vpc" {
  source = "./modules/vpc"
  region = var.region
}

module "eks" {
  source = "./modules/eks"
  cluster_name = "${var.project_name}-eks"
  vpc_id       = module.vpc.vpc_id
  subnet_ids   = module.vpc.private_subnet_ids
}

module "rds" {
  source       = "./modules/rds"
  db_name      = "onfinance_db"
  subnet_group = module.vpc.private_subnet_ids
  vpc_id       = module.vpc.vpc_id
}
