provider "aws" {
  region = "us-east-1"
}

resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "example" {
  bucket = "${terraform.workspace}-example-bucket-${random_id.suffix.hex}"
}

output "bucket_name" {
  value = aws_s3_bucket.example.bucket
}
