resource "aws_subnet" "db_subnet1" {
  vpc_id = var.vpc_id

  cidr_block = cidrsubnet(var.cidr_block, 8, 1)

  tags = {
    "Description" = "Document DB Subnet 1 ${var.cidr_block}"
    "Terraform"   = "true"
  }
}

resource "aws_subnet" "db_subnet2" {
  vpc_id = var.vpc_id

  cidr_block = cidrsubnet(var.cidr_block, 8, 2)

  tags = {
    "Description" = "Document DB Subnet 2 ${var.cidr_block}"
    "Terraform"   = "true"
  }
}

resource "aws_docdb_subnet_group" "default" {
  name = "main"

  subnet_ids = [aws_subnet.db_subnet1.id, aws_subnet.db_subnet2.id]

  tags = {
    "Description" = "Document DB Subnet Group"
    "Subnet 1"    = aws_subnet.db_subnet1.cidr_block
    "Subnet 2"    = aws_subnet.db_subnet2.cidr_block
    "Terraform"   = "true"
  }
}