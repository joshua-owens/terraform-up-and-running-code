variable "user_names" {
  description = "Create IAM users with these names"
  type        = list(string)
  default     = ["poppy", "tonks"]
}