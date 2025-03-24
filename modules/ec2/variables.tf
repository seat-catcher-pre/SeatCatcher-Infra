variable "subnets" {
    description = "Subnets"
    type = list(string)
}

variable "instance_type" {
    description = "Instance type"
    type = string
    default = "t2.micro"
}

variable "instance_count" {
    description = "Number of instances"
    type = number
    default = 1
}