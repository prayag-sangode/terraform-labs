provider "aws" {
  region = "us-east-1" # Set your desired AWS region
}

resource "aws_instance" "my_instance" {
  ami             = "ami-0261755bbcb8c4a84"  # Ubuntu 20 AMI ID (us-east-1)
  instance_type = "t2.micro"
}
