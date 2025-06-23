variable "aws_region" {
  description = "The AWS region where the resources will be created."
  type        = string
  default     = "us-west-2"
}

variable "public_key_path" {
  description = "Path to your public key file."
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "key_name" {
  description = "Name for the AWS key pair."
  type        = string
  default     = "default-key"
}
