resource "aws_lb" "default" {
  name               = "${var.name}-alb"
  subnets            = [aws_subnet.default.id]
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb.id]

  tags = {
    "Environment" = var.environment
    "Application" = var.name
    "Description" = "Task definition for ${var.name}/${var.environment}"
    "Terraform"   = "true"
  }
}

resource "aws_lb_target_group" "default" {
  name        = "${var.name}-alb-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    healthy_threshold   = "3"
    interval            = "90"
    protocol            = "HTTP"
    matcher             = "200-299"
    timeout             = "20"
    path                = "/"
    unhealthy_threshold = "2"
  }
}

resource "aws_lb_listener" "https_forward" {
  load_balancer_arn = aws_lb.default.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.default.arn
  }
}
