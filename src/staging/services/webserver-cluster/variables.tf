variable "bucket_name" {
  default     = "staging/webserver-cluster/terraform.tfstate"
  description = "The S3 bucket name to store state file in."
  value       = string
}