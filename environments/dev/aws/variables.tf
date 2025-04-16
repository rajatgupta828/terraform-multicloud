variable "vpc_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet_cidrs" {
  type = string
  default = "10.0.2.0/24"
}

variable "private_subnet_cidrs" {
  type = string
  default = "10.0.1.0/24"
}

variable "azs" {
  type = list(string)
}

variable "region" {
  type        = string
  description = "Cloud region"
}
