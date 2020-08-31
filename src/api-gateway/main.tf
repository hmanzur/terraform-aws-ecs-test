resource "aws_api_gateway_rest_api" "default" {
  name        = var.name
  description = "This is my API for demonstration purposes"

  tags = {
    "Description" = "Api Gateway ${var.name}"
    "Terraform"   = "true"
  }
}