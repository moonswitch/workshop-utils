terraform {
  required_version = ">= 1.4.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.62.0"
    }
    dnsimple = {
      source  = "dnsimple/dnsimple"
      version = "0.17.0"
    }
  }
}

provider "aws" {
  region = var.region
}

provider "dnsimple" {
  prefetch = true
}