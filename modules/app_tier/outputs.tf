output "app_instance_id" {
  description = "ID of the app tier EC2 instance"
  value       = aws_instance.this.id
}

output "app_private_ip" {
  description = "Private IP of the app tier EC2 instance"
  value       = aws_instance.this.private_ip
}
