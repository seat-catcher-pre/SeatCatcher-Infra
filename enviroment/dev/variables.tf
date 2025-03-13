variable "access_key" {
  description = "NCP access key"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "NCP secret key"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "NCP region"
  type        = string
}

variable "site" {
  description = "NCP site"
  type        = string
}

variable "support_vpc" {
  description = "NCP support vpc"
  type        = bool
}

variable "availability_zone" {
  description = "NCP availability zone"
  type        = list(string)
  default     = ["KR-1", "KR-2"]
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

variable "database_asg_id" {
  description = "Database ASG id"
  type        = number
  sensitive   = true
}

variable "ssl_cert_number" {
  description = "SSL certificate number"
  type        = number
  sensitive   = true
}

variable "backend_team" {
  description = "backend developers ip addresses"
  type        = list(string)
  sensitive   = true
}