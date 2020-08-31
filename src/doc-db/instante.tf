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