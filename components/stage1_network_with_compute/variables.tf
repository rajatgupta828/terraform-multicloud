variable "vpc_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet_cidrs" {
  type = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  type = list(string)
  default = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "azs" {
  type = list(string)
}

variable "region" {
  type        = string
  description = "Cloud region"
}

variable "aws_region" {
  description = "AWS region to deploy to"
  type        = string
  default     = "ap-south-1"  # or your desired region
}

variable "linux_2_ami" {
  type = string
  description = "Linux 2 AMI id"
}

variable "bastion_instance_type" {
  type        = string
  description = "Instance type for bastion host"
  default     = "t2.micro"
}

