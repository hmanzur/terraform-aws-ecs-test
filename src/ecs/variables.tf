variable "image" {}

variable "vpc_id" {}

variable "name" {
  default     = "ecs"
  description = "ECS name"
}

variable "launch_type" {
  default = "FARGATE"
}

variable "memory" {
  default = "256"
}

variable "cpu" {
  default = "128"
}