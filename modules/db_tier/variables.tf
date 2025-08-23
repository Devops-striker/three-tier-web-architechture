variable "name" {
  description = "Prefix name for DB resources"
  type        = string
}

variable "db_subnets" {
  description = "List of DB subnets"
  type        = list(string)
}

variable "db_sg_id" {
  description = "Security Group ID for DB"
  type        = string
}

variable "instance_class" {
  description = "Instance class for Aurora instances"
  type        = string
  default     = "db.r6g.large"
}

variable "replica_count" {
  description = "Number of Aurora reader replicas"
  type        = number
  default     = 1
}

variable "master_username" {
  description = "Master username for DB"
  type        = string
  default     = "admin"
}

variable "master_password" {
  description = "Master password for DB"
  type        = string
  sensitive   = true
}
