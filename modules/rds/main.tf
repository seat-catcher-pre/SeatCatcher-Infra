resource "aws_db_instance" "db_instance" {
  allocated_storage      = var.database_allocated_storage
  db_name                = var.database_name
  db_subnet_group_name   = aws_db_subnet_group.db_subnet.name
  engine                 = var.database_engine
  engine_version         = var.database_engine_version
  instance_class         = var.database_instance_class
  username               = var.database_username
  password               = var.database_password
  parameter_group_name   = var.database_parameter_group_name
  option_group_name      = var.database_option_group_name
  port                   = var.database_port
  publicly_accessible    = var.publicly_accessible_flag
  vpc_security_group_ids = var.database_security_group_ids
  skip_final_snapshot    = true

  tags = {
    Environment = var.database_environment_name
    Name        = var.database_tag_name
  }
}

resource "aws_db_subnet_group" "db_subnet" {
  name = "${var.database_tag_name}-subnet-group"
  subnet_ids = var.database_subnet_ids
  tags = {
    Name        = "${var.database_tag_name}-subnet-group"
    Environment = var.database_environment_name
  }
}