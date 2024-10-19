resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true
     tags = {
    Name = "main-vpc"
  }
}
resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.0.0/24"
    map_public_ip_on_launch = true
    availability_zone = "us-east-1a" 
     tags = {
    Name = "public-subnet"
  }
  
} 


resource "aws_instance" "backend" {
  ami           = var.ami
  instance_type = "t2.micro"
  security_groups = [aws_security_group.SG.id]
  subnet_id              = aws_subnet.public_subnet.id
  associate_public_ip_address = true

  tags  = {
    Name  = "Backend"
  }

  root_block_device {
    volume_size = 8
    volume_type = "gp2"
    encrypted   = false
  }
}


resource "aws_instance" "frontend" {
  ami           = var.ami
  instance_type = "t2.micro"
  security_groups = [aws_security_group.SG.id]
  subnet_id              = aws_subnet.public_subnet.id
  associate_public_ip_address = true

  tags  = {
    Name  = "Frontend"
  }

  root_block_device {
    volume_size = 8
    volume_type = "gp2"
    encrypted   = false
  }
}