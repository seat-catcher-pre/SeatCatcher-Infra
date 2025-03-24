variable "domain_name" {
  description = "Route53 domain name"
  type = string
}

variable "api_instance_ip" {
  description = "Public IP of API instance"
  type = string
}

variable "docs_instance_ip" {
  description = "Public IP of Docs instance" 
  type = string
}