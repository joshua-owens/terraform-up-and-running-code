variable "db_password" {
  description = "The password for the database."
  type        = string
}

variable "bucket_name" {
  default     = "jowens-terraform-up-and-running-state"
  description = "The s3 bucket name to store state in"
  type        = string
}
