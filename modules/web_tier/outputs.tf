output "web_instance_id" {
  description = "ID of the web tier EC2 instance"
  value       = aws_instance.this.id
}

output "web_public_ip" {
  description = "Public IP of the web tier EC2 instance"
  value       = aws_instance.this.public_ip
}
