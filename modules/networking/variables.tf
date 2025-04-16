variable "vpc_cidr" {
  type        = string
  description = "CIDR block for VPC"
}

variable "region" {
  type        = string
  description = "Cloud region"
}

variable "vpc_name" {
  type        = string
  description = "Name of VPC"
}

variable "public_subnet_cidrs" {
    type        = string
    description = "CIDR block for private subnets"
}

variable "private_subnet_cidrs" {
  type        = string
  description = "CIDR block for public subnets"
}

variable "azs" {
  type = list(string)
}