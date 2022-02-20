provider "aws" {
  region = "us-east-2"
}

resource "aws_security_group_rule" "allow_testing_inbound" {
  from_port         = 12345
  protocol          = "tcp"
  security_group_id = module.webserver_cluster.alb_security_group_id
  to_port           = 12345
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name           = "webserver-staging"
  db_remote_state_bucket = "jowens-terraform-up-and-running-state"
  db_remote_state_key    = "staging/data-stores/mysql/terraform.tfstate"
  enable_autoscaling     = false
}

terraform {
  backend "s3" {
    bucket = "jowens-terraform-up-and-running-state"
    region = "us-east-2"
    key    = "staging/webserver-cluster/terraform.tfstate"
  }
}
