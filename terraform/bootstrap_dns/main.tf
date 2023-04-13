resource "random_pet" "subdomain" {}

resource "aws_route53_zone" "main" {
  name = "${random_pet.subdomain.id}.${var.base_domain}"
}

data "dnsimple_zone" "zone" {
  name = var.base_domain
}

resource "dnsimple_zone_record" "subdomain" {
  count = 4

  zone_name = data.dnsimple_zone.zone.name
  name      = random_pet.subdomain.id
  value     = aws_route53_zone.main.name_servers[count.index]
  type      = "NS"
  ttl       = 60

  depends_on = [
    aws_route53_zone.main
  ]
}