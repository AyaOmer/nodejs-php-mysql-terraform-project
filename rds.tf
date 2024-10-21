resource "aws_db_instance" "mysql" {
  engine            = "mysql"
  engine_version       = "8.0.39"
  allocated_storage = 20
  storage_type      = "gp2"
  db_name           = "mydb"
  #identifier              = "mydb" 
  username               = "admin"
  password               = "12345678"
  publicly_accessible    = false
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  instance_class = "db.t3.micro"

  #parameter_group_name = aws_db_parameter_group.mysql_param_group.name

  db_subnet_group_name = aws_db_subnet_group.my_db_subnet_group.name
}

resource "aws_db_parameter_group" "mysql_param_group" {
  name   = "my-mysql-param-group"
  family = "mysql8.0"
}

