module "dev-ec2-security-group" {
  source                     = "../../modules/security-group"
  target_vpc_id              = module.dev-vpc.vpc_id
  security_group_name        = "dev_ec2_security_group"
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
  security_group_id = module.dev-ec2-security-group.security_group_id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

module "dev-mysql-sg" {
  source                     = "../../modules/security-group"
  target_vpc_id              = module.dev-vpc.vpc_id
  security_group_name        = "dev-mysql-sg"
  security_group_description = "Security group for MySQL in dev environment"
}

resource "aws_vpc_security_group_ingress_rule" "allow_from_ec2_to_rds" {
  security_group_id = module.dev-mysql-sg.security_group_id
  cidr_ipv4         = "${module.dev-vpc.vpc_cidr_block}"
  from_port         = var.database_port
  ip_protocol       = "tcp"
  to_port           = var.database_port
}
