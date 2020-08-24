resource "aws_subnet" "db_subnet1" {
  vpc_id = var.vpc_id

  cidr_block = "10.0.1.0/24"

  tags = {
    "Description" = "Document DB Subnet 1 ${var.cidr_block}"
    "Terraform"   = "true"
  }
}

resource "aws_subnet" "db_subnet2" {
  vpc_id = var.vpc_id

  cidr_block = "10.0.2.0/24"

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
    "Terraform"   = "true"
  }
}

resource "aws_docdb_cluster" "default" {
  cluster_identifier   = var.cluster_identifier
  availability_zones   = ["${var.region}b", "${var.region}c"]
  db_subnet_group_name = aws_docdb_subnet_group.default.name
  master_username      = var.master_username
  master_password      = var.master_password
  deletion_protection  = var.deletion_protection
  skip_final_snapshot  = var.skip_final_snapshot

  tags = {
    "Description" = "Document DB cluster ${var.cluster_identifier}"
    "Terraform"   = "true"
  }
}

resource "aws_docdb_cluster_instance" "cluster_instances" {
  count              = var.cluster_instances_count
  identifier         = "docdb-cluster-demo-${count.index}"
  cluster_identifier = aws_docdb_cluster.default.id
  instance_class     = var.instance_class

  tags = {
    "Description" = "Document DB instance ${count.index}"
    "Terraform"   = "true"
  }
}