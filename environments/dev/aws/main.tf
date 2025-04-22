provider "aws" {
  alias   = "dev"
  region  = var.aws_region
}


module "networking_dev" {
  source = "../../../modules/networking"
  providers = {
    aws = aws.dev
  }

  vpc_name             = var.vpc_name
  vpc_cidr             = var.vpc_cidr
  region               = var.region
  private_subnet_cidrs = var.private_subnet_cidrs
  public_subnet_cidrs  = var.public_subnet_cidrs
  azs = var.azs
}

module "compute" {
  source            = "../../../modules/compute"
  public_subnet_ids = module.networking_dev.public_subnet_ids
  private_subnet_ids = module.networking_dev.private_subnet_ids
  vpc_id            = module.networking_dev.vpc_id
  bastion_sg_id = module.networking_dev.bastion_sg_id
  linux_2_ami = var.linux_2_ami
  bastion_instance_type = var.bastion_instance_type
}