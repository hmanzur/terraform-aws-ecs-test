data "aws_vpc" "default" {
  id = var.vpc_id
}

data "aws_subnet_ids" "default" {
  vpc_id = "${data.aws_vpc.default.id}"
}

resource "aws_ecs_service" "default" {
  name            = "default"
  cluster         = aws_ecs_cluster.default.id
  task_definition = aws_ecs_task_definition.default.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    security_groups  = [aws_security_group.ecs_tasks.id]
    subnets          = data.aws_subnet_ids.default.ids
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.default.arn
    container_name   = "sproutlyapi"
    container_port   = var.port
  }

  depends_on = [
    aws_lb_listener.https_forward,
    aws_iam_role_policy_attachment.ecs_task_execution_role
  ]

  tags = {
    Environment = var.environment
    Application = var.name
  }
}