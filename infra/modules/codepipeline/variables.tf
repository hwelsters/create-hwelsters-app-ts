variable "name" {
  description = "The name of the resource."
  type        = string
}

variable "codepipeline_role" {
  description = "The role assumed by codepipeline."
  type        = string
}

variable "s3_bucket" {
  description = "The S3 bucket in which the artifacts will be stored."
  type        = string
}

variable "repo_owner" {
  description = "The Github repository's owner's username"
  type        = string
}

variable "repo_name" {
  description = "The Github repository's name"
  type        = string
}

variable "branch" {
  description = "The Github branch that will be used to trigger the CodePipeline"
  type        = string
}

variable "github_token" {
  description = "Personal access token from Github"
  type        = string
}

variable "codebuild_project_name_backend" {
  description = "The Backend's CodeBuild project name"
  type        = string
}

variable "codebuild_project_name_frontend" {
  description = "The Frontend's CodeBuild project name"
  type        = string
}