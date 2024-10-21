resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
  tags = {
    Name = "public-subnet_1"
  }

}
resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"
  tags = {
    Name = "public-subnet_2"
  }

}


resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "main-vpc"
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "pub_route_table" {

  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id

  }
  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "public_rt_assoc_1" {
  route_table_id = aws_route_table.pub_route_table.id
  subnet_id      = aws_subnet.public_subnet_1.id
}

resource "aws_route_table_association" "public_rt_assoc_2" {
  route_table_id = aws_route_table.pub_route_table.id
  subnet_id      = aws_subnet.public_subnet_2.id
}

########## DB Subnet Group has two subnets from different AZs
resource "aws_db_subnet_group" "my_db_subnet_group" {
  name = "my-db-subnet-group"
  subnet_ids = [
    aws_subnet.public_subnet_1.id,
    aws_subnet.public_subnet_2.id,
  ]

  tags = {
    Name = "My DB Subnet Group"
  }
}
