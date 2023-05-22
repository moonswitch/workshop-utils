terraform {
  required_version = ">= 1.4.0"

  required_providers {
    github = {
      source  = "integrations/github"
      version = "5.25.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.4"
    }
  }
}

provider "github" {}