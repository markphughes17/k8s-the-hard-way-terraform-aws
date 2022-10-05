terraform {
    required_version = "~> 1.0"

    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 3.0"
      }
    }

    backend "s3" {
        bucket = "markhughes-tfstate"
        key = "k8s-tfstate"
        region = "eu-west-1"
    }
}

provider "aws" {
    region = "us-west-1"
}