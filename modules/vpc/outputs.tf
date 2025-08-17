output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnets" {
  value = aws_subnet.public[*].id
}

output "private_subnets" {
  value = aws_subnet.private[*].id
}

output "db_subnets" {
  value = aws_subnet.db[*].id
}

output "igw_id" {
  description = "The ID of igw"
  value = aws_internet_gateway.igw.id
}

output "nat_gateway_id" {
  description = "The IDs of the NAT gateways."
  value       = aws_nat_gateway.nat[*].id
}
