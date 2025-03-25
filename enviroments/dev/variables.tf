variable "access_key" {
  description = "AWS access key"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "AWS secret key"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "database_user_name" {
  description = "Database user name"
  type        = string
  sensitive   = true
}

variable "database_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "database_name" {
  description = "Database name"
  type        = string
  sensitive   = true
}

variable "database_port" {
  description = "Database port"
  type        = number
  sensitive   = true
}

variable "backend_team" {
  description = "backend developers ip addresses"
  type        = list(string)
  sensitive   = true
}

variable "dev_vpc_cidr_block" {
  description = "VPC CIDR block"
  type        = string
}

variable "dev_public_subnet_cidr" {
  description = "Public subnet CIDR block"
  type        = string
}

variable "dev_private_subnet_cidr" {
  description = "Private subnet CIDR block"
  type        = string
}

variable "dev_vpc_tag_name" {
  description = "Development VPC tag name"
  type        = string
}

variable "prod_vpc_cidr_block" {
  description = "VPC CIDR block"
  type        = string
}

variable "prod_public_subnet_cidr" {
  description = "Public subnet CIDR block"
  type        = string
}

variable "prod_private_subnet_cidr" {
  description = "Private subnet CIDR block"
  type        = string
}

variable "prod_vpc_tag_name" {
  description = "Production VPC tag name"
  type        = string
}

variable "terraform_state_bucket" {
  description = "Terraform state bucket name"
  type        = string
}