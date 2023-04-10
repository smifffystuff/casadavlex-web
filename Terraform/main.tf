terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket = "casadavlex"
    key = "terraform/state"
    region = "eu-west-2"
  }

}

provider "aws" {
    region = "eu-west-2"
}




