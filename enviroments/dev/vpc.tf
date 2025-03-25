module "dev_vpc" {
  source              = "../../modules/vpc"
  vpc_cidr_block      = var.dev_vpc_cidr_block
  public_subnet_cidr  = var.dev_public_subnet_cidr
  private_subnet_cidr = var.dev_private_subnet_cidr
  vpc_tag_name        = var.dev_vpc_tag_name
  availability_zone   = element(data.aws_availability_zones.available.names, 0)
}

module "prod_vpc" {
  source              = "../../modules/vpc"
  vpc_cidr_block      = var.prod_vpc_cidr_block
  public_subnet_cidr  = var.prod_public_subnet_cidr
  private_subnet_cidr = var.prod_private_subnet_cidr
  vpc_tag_name        = var.prod_vpc_tag_name
  availability_zone   = element(data.aws_availability_zones.available.names, 0)
}