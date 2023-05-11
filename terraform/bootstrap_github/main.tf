resource "github_repository" "this" {
  name = var.repo_name

  visibility = "public"

  template {
    owner      = "moonswitch-workshops"
    repository = "eks-workshop"
  }
}

resource "tls_private_key" "flux" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P256"
}

data "tls_public_key" "user" {
  private_key_pem = file(var.ssh_private_key_path)
}

resource "github_repository_deploy_key" "flux" {
  title      = "Flux Bot"
  repository = github_repository.this.name
  key        = tls_private_key.flux.public_key_openssh
  read_only  = false
}

resource "github_repository_deploy_key" "user" {
  title      = "Workshop User"
  repository = github_repository.this.name
  key        = data.tls_public_key.user.public_key_openssh
  read_only  = false
}