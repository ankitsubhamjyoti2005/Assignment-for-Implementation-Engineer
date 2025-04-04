resource "aws_secretsmanager_secret" "db_secret" {
  name = "database-credentials"
}

resource "aws_secretsmanager_secret_version" "db_secret_version" {
  secret_id     = aws_secretsmanager_secret.db_secret.id
  secret_string = jsonencode({
    username = "admin"
    password = "supersecurepassword"
  })
}
