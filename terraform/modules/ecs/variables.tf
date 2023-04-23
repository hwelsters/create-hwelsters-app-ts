/*************************************************

     _                 _      _
    | |_ __ __ __ ___ | | ___| |_  ___  _ _  ___
    | ' \\ V  V // -_)| |(_-<|  _|/ -_)| '_|(_-<
    |_||_|\_/\_/ \___||_|/__/ \__|\___||_|  /__/
                Sup dudes!

*************************************************/

variable "name" {
  description = "The name of your ECS Cluster"
  type        = string
}

variable "repo_url" {
  description = "The repo URL of ECR"
  type        = string
}
