resource "aws_db_instance" "example" {
  skip_final_snapshot = true
  instance_class      = "db.t2.micro"
  identifier_prefix   = var.db_identifier_prefix
  engine              = "mysql"
  allocated_storage   = 10
  name                = var.db_name
  username            = "admin"
  password            = var.db_password
}