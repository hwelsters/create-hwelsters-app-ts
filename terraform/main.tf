provider "aws" {
    region = "us-west-1"
}

resource "aws_instance" "main" {
  ami = "ami-060d3509162bcc386"
  instance_type = "t2.micro"
}