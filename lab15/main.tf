provider "aws" {
  region = "us-east-1" # Change to your preferred AWS region
}

resource "aws_instance" "example" {
  ami           = "ami-05576a079321f21f8" # Amazon Linux AMI
  instance_type = "t2.micro"
  key_name      = "MyTFKeyPair" # Replace with your key pair name

  # File Provisioner: Copy a file to the EC2 instance
  provisioner "file" {
    source      = "local-config/app.conf" # Local file to copy
    destination = "/tmp/app.conf"         # Destination on the remote instance

    connection {
      type        = "ssh"
      user        = "ec2-user"                # Default user for Amazon Linux
      private_key = file("./MyTFKeyPair.pem") # Path to your private key
      host        = self.public_ip            # Use the instance's public IP
    }
  }

  # Remote-Exec Provisioner: Install Apache and start the service
  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y httpd",
      "sudo systemctl start httpd"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("./MyTFKeyPair.pem")
      host        = self.public_ip
    }
  }

  # Local-Exec Provisioner: Log the instance's public IP to a file
  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> instance_ips.txt"
  }

  tags = {
    Name = "TerraformProvisionersLab"
  }
}
output "key_pair_name" {
  description = "The name of the key pair used for the instance."
  value       = aws_instance.example.key_name
}

output "instance_public_ip" {
  description = "The public IP address of the instance."
  value       = aws_instance.example.public_ip
}
