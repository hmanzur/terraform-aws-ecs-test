resource "aws_ecr_repository" "app" {
  name                 = var.image_name
  image_tag_mutability = var.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    "Name"        = var.image_name
    "Description" = "ECR ${var.image_name}"
    "Terraform"   = "true"
  }
}