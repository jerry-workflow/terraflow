resource "aws_vpc" "main" {
  cidr_block    = "60.0.0.0/16"
  tags = {
    Name        = "cicd-vpc"
  }
}

resource "aws_subnet" "pub" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "60.0.1.0/24"

  tags = {
    Name = "cicd-public-subnet"
  }
}

resource "aws_subnet" "pri" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "60.0.2.0/24"

  tags = {
    Name = "cicd-private-subnet"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "cicd-igw"
  }
}

resource "aws_route_table" "rte" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "cicd-route"
  }
}