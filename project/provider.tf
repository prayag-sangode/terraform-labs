provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket       = "tfstate-bucket19159"
    key          = "terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
