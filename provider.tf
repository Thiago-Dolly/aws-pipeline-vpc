terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.68.0"
    }
  }

  backend "s3" {
    bucket = "terraform-aws-pipeline-sartor"
    key    = "aws-pipeline/terraform.tfstate"
    region = "us-east-1"

  }
}

provider "aws" {
  region = "us-east-1"
  # Configuration options
  default_tags {
    tags = {
      Environment = "Development"
      Project     = "AWS Pipeline"
      Owner       = "Sartor Devops"
      Manager     = "Terraform"
    }
  }
}