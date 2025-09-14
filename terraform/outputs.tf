output "mysql_endpoint" {
  value = aws_db_instance.mysql.address
}


output "mysql_port" {
  value = aws_db_instance.mysql.port
}


output "mysql_secret_arn" {
  value = aws_secretsmanager_secret.mysql.arn
}


output "postgres_endpoint" {
  value = aws_db_instance.postgresql.address
}


output "postgres_port" {
  value = aws_db_instance.postgresql.port
}


output "postgres_secret_arn" {
  value = aws_secretsmanager_secret.postgres.arn
}