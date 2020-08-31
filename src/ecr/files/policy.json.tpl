{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Keep image deployed with tag latest",
      "selection": {
        "tagStatus": "tagged",
        "tagPrefixList": ["latest"],
        "countType": "imageCountMoreThan",
        "countNumber": 1
      },
      "action": {
        "type": "expire"
      }
    },
    {
      "rulePriority": 2,
      "description": "Keep last ${countNumber} any images",
      "selection": {
        "tagStatus": "any",
        "countType": "imageCountMoreThan",
        "countNumber": ${countNumber}
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}