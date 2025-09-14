resource "random_password" "mysql_password" {
  length           = 16
  special          = true
  override_special = "_%@"
}


resource "random_password" "postgres_password" {
  length           = 16
  special          = true
  override_special = "_%@"
}


resource "aws_secretsmanager_secret" "mysql" {
  name        = "mysql-master-password"
  description = "Master password for MySQL RDS instance"
}


resource "aws_secretsmanager_secret_version" "mysql_version" {
  secret_id = aws_secretsmanager_secret.mysql.id
  secret_string = jsonencode({
    username = "admin"
    password = random_password.mysql_password.result
  })
}


resource "aws_secretsmanager_secret" "postgres" {
  name        = "postgres-master-password"
  description = "Master password for Postgres RDS instance"
}

resource "aws_secretsmanager_secret_version" "postgres_version" {
  secret_id = aws_secretsmanager_secret.postgres.id
  secret_string = jsonencode({
    username = "admin"
    password = random_password.postgres_password.result
  })
}