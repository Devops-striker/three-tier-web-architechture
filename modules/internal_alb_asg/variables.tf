variable "app_ami_id" {
  description = "AMI ID for App Tier"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "instance_profile" {
  description = "EC2 IAM Instance Profile"
  type        = string
}

variable "app_sg_id" {
  description = "App Security Group ID"
  type        = string
}

variable "internal_alb_sg_id" {
  description = "Internal ALB Security Group ID"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnets"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
