//*************************************************
//
//     _                 _      _
//    | |_ __ __ __ ___ | | ___| |_  ___  _ _  ___
//    | ' \\ V  V // -_)| |(_-<|  _|/ -_)| '_|(_-<
//    |_||_|\_/\_/ \___||_|/__/ \__|\___||_|  /__/
//                Sup dudes!
//
//*************************************************

variable "name" {
  description = "The website's name"
  type        = string
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}

variable "aws_region" {
  description = "The AWS region in which you want to deploy the resources"
}