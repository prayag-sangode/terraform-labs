provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {
  source = "../terraform_modules/ec2"

  ami           = "ami-0a0e5d9c7acc336f1" # Replace with a valid AMI ID in your region
  instance_name = "my-ec2-instance"
}

output "instance_id" {
  value = module.ec2_instance.instance_id
}

output "public_ip" {
  value = module.ec2_instance.public_ip
}

module "s3_bucket" {
  source      = "../terraform_modules/s3"
  bucket_name = "my-simple-bucket-19159"
}

output "bucket_id" {
  value = module.s3_bucket.bucket_id
}

output "bucket_arn" {
  value = module.s3_bucket.bucket_arn
}
