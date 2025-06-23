provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0c94855ba95c71c99"
  instance_type = "t2.micro"
  count         = 2

  tags = {
    Name = "example-instance-${count.index}"
  }
}
