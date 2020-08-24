data "aws_iam_policy_document" "default" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type = "Service"
      identifiers = [
        "ecs.amazonaws.com",
      ]
    }
  }
}

resource "aws_iam_role" "default" {
  name               = "${var.name}-ecs-execution-role"
  assume_role_policy = data.aws_iam_policy_document.default.json
}