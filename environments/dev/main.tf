terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

module "ec2_instance" {
  source = "../../modules/ec2-instance"

  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  instance_name = var.instance_name
  tags          = var.additional_tags
}

