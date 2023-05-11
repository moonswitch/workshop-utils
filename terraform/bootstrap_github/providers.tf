terraform {
  required_version = ">= 1.4.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.62.0"
    }
    github = {
      source  = "integrations/github"
      version = "5.25.0"
    }
  }
}

provider "aws" {
  region = var.region
}

provider "github" {
  token = var.github_token
  owner = var.github_owner
}