resource "aws_route53_zone" "main" {
  name = var.domain_name
}

resource "aws_route53_record" "dev-subdomain-ns" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "dev"
  type    = "NS"
  ttl     = "30"
  records = aws_route53_zone.main.name_servers
}

resource "aws_route53_record" "dev-api" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "${var.dev_api_domain_name}"
  type    = "A"
  ttl     = "30"
  records = [var.api_instance_ip]
}

resource "aws_route53_record" "dev-docs" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "${var.dev_docs_domain_name}"
  type    = "A"
  ttl     = "30"
  records = [var.docs_instance_ip]
}