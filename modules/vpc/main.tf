resource "aws_vpc" "dev" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "dev-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = element(data.aws_availability_zones.available.names, 0)
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.dev.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = element(data.aws_availability_zones.available.names, 0)

  tags = {
    Name = "private-subnet"
  }
}

data "aws_availability_zones" "available" {}
