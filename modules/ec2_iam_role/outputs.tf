output "role_name" {
  description = "IAM Role name for EC2"
  value       = aws_iam_role.this.name
}

output "instance_profile" {
  description = "IAM Instance Profile for EC2"
  value       = aws_iam_instance_profile.this.name
}
