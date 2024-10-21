resource "aws_db_instance" "mysql" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "5.7"  
  publicly_accessible   = false       
  instance_class       = "db.t2.micro"
  db_name              = "mydb"        
  username             = "admin"
  password             = "123"
  parameter_group_name = "default.mysql5.7"
  vpc_security_group_ids = [aws_security_group.SG.id]
  skip_final_snapshot  = true
db_subnet_group_name = aws_db_subnet_group.my_db_subnet_group.name
}
