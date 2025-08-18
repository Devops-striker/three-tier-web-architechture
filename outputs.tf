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
