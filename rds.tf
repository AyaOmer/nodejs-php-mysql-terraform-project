resource "aws_db_instance" "mysql" {
  engine                = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t2.micro"
  allocated_storage   = 20
  storage_type        = "gp2"
  name                 = "mydb"
  username             = "root"
  password             = "your-password-here"
  parameter_group_name = "default.mysql8.0"
  vpc_security_group_ids = [aws_security_group.mysql.id]
  publicly_accessible   = false
}