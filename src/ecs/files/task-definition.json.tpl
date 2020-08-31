[
  {
    "name": "${name}",
    "image": "${repository}:${tag}",
    "essential": true,
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-region": "${region}",
        "awslogs-stream-prefix": "${name}-${environment}-service",
        "awslogs-group": "awslogs-${name}-${environment}"
      }
    },
    "portMappings": [
      {
        "containerPort": ${port},
        "hostPort": ${port},
        "protocol": "tcp"
      }
    ],
    "cpu": 1,
    "environment": [
      {
        "name": "NODE_ENV",
        "value": "${environment}"
      },
      {
        "name": "PORT",
        "value": "${port}"
      }
    ],
    "ulimits": [
      {
        "name": "nofile",
        "softLimit": 65536,
        "hardLimit": 65536
      }
    ],
    "mountPoints": [],
    "memory": ${memory},
    "volumesFrom": []
  }