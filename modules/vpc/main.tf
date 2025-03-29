resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = var.vpc_tag_name
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = element(data.aws_availability_zones.available.names, 0)
  map_public_ip_on_launch = true

  tags = {
    Name = var.public_subnet_tag_name
  }
}

resource "aws_subnet" "private_subnet_a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet_a_cidr
  availability_zone = element(data.aws_availability_zones.available.names, 0)

  tags = {
    Name = var.private_subnet_tag_name
  }
}

resource "aws_subnet" "private_subnet_b" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet_b_cidr
  availability_zone = element(data.aws_availability_zones.available.names, 1)

  tags = {
    Name = var.private_subnet_tag_name
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.igw_name
  }
}

resource "aws_route_table" "internet_gateway_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "internet-gateway-route-table"
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.internet_gateway_route_table.id
}

data "aws_availability_zones" "available" {}
