variable "subnets" {
  description = "Subnets"
  type        = list(string)
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t2.micro"
}