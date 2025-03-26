variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-northeast-2"
}

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

variable "terraform_state_bucket" {
  description = "Name of the S3 bucket to store Terraform state"
  type        = string
}

variable "dev_key" {
  description = "Name of state dev_key"
  type        = string
}

variable "domain_name" {
  description = "Domain name"
  type        = string
}

variable "dev_sub_domain_name" {
  description = "Development sub domain name"
  type        = string
}

variable "dev_api_domain_name" {
  description = "Development API domain name"
  type        = string
}

variable "dev_docs_domain_name" {
  description = "Development docs domain name"
  type        = string
}