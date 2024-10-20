
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

##########RDS######

