output "id" {
  value = aws_ecr_repository.default.registry_id
}

output "name" {
  value = aws_ecr_repository.default.name
}

output "repository" {
  value = aws_ecr_repository.default.repository_url
}