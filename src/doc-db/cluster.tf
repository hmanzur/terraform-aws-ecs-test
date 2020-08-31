resource "aws_docdb_cluster" "default" {
  cluster_identifier   = var.cluster_identifier
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