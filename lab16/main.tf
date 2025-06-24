provider "aws" {
  region = "us-east-1"
}

# Create a VPC (required for SG)
resource "aws_vpc" "main" {
  cidr_block = "10.10.0.0/16"
}

# Security Group with dynamic ingress rules
resource "aws_security_group" "dynamic_sg" {
  name   = "dynamic-sg"
  vpc_id = aws_vpc.main.id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "DynamicSG"
  }
}
