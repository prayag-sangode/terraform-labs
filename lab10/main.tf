provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  count = 2

  bucket = "example-bucket-random13452-${count.index}"
}
