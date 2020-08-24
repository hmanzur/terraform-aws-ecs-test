resource "aws_ecs_task_definition" "default" {
  family = "service"

  container_definitions = <<DEFINITION
[
  {
    "cpu": ${var.cpu},
    "environment": [{
      "name": "SECRET",
      "value": "KEY"
    }],
    "essential": true,
    "image": "${var.image}:latest",
    "memory": ${var.memory},
    "memoryReservation": 64,
    "name": "${var.image}"
  }
]
DEFINITION

  tags = {
    "Description" = "ECS Task definition"
    "Terraform"   = "true"
  }
}