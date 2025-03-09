# Create Dev VPC
resource "aws_vpc" "dev_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Dev"
  }
}

# Create public subnet
resource "aws_subnet" "dev_public_subnet" {
  vpc_id     = aws_vpc.dev_vpc.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "Dev Public Subnet"
  }
}

# Create private subnet
resource "aws_subnet" "dev_private_subnet" {
  vpc_id     = aws_vpc.dev_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Dev Private Subnet"
  }
}

# Create internet gateway
resource "aws_internet_gateway" "dev_vpc_igw" {
  vpc_id = aws_vpc.dev_vpc.id

  tags = {
    Name = "Dev Internet Gateway"
  }
}

# Create Route Table
resource "aws_route_table" "dev_route_table" {
  vpc_id = aws_vpc.dev_vpc.id # Attach to Dev Main VPC (Not subnets)

  route = []

  tags = {
    Name = "Dev VPC Route Table"
  }
}

# To Internet route
resource "aws_route" "dev_route_table_internet" {
  route_table_id         = aws_route_table.dev_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.dev_vpc_igw.id
}

# Associate Route Table with Subnets
resource "aws_route_table_association" "dev_public_subnet_association" {
  subnet_id      = aws_subnet.dev_public_subnet.id
  route_table_id = aws_route_table.dev_route_table.id
}