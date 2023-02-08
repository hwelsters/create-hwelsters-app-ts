resource "aws_s3_bucket" "s3_bucket" {
    bucket = "${var.project_name}_s3_bucket"
}