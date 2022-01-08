provider "aws" {
  region = "us-east-2"
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name           = "webserver-production"
  db_remote_state_bucket = "jowens-terraform-up-and-running-state"
  db_remote_state_key    = "production/data-stores/mysql/terraform.tfstate"
}

terraform {
  backend "s3" {
    bucket = "jowens-terraform-up-and-running-state"
    region = "us-east-2"
    key    = "production/webserver-cluster/terraform.tfstate"
  }
}