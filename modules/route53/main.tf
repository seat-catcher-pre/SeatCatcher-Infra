resource "aws_route53_zone" "main" {
  name = var.domain_name
}

resource "aws_route53_zone" "dev" {
  name = "dev.${var.domain_name}"

  tags = {
    Environment = "dev"
  }
}

resource "aws_route53_record" "dev-ns" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "dev.${var.domain_name}"
  type    = "NS"
  ttl     = "30"
  records = aws_route53_zone.dev.name_servers
}

resource "aws_route53_record" "dev-api" {
  zone_id = aws_route53_zone.dev.zone_id
  name    = "api.dev.${var.domain_name}"
  type    = "A"
  ttl     = "30"
  records = [var.api_instance_ip]
}

resource "aws_route53_record" "dev-docs" {
  zone_id = aws_route53_zone.dev.zone_id
  name    = "docs.dev.${var.domain_name}"
  type    = "A"
  ttl     = "30"
  records = [var.docs_instance_ip]
}