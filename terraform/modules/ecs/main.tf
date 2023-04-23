/*************************************************

     _                 _      _
    | |_ __ __ __ ___ | | ___| |_  ___  _ _  ___
    | ' \\ V  V // -_)| |(_-<|  _|/ -_)| '_|(_-<
    |_||_|\_/\_/ \___||_|/__/ \__|\___||_|  /__/
                Sup dudes!

*************************************************/

resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.name
}

resource "aws_ecs_task_definition" "ecs_task_definition" {
  family                = "${var.name}-ecs-task-definition"
  container_definitions = <<DEFINITION
    [
        {
            "name": "backend",
            "image": "${var.repo_url}/backend",
            "essential": true,
            "portMappings": [
                {
                    "containerPort" : 4000,
                    "hostPort" : 4000
                }
            ],
            "memory": 512,
            "cpu": 256
        },
        {
            "name": "frontend",
            "image": "${var.repo_url}/frontend",
            "essential": true,
            "portMappings": [
                {
                    "containerPort" : 3000,
                    "hostPort" : 3000
                }
            ],
            "memory": 512,
            "cpu": 256
        }
    ]
    DEFINITION

  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  memory                   = 512
  cpu                      = 256
  execution_role_arn       = aws_iam_role.ecsTaskExecutionRole.arn
}

resource "aws_iam_role" "ecsTaskExecutionRole" {
  name               = "ecsTaskExecutionRole"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "ecsTaskExecutionRole_policy" {
  role       = aws_iam_role.ecsTaskExecutionRole.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}
