resource "aws_subnet" "ecs" {
  vpc_id = var.vpc_id

  cidr_block = cidrsubnet(var.cidr_block, 8, 2)

  tags = {
    "Description" = "ECS Subnet ${var.cidr_block}"
    "Terraform"   = "true"
  }
}