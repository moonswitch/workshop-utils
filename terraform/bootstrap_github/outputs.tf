output "flux_private_key" {
  value     = tls_private_key.flux.private_key_pem
  sensitive = true
}

output "flux_public_key" {
  value = tls_private_key.flux.public_key_openssh
}