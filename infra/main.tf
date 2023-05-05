provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}

data "aws_caller_identity" "id_current_account" {}

/*==========================================
    ECR Repositories
==========================================*/
module "ecr_frontend" {
  source = "./modules/ecr"
  name   = "${var.environment_name}-frontend-repo"
}

module "ecr_backend" {
  source = "./modules/ecr"
  name   = "${var.environment_name}-backend-repo"
}

locals {
  iam_role_name = {
    devops        = "${var.environment_name}-devops-role"
    ecs           = "${var.environment_name}-ecs-task-excecution-role"
    ecs_task_role = "${var.environment_name}-ecs-task-role"
    codedeploy    = "${var.environment_name}-codedeploy-role"
  }
}

/*==========================================
    AWS Code Pipeline
==========================================*/
module "s3_codepipeline" {
  source      = "./modules/s3"
  bucket_name = "${var.aws_region}-${var.environment_name}-codepipeline"
}

module "devops_role" {
  source             = "./modules/iam"
  create_devops_role = true
  name               = local.iam_role_name["devops"]
}

module "policy_devops_role" {
  source                = "./Modules/IAM"
  name                  = "devops-${var.environment_name}"
  create_policy         = true
  attach_to             = module.devops_role.name_role
  create_devops_policy  = true
  ecr_repositories      = [module.ecr_backend.ecr_repository_arn, module.ecr_frontend.ecr_repository_arn]
  code_build_projects   = [module.codebuild_frontend.project_arn, module.codebuild_backend.project_arn]
  # code_deploy_resources = [module.codedeploy_backend.application_arn, module.codedeploy_backend.deployment_group_arn, module.codedeploy_frontend.application_arn, module.codedeploy_frontend.deployment_group_arn]
}

module "codebuild_backend" {
  source         = "./modules/codebuild"
  name           = "${var.environment_name}-codebuild-backend"
  iam_role       = module.devops_role.arn_role
  region         = var.aws_region
  account_id     = data.aws_caller_identity.id_current_account.account_id
  ecr_repo_url   = module.ecr_backend.ecr_repository_url
  folder_path    = var.folder_path_backend
  buildspec_path = var.buildspec_path

  # task_definition_family = module.ecs_taks_definition_client.task_definition_family
  container_name = "${var.environment_name}-backend-container"
  service_port   = var.service_port_backend
  # ecs_role = local.iam_role_name[""]

  # dynamodb_table_name    = module.dynamodb_table.dynamodb_table_name
}

module "codebuild_frontend" {
  source         = "./modules/codebuild"
  name           = "${var.environment_name}-codebuild-frontend"
  iam_role       = module.devops_role.arn_role
  region         = var.aws_region
  account_id     = data.aws_caller_identity.id_current_account.account_id
  ecr_repo_url   = module.ecr_frontend.ecr_repository_url
  folder_path    = var.folder_path_frontend
  buildspec_path = var.buildspec_path

  # task_definition_family = module.ecs_taks_definition_client.task_definition_family
  container_name = "${var.environment_name}-frontend-container"
  service_port   = var.service_port_frontend
  # ecs_role = local.iam_role_name[""]

  # dynamodb_table_name    = module.dynamodb_table.dynamodb_table_name
}

module "codepipeline" {
  source                          = "./modules/codepipeline"
  name                            = "${var.environment_name}-pipeline"
  codepipeline_role               = module.devops_role.arn_role
  s3_bucket                       = module.s3_codepipeline.s3_bucket_id
  github_token                    = var.github_token
  repo_owner                      = var.repository_owner
  repo_name                       = var.repository_name
  branch                          = var.repository_branch
  codebuild_project_name_backend  = module.codebuild_backend.project_id
  codebuild_project_name_frontend = module.codebuild_frontend.project_id

  depends_on = [module.policy_devops_role]
}
