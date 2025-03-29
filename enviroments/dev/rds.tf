module "dev-mysql" {
  source                        = "../../modules/rds"
  database_identifier = "seatcatcher-dev-db"
  database_allocated_storage    = 20
  database_name                 = "devdb"
  database_username             = "admin"
  database_password             = "password"
  database_engine               = "mysql"
  database_engine_version       = "8.0"
  database_instance_class       = "db.t3.micro"
  database_parameter_group_name = "default.mysql8.0"
  database_option_group_name    = "default:mysql-8-0"
  database_port                 = 3306
  publicly_accessible_flag      = false
  database_security_group_ids   = [module.dev-mysql-sg.security_group_id]
  database_environment_name     = "dev"
  database_tag_name             = "dev-mysql"
  dev_instance_public_ip        = module.dev-instance.public_ip
  private_pem_key_path          = "${var.dev_instance_key_name}/${var.dev_key_pair_save_path}.pem"
  depends_on = [ module.dev-instance ]
  database_subnet_ids = [
    module.dev-vpc.private_subnet_a_id,
    module.dev-vpc.private_subnet_b_id
  ]
}