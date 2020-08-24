output "id" {
  value = aws_ecr_repository.app.registry_id
}

output "name" {
  value = aws_ecr_repository.app.name
}

output "repository" {
  value = aws_ecr_repository.app.repository_url
}