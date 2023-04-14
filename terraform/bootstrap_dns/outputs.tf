output "domain" {
  value = "${random_pet.subdomain.id}.${var.base_domain}"
}