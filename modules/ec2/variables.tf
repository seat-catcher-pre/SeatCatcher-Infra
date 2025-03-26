variable "public_subnet" {
  description = "public subnet for the instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t2.micro"
}

variable "instance_key_name" {
  description = "Key name"
  type        = string
  sensitive = true
}

variable "key_pair_save_path" {
  description = "Path to save the key pair"
  type        = string
}