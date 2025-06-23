provider "aws" {
  region = "us-east-1"
}

variable "ami_id" {
  description = "Amazon Machine Image (AMI) ID"
  type        = string
  default     = "ami-0c94855ba95c71c99" # Replace with your desired AMI ID
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

resource "aws_instance" "ec2_instances" {
  for_each = toset(["instance-1", "instance-2"])

  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = each.key
  }
}
