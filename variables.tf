variable "region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "azs" {
  description = "Availability Zones"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "CIDRs for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDRs for private subnets"
  type        = list(string)
}

variable "db_subnet_cidrs" {
  description = "CIDRs for database subnets"
  type        = list(string)
}
variable "my_ip" {
  description = "Your IP address in CIDR notation"
  type        = string
}
variable "db_master_username" {
  type        = string
  default     = "admin"
}

variable "db_master_password" {
  type        = string
  sensitive   = true
}
variable "db_name" {
  description = "Prefix name for DB resources"
  type        = string
  default     = "myapp-db"
}
variable "app_ami" {
  type        = string
  description = "AMI ID for app tier"
}

variable "app_instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t2.micro"
}
