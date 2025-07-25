terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.3.0"
    }
  }
}
provider "aws" {
  region = "ap-south-1"
  default_tags {
    tags = {
      Environment = "Test"
      Project     = "terraform-rds"
      Owner       = "glps"
    }
  }
}