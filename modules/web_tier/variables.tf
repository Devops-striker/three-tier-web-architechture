variable "name" {
  description = "Prefix for web tier resources"
  type        = string
}

variable "ami" {
  description = "AMI ID for web tier instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "subnet_id" {
  description = "Private subnet ID where web instance will be launched"
  type        = string
}

variable "sg_id" {
  description = "Security group ID for web tier instance"
  type        = string
}

variable "instance_profile" {
  description = "IAM instance profile for EC2 (SSM + S3 access)"
  type        = string
}

variable "volume_size" {
  description = "Root volume size (GB)"
  type        = number
  default     = 8
}
