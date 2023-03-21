//*************************************************
//
//     _                 _      _
//    | |_ __ __ __ ___ | | ___| |_  ___  _ _  ___
//    | ' \\ V  V // -_)| |(_-<|  _|/ -_)| '_|(_-<
//    |_||_|\_/\_/ \___||_|/__/ \__|\___||_|  /__/
//                Sup dudes!
//
//*************************************************

terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-west-1"
}

resource "aws_s3_bucket" "bucky" {
  bucket = "loveneet-bucket"

  tags = {
    Name = "My bucket"
  }
}

resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.bucky.id
  policy = data.aws_iam_policy_document.allow_access_from_another_account.json
}

data "aws_iam_policy_document" "allow_access_from_another_account" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["123456789012"]
    }

    actions = [
      "s3:GetObject",
    ]

    resources = [
      "${aws_s3_bucket.bucky.arn}/*",
    ]
  }
}

# resource "aws_instance" "bucky" {
#   ami                    = "ami-0d221cb540e0015f4"
#   instance_type          = "t2.micro"
#   vpc_security_group_ids = [aws_security_group.instance.id]

#   user_data = <<-EOF
#               #!/bin/bash
#               echo "Hello, World" > index.html
#               nohup busybox httpd -f -p ${var.server_port} &
#               EOF

#   user_data_replace_on_change = true

#   tags = {
#     Name = "${var.name}-instance"
#   }
# }

# resource "aws_security_group" "instance" {

#   name = "${var.name}-security-group"

#   ingress {
#     from_port   = var.server_port
#     to_port     = var.server_port
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }
