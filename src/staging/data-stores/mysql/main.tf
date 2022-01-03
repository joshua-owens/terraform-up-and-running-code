provider "aws" {
  region = "us-east-2"
}

resource "aws_db_instance" "example" {
  skip_final_snapshot = true
  instance_class      = "db.t2.micro"
  identifier_prefix   = "terraform-up-and-running"
  engine              = "mysql"
  allocated_storage   = 10
  name                = "example_database"
  username            = "admin"
  password            = var.db_password
}