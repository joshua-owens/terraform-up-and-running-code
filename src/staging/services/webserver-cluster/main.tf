provider "aws" {
  region = "us-east-2"
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name           = "webserver-staging"
  db_remote_state_bucket = "jowens-terraform-up-and-running-state"
  db_remote_state_key    = "staging/data-stores/mysql/terraform.tfstate"
}

terraform {
  backend "s3" {
    bucket = "jowens-terraform-up-and-running-state"
    region = "us-east-2"
    key    = "staging/webserver-cluster/terraform.tfstate"
  }
}