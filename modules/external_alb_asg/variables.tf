variable "web_ami_id" {
  description = "AMI ID for web Tier"
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

variable "web_sg_id" {
  description = "web Security Group ID"
  type        = string
}

variable "alb_sg_id" {
  description = "external ALB Security Group ID"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnets"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
