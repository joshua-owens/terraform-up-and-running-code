provider "aws" {
  region = "us-east-2"
}

variable "db_password" {
  description = "The password for the database."
  type        = string
}

module "mysql_database" {
  source = "../../../modules/data-stores/mysql"

  db_name           = "databasestaging"
  db_password = var.db_password
  db_identifier_prefix = "terraform-up-and-running-staging"
}

terraform {
  backend "s3" {
    bucket         = "jowens-terraform-up-and-running-state"
    key            = "staging/data-stores/mysql/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "jowens-terraform-state-locks"
    encrypt        = true
  }
}
