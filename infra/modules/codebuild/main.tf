resource "aws_codebuild_project" "aws_codebuild" {
  name          = var.name
  description   = "Terraform codebuild project"
  build_timeout = "10"
  service_role  = var.iam_role

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = "aws/codebuild/standard:4.0"
    type            = "LINUX_CONTAINER"
    privileged_mode = true

    environment_variable {
      name  = "AWS_REGION"
      value = var.region
    }

    environment_variable {
      name  = "AWS_ACCOUNT_ID"
      value = var.account_id
    }

    environment_variable {
      name  = "REPO_URL"
      value = var.ecr_repo_url
    }

    environment_variable {
      name  = "IMAGE_TAG"
      value = "latest"
    }

    # DB STUFF, CHANGE LATER
    # environment_variable {
    #   name  = "DYNAMODB_TABLE"
    #   value = "latest"
    # }

    # ECS STUFF, CHANGE LATER
    # environment_variable {
    #   name  = "TASK_DEFINITION_FAMILY"
    #   value = var.task_definition_family
    # }

    environment_variable {
      name  = "CONTAINER_NAME"
      value = var.container_name
    }

    environment_variable {
      name  = "SERVICE_PORT"
      value = var.service_port
    }

    environment_variable {
      name  = "FOLDER_PATH"
      value = var.folder_path
    }
  }

  logs_config {
    cloudwatch_logs {
      group_name  = "log-group"
      stream_name = "log-stream"
    }
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = var.buildspec_path
  }
}
