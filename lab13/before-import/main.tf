# main.tf
provider "aws" {
  region = "us-east-1"   
}

resource "aws_s3_bucket" "my_bucket" {
  # We will import an existing S3 bucket, so leave this empty for now
}
