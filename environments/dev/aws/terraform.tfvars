vpc_name              = "dev-vpc"
vpc_cidr              = "10.0.0.0/16"
public_subnet_cidrs   = ["10.0.11.0/24", "10.0.12.0/24"]
private_subnet_cidrs  = ["10.0.21.0/24", "10.0.22.0/24"]
azs                   = ["ap-south-1a", "ap-south-1b"]
region                = "ap-south-1"
linux_2_ami           = "ami-091dccf4e2d272bae"