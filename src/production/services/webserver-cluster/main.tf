provider "aws" {
  region = "us-east-2"
}

resource "aws_autoscaling_schedule" "scale_out_during_business_hours" {
  scheduled_action_name = "scale-out-during-business-hours"
  min_size              = 2
  max_size              = 10
  desired_capacity      = 10
  recurrence            = "0 9 * * *"

  autoscaling_group_name = module.webserver_cluster.asg_name
}

resource "aws_autoscaling_schedule" "scale_in_at_night" {
  scheduled_action_name = "scale-in-at-night"
  min_size              = 2
  max_size              = 10
  desired_capacity      = 2
  recurrence            = "0 17 * * *"

  autoscaling_group_name = module.webserver_cluster.asg_name
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name           = "webserver-production"
  db_remote_state_bucket = "jowens-terraform-up-and-running-state"
  db_remote_state_key    = "production/data-stores/mysql/terraform.tfstate"

  custom_tags = {
    Owner      = "team-foo"
    DeployedBy = "terraform"
  }
}

terraform {
  backend "s3" {
    bucket = "jowens-terraform-up-and-running-state"
    region = "us-east-2"
    key    = "production/webserver-cluster/terraform.tfstate"
  }
}