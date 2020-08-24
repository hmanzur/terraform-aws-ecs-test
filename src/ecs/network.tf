resource "aws_subnet" "default" {
  vpc_id = var.vpc_id

  cidr_block = "10.0.1.0/24"

  tags = {
    "Description" = "ECS VPC Subnet"
    "Terraform"   = "true"
  }
}