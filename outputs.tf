output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "db_subnets" {
  value = module.vpc.db_subnets
}

output "nat_gateway_ids" {
  value = module.vpc.nat_gateway_ids
}

output "igw_id" {
  description = "The ID of igw"
  value = module.vpc.igw_id
}
output "public_route_table_id" {
  description = "The ID of the public route table."
  value       = module.routing.public_route_table_id
}
output "private_route_table_ids" {
  value = module.routing.private_route_table_ids
}
output "alb_sg_id" {
  value = module.sg.alb_sg_id
}

output "web_sg_id" {
  value = module.sg.web_sg_id
}

output "internal_alb_sg_id" {
  value = module.sg.internal_alb_sg_id
}

output "app_sg_id" {
  value = module.sg.app_sg_id
}

output "db_sg_id" {
  value = module.sg.db_sg_id
}
output "db_writer_endpoint" {
  description = "Writer endpoint of the Aurora cluster"
  value       = module.db_tier.db_writer_endpoint
}

output "db_reader_endpoint" {
  description = "Reader endpoint of the Aurora cluster"
  value       = module.db_tier.db_reader_endpoint
}

output "db_cluster_id" {
  description = "Aurora Cluster Identifier"
  value       = module.db_tier.db_cluster_id
}

output "ec2_role_name" {
  value = module.ec2_iam_role.role_name
}

output "ec2_instance_profile" {
  value = module.ec2_iam_role.instance_profile
}
output "app_instance_id" {
  description = "ID of the app tier EC2 instance"
  value       = module.app_tier.app_instance_id
}

output "app_private_ip" {
  description = "Private IP of the app tier EC2 instance"
  value       = module.app_tier.app_private_ip
}
output "web_instance_id" {
  description = "ID of the web tier EC2 instance"
  value       = module.web_tier.web_instance_id
}

output "web_public_ip" {
  description = "Public IP of the web tier EC2 instance"
  value       = module.web_tier.web_public_ip
}
output "app_ami_id" {
  value = module.ami_builder.app_ami_id
}

output "web_ami_id" {
  value = module.ami_builder.web_ami_id
}
output "internal_alb_dns" {
  value = module.internal_alb_asg.internal_alb_dns
}
output "external_alb_dns" {
  value = module.external_alb_asg.external_alb_dns
}
