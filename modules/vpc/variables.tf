variable "vpc_cidr_block" {
  description = "VPC CIDR block"
  type        = string
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR block"
  type        = string
}

variable "private_subnet_a_cidr" {
  description = "Private subnet CIDR block"
  type        = string
}

variable "private_subnet_b_cidr" {
  description = "Private subnet CIDR block"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone"
  type        = string
}

variable "vpc_tag_name" {
  description = "value of the Name tag for the VPC"
  type        = string
}

variable "public_subnet_tag_name" {
  description = "value of the Name tag for the public subnet"
  type        = string
}

variable "private_subnet_tag_name" {
  description = "value of the Name tag for the private subnet"
  type        = string
}

variable "igw_name" {
  description = "value of the Name tag for the internet gateway"
  type        = string
}