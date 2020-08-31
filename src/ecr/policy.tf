resource "aws_ecr_lifecycle_policy" "repo-policy" {
  repository = aws_ecr_repository.default.name

  policy = templatefile("${path.module}/files/policy.json.tpl", {
    countNumber = var.countNumber
  })
}
