provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}

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

/*==========================================
    AWS Code Pipeline
==========================================*/
