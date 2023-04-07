variable "region" {
  description = "AWS region."
  type        = string
}

variable "base_domain" {
  description = "Base domain to which a subdomain will be added."
  type        = string
}

variable "subdomain" {
  description = "Subdomain to be delegated from the base_domain"
  type        = string
}