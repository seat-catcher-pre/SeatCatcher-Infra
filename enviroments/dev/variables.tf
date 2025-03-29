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

variable "dev_private_subnet_a_cidr" {
  description = "Private subnet CIDR block"
  type        = string
}

variable "dev_private_subnet_b_cidr" {
  description = "Private subnet CIDR block"
  type        = string
}

variable "dev_vpc_tag_name" {
  description = "Development VPC tag name"
  type        = string
}

variable "dev_igw_name" {
  description = "Internet gateway name"
  type        = string
}

variable "dev_private_subnet_tag_name" {
  description = "Private subnet tag name"
  type        = string
}

variable "dev_public_subnet_tag_name" {
  description = "Public subnet tag name"
  type        = string
}

variable "terraform_state_bucket" {
  description = "Terraform state bucket name"
  type        = string
  sensitive   = true
}

variable "seatcatcher_images_bucket" {
  description = "Seatcatcher images bucket name"
  type        = string
  sensitive   = true
}

variable "dev_instance_key_name" {
  description = "Key name for the dev environment instances"
  type        = string
  sensitive   = true
}

variable "dev_key_pair_save_path" {
  description = "Path to save the key pair for the dev environment instances"
  type        = string
  sensitive   = true
}