# main.tf
provider "aws" {
  region = "us-east-1"   
}

# S3 bucket resource
resource "aws_s3_bucket" "my_bucket" {
  bucket = "myunique-bkt19159"
}

# Separate resource to manage versioning
resource "aws_s3_bucket_versioning" "my_bucket_versioning" {
  bucket = aws_s3_bucket.my_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}
