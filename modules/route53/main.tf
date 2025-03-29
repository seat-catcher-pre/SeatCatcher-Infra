resource "aws_route53_zone" "main" {
  name = var.domain_name
}

resource "aws_route53_record" "main-ns-dev" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.dev_sub_domain_name
  type    = "NS"
  ttl     = "300"
  records = [data.aws_route53_zone.dev-hosted-zone.name_servers[0], data.aws_route53_zone.dev-hosted-zone.name_servers[1], data.aws_route53_zone.dev-hosted-zone.name_servers[2], data.aws_route53_zone.dev-hosted-zone.name_servers[3]]
}

resource "aws_route53_zone" "dev" {
  name = var.dev_sub_domain_name
}

resource "aws_route53_record" "dev-api" {
  zone_id = aws_route53_zone.dev.zone_id
  name    = var.dev_api_domain_name
  type    = "A"
  ttl     = "300"
  records = [var.dev_instance_public_ip]
}

resource "aws_route53_record" "dev-docs" {
  zone_id = aws_route53_zone.dev.zone_id
  name    = var.dev_docs_domain_name
  type    = "A"
  ttl     = "300"
  records = [var.dev_instance_public_ip]
}

data "aws_route53_zone" "dev-hosted-zone" {
  name = var.dev_sub_domain_name
}