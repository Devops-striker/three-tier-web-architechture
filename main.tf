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
module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
  my_ip  = var.my_ip
}
module "db_tier" {
  source          = "./modules/db_tier"
  name            = "myapp-db"
  db_subnets      = module.vpc.db_subnets     # from your VPC module output
  db_sg_id        = module.sg.db_sg_id        # from your SG module output
  instance_class  = "db.r6g.large"
  replica_count   = 1                         # 1 writer + 1 reader
  master_username = var.db_master_username
  master_password = var.db_master_password          # keep in SSM/Secrets Manager ideally
}
module "ec2_iam_role" {
  source = "./modules/ec2_iam_role"
  name   = "myapp"
}
module "app_tier" {
  source           = "./modules/app_tier"
  name             = "app-tier"
  ami              = var.app_ami
  instance_type    = var.app_instance_type
  subnet_id        = module.vpc.private_subnets[0]
  sg_id            = module.sg.app_sg_id
  instance_profile = module.ec2_iam_role.instance_profile
  volume_size      = 8
}
module "web_tier" {
  source           = "./modules/web_tier"
  name             = "web-tier"
  ami              = var.app_ami
  instance_type    = var.app_instance_type
  subnet_id        = module.vpc.public_subnets[0]
  sg_id            = module.sg.web_sg_id
  instance_profile = module.ec2_iam_role.instance_profile
  volume_size      = 8
}
module "ami_builder" {
  source          = "./modules/ami_builder"
  app_instance_id = module.app_tier.app_instance_id
  web_instance_id = module.web_tier.web_instance_id
}
module "internal_alb_asg" {
  source             = "./modules/internal_alb_asg"
  app_ami_id         = module.ami_builder.app_ami_id
  instance_type      = var.app_instance_type
  instance_profile   = module.ec2_iam_role.instance_profile
  app_sg_id          = module.sg.app_sg_id
  internal_alb_sg_id = module.sg.internal_alb_sg_id
  private_subnets    = module.vpc.private_subnets
  vpc_id             = module.vpc.vpc_id
}
module "external_alb_asg" {
  source             = "./modules/external_alb_asg"
  web_ami_id         = module.ami_builder.web_ami_id
  instance_type      = var.app_instance_type
  instance_profile   = module.ec2_iam_role.instance_profile
  web_sg_id          = module.sg.web_sg_id
  alb_sg_id          = module.sg.alb_sg_id
  public_subnets     = module.vpc.public_subnets
  vpc_id             = module.vpc.vpc_id
}
