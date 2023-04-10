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

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.davlex.zone_id
  name = "www.${data.aws_route53_zone.davlex.name}"
  type = "A"
  ttl = "300"
  records = ["10.0.0.1"]
}

