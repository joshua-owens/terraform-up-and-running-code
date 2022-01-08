variable "bucket_name" {
  default     = "jowens-terraform-up-and-running-state"
  description = "The S3 bucket name to store state file in."
  type        = string
}