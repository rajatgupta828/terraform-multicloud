
variable "aws_region" {
  description = "The AWS region to deploy to"
  type        = string
}

variable "aws_profile" {
  description = "AWS CLI profile to use"
  type        = string
  default     = "default"  # or your named profile
}
