# Output the ID of the public route table
output "public_route_table_id" {
  description = "The ID of the public route table."
  value       = aws_route_table.public.id
}
output "private_route_table_ids" {
  description = "IDs of private route tables"
  value       = [
    aws_route_table.private_az1.id,
    aws_route_table.private_az2.id
  ]
}
