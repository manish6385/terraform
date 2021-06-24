terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.0"

    }
  }
}

provider "aws" {
  region = var.region
  default_tags {
    tags = {
      "Environment" = "dev"
      "Owner"       = "g33kzone"
    }
  }
}