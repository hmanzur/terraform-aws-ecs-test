resource "aws_security_group" "default" {
  name        = "Allow all"
  description = "Allow all for testing"
  vpc_id      = var.vpc_id

  ingress {
    description = "Open for testing only"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Description" = "ECS Security group"
    "Terraform"   = "true"
  }
}