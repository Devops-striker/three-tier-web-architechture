module "vpc" {
  source = "./modules/vpc"

  vpc_cidr             = var.vpc_cidr
  azs                  = var.azs
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  db_subnet_cidrs      = var.db_subnet_cidrs
}
module "routing" {
  source              = "./modules/routing"
  vpc_id              = module.vpc.vpc_id
  internet_gateway_id = module.vpc.igw_id
  public_subnet_ids   = module.vpc.public_subnets
  private_subnet_ids  = module.vpc.private_subnets
  nat_gateway_ids     = module.vpc.nat_gateway_ids
}
