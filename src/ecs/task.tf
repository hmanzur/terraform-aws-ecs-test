data "template_file" "task_definition" {
  template = file("${path.module}/files/task-definition.json.tpl")

  vars = {
    name        = var.name
    environment = var.environment
    memory      = var.memory
    repository  = var.repository_url
    tag         = var.repository_tag
    app_port    = var.port
  }
}

resource "aws_ecs_task_definition" "default" {
  family                   = "${var.name}-${var.environment}"
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  cpu                      = 256
  memory                   = var.memory
  requires_compatibilities = ["FARGATE"]
  container_definitions    = data.template_file.task_definition.rendered

  tags = {
    "Environment" = var.environment
    "Application" = var.name
    "Name"        = "Task definition for ${var.name}/${var.environment}"
    "Description" = "ECS Task Definition ${var.name}"
    "Terraform"   = "true"
  }
}