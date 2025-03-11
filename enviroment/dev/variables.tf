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