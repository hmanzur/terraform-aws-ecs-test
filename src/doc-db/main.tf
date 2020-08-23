resource "aws_docdb_cluster" "default" {
  cluster_identifier = var.cluster_identifier
  availability_zones = ["${var.region}a", "${var.region}b", "${var.region}c"]
  master_username    = var.master_username
  master_password    = var.master_password

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
}