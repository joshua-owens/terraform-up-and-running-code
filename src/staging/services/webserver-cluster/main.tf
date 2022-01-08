provider "aws" {
  region = "us-east-2"
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"
}

terraform {
  backend "s3" {
    bucket = "jowens-terraform-up-and-running-state"
    region = "us-east-2"
    key    = "staging/webserver-cluster/terraform.tfstate"
  }
}