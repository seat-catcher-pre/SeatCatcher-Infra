variable "database_name" {
  description = "The name of the database to create when the DB instance is created."
  type        = string
  sensitive   = true
}

variable "database_allocated_storage" {
  description = "The amount of storage (in gigabytes) to be initially allocated for the database instance."
  type        = number
  default     = 20
}

variable "database_username" {
  description = "Database master username."
  type        = string
  sensitive   = true
}

variable "database_password" {
  description = "Database master password."
  type        = string
  sensitive   = true
}

variable "database_engine" {
  description = "The name of the database engine to be used for this DB instance."
  type        = string
  default     = "mysql"
}

variable "database_engine_version" {
  description = "The version number of the database engine to use."
  type        = string
  default     = "8.0"
}

variable "database_instance_class" {
  description = "The compute and memory capacity of the DB instance."
  type        = string
  default     = "db.t3.micro"
}

variable "database_parameter_group_name" {
  description = "The name of the DB parameter group to associate with this DB instance."
  type        = string
  default     = ""
}

variable "database_option_group_name" {
  description = "The name of the DB option group to associate with this DB instance."
  type        = string
  default     = ""
}

variable "database_port" {
  description = "The port on which the database accepts connections."
  type        = number
  default     = 3306
}
variable "publicly_accessible_flag" {
  description = "Specifies whether the DB instance is a Multi-AZ deployment."
  type        = bool
  default     = false
}
variable "database_security_group_ids" {
  description = "A list of VPC security groups to associate with the DB instance."
  type        = list(string)
  default     = []
}

variable "database_tag_name" {
  description = "The name of the database instance. example: dev-seatcatcher-db"
  type        = string
}

variable "database_environment_name" {
  description = "The environment name for the database instance."
  type        = string
  default     = "dev"
}

variable "private_pem_key_path" {
  description = "The path to the private key file used for SSH access."
  type        = string
  sensitive   = true
}

variable "dev_instance_public_ip" {
  description = "The public IP address of the EC2 instance."
  type        = string
  sensitive   = true
}


variable "database_subnet_ids" {
  description = "A list of subnet IDs for the DB subnet group."
  type        = list(string)
  default     = []
}

variable "database_identifier" {
  description = "The database identifier."
  type        = string
  default     = "temporary-db-instance-created-by-terraform"
}