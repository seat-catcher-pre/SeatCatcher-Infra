variable "domain_name" {
  description = "Route53 domain name"
  type        = string
}

variable "api_instance_ip" {
  description = "Public IP of API instance"
  type        = string
}

variable "docs_instance_ip" {
  description = "Public IP of Docs instance"
  type        = string
}

variable "dev_sub_domain_name" {
  description = "Sub domain name"
  type        = string
}

variable "dev_api_domain_name" {
  description = "API domain name"
  type        = string
}

variable "dev_docs_domain_name" {
  description = "Docs domain name"
  type        = string
}