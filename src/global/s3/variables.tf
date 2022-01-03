variable "bucket_name" {
  default     = "global/s3/terraform.tfstate"
  description = "The s3 bucket name to store state in"
  type        = string
}