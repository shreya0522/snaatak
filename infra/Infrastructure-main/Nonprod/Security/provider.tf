terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

backend "s3" {
    bucket         = "ot-microservise01"
    key            = "Security/Nonprod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "nonprod_network"
  }
}
provider "aws" {
  region = "us-east-1"
}