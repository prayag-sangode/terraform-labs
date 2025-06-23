# Create a key pair
resource "aws_key_pair" "my_key_pair" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

# Create a security group
resource "aws_security_group" "my_security_group" {
  name_prefix = "my-security-group"

  // Define your security group rules here
  // For example, allow inbound SSH and HTTP traffic
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Get the Ubuntu 20.04 AMI ID
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical's AWS Account ID
}

# Launch an EC2 instance
resource "aws_instance" "my_instance" {
  ami                    = data.aws_ami.ubuntu.id # Use the fetched AMI ID
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.my_key_pair.key_name
  vpc_security_group_ids = [aws_security_group.my_security_group.id] # Associate the security group with the instance

  tags = {
    Name = "WebServer"
  }
}
