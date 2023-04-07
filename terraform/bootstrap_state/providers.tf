terraform {
  required_version = ">= 0.13.0"

  required_providers {
    aws = ">= 3.75.0"
  }
}

provider "aws" {
  region  = var.region
}