variable "aws_profile" {
  description = "The aws profile in which the AWS resources will be deployed."
  type        = string
}

variable "aws_region" {
  description = "The region in which the AWS resources will be deployed."
  type        = string
}

variable "github_token" {
  description = "Personal access token from Github"
  type        = string
  sensitive   = true
}

variable "environment_name" {
  description = "The name to prefix each AWS resource name with."
  type        = string
}

variable "folder_path_backend" {
  description = "The location of the backend files"
  type        = string
  default     = "./code/backend/."
}

variable "folder_path_frontend" {
  description = "The location of the frontend files"
  type        = string
  default     = "./code/frontend/."
}

variable "buildspec_path" {
  description = "The location of the buildspec file"
  type        = string
  default     = "./infra/templates/buildspec.yml"
}

variable "service_port_backend" {
  description = "The port used by the backend application"
  type = number
  default = 4000
}

variable "service_port_frontend" {
  description = "The port used by the frontend application"
  type = number
  default = 3000
}

variable "repository_owner" {
  description = "The name of the owner of the Github repository"
  type        = string
}

variable "repository_name" {
  description = "The name of the Github repository"
  type        = string
}

variable "repository_branch" {
  description = "The name of branch the Github repository, which is going to trigger a new CodePipeline excecution"
  type        = string
  default     = "main"
}
