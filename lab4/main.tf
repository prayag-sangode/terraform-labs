# Configure the AWS provider
provider "aws" {
  region = "us-east-1"  # Change to your desired region
}

# Create a key pair
resource "aws_key_pair" "my_key_pair" {
  key_name   = "my-key-pair"
  public_key = file("~/.ssh/id_rsa.pub")  # Path to your public key file
}

# Launch an EC2 instance
resource "aws_instance" "my_instance" {
  ami             = "ami-0261755bbcb8c4a84"  # Ubuntu 20 AMI ID
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.my_key_pair.key_name

  tags = {
    Name = "WebServer"
  }
}
