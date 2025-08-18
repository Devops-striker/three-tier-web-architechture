variable "vpc_id" {
  description = "The VPC ID where security groups will be created"
  type        = string
}

variable "my_ip" {
  description = "Your IP address in CIDR notation (e.g., 203.0.113.25/32)"
  type        = string
}
