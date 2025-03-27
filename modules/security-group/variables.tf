variable "target_vpc_id" {
  description = "The ID of the VPC where the security group will be created"
  type        = string
}

variable "security_group_description" {
  description = "Description of the security group"
  type        = string
}

variable "security_group_name" {
  description = "Name of the security group"
  type        = string
}
