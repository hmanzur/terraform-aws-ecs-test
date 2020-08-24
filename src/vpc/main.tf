resource "aws_vpc" "main" {

  cidr_block = var.cidr_block

  instance_tenancy = "default"

  tags = {
    "Name"        = "vpc-${var.name}"
    "Description" = "VPC ${var.cidr_block}"
    "Terraform"   = "true"
  }
}