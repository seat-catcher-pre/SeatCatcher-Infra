module "dev-ec2-security-group" {
  source                     = "../../modules/security-group"
  target_vpc_id              = module.dev-vpc.vpc_id
  security_group_name        = "dev-ec2-security-group"
  security_group_description = "Security group for EC2 instances in dev environment"
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = module.dev-ec2-security-group.security_group_id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  security_group_id = module.dev-ec2-security-group.security_group_id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  count             = length(var.backend_team)
  security_group_id = module.dev-ec2-security-group.security_group_id
  cidr_ipv4         = element(var.backend_team, count.index)
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}