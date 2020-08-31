variable "repository_url" {
  description = "ECR repository url"
}

variable "vpc_id" {
  description = "VPC id"
}

variable "cidr_block" {
  description = "VPC Subnet"
}

variable "name" {
  default     = "ecs"
  description = "ECS name"
}

variable "environment" {
  default     = "develop"
  description = "ECS environment"
}

variable "port" {
  default     = 80
  description = "Application port (default: 80)"
}

variable "repository_tag" {
  default     = "latest"
  description = "Repository tag to build (default: 'latest')"
}

variable "memory" {
  default = "256"
}

variable "cpu" {
  default = "128"
}