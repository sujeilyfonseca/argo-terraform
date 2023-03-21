terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.59.0"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  alias = "us-east-2"
  region = "us-east-2"
  version = "~>4.59.0"
}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "AWS_ArgoCD_Terraform"
  }

  provider = aws.us-east-2
}
