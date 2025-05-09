variable "private_subnet_ids" {
  type = list(string)
}
variable "public_subnet_ids" {
  type = list(string)
}
variable "vpc_id" {}

variable "instance_key" {
    type        = string
    description = "Key pair name for EC2 instances"
    default = "rajat-ssh-key"
}
variable "bastion_sg_id" {}

variable "linux_2_ami" {
  type = string
  description = "Linux 2 AMI id"
}

variable "bastion_instance_type" {
    type        = string
    description = "Instance type for bastion host"
    default     = "t2.micro"
}
