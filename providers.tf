terraform {
  required_version = "> 1.3.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket = "terraform-tfstate-axd3"
    key    = "arroyo-challenge/arroyo.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
  #aws credentials fueron configuradas a nivel de variable de ambiente
  default_tags {
    tags = {
      Terraform = "Yes"
    }
  }
}