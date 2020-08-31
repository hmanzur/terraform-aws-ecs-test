variable "image_tag_mutability" {
  default     = "MUTABLE"
  description = "Image tag mutability"
}

variable "countNumber" {
  default     = 2
  description = "Keep alive images count"
}

variable "image_name" {
  description = "Registry image name"
}