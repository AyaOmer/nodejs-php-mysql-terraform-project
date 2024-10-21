output "public_ip_backen" {

  value = aws_instance.backend.public_ip
}

output "public_ip_frontend" {

  value = aws_instance.frontend.public_ip
}
output "db_endpoint" {
  value = aws_db_instance.mysql.endpoint
}
