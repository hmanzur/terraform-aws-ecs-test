resource "aws_ecr_repository" "default" {
  name                 = var.image_name
  image_tag_mutability = var.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    "Name"        = "Registry for ${var.image_name}"
    "Description" = "ECR ${var.image_name}"
    "Terraform"   = "true"
  }
}