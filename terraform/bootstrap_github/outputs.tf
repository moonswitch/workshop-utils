output "flux_private_key" {
  value     = tls_private_key.flux.private_key_pem
  sensitive = true
}

output "flux_public_key" {
  value = tls_private_key.flux.public_key_openssh
}

output "ssh_clone_url" {
  value = github_repository.this.ssh_clone_url
}

output "github_repo_url" {
  value = github_repository.this.html_url
}