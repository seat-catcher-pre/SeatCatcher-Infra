module "dev-mysql" {
  source                        = "../../modules/rds"
  database_identifier           = var.database_identifier
  database_allocated_storage    = 20
  database_name                 = var.database_name
  database_username             = var.database_username
  database_password             = var.database_password
  database_engine               = "mysql"
  database_engine_version       = "8.0"
  database_instance_class       = "db.t3.micro"
  database_parameter_group_name = "default.mysql8.0"
  database_option_group_name    = "default:mysql-8-0"
  database_port                 = var.database_port
  publicly_accessible_flag      = false
  database_security_group_ids   = [module.dev-mysql-sg.security_group_id]
  database_environment_name     = "dev"
  database_tag_name             = "dev-mysql"
  depends_on                    = [module.dev-instance]
  database_subnet_ids = [
    module.dev-vpc.private_subnet_a_id,
    module.dev-vpc.private_subnet_b_id
  ]
}