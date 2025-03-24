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
