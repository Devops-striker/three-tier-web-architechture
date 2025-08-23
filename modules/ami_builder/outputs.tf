output "app_ami_id" {
  value = aws_ami_from_instance.app_ami.id
}

output "web_ami_id" {
  value = aws_ami_from_instance.web_ami.id
}
