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

output "nat_gateway_ids" {
  description = "IDs of both NAT Gateways"
  value = [
    aws_nat_gateway.nat.id,
    aws_nat_gateway.nat2.id
  ]
}
