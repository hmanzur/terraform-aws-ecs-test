resource "aws_ecs_cluster" "default" {
  name = "${var.name}-ecs-cluster"

  tags = {
    "Description" = "ECS Cluster"
    "Terraform"   = "true"
  }
}