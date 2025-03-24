variable "vpc_cidr_block" {
    description = "VPC CIDR block"
    type = string
}

variable "public_subnet_cidr" {
    description = "Public subnet CIDR block"
    type = string
}

variable "private_subnet_cidr" {
    description = "Private subnet CIDR block"
    type = string
}

variable "availability_zone" {
    description = "Availability zone"
    type = string
}