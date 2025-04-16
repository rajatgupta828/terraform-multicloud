provider "aws" {
  region = "us-west-2"
}

module "networking" {
  source = "../../../modules/networking"

  vpc_name             = var.vpc_name
  vpc_cidr             = var.vpc_cidr
  region               = var.region
  private_subnet_cidrs = var.private_subnet_cidrs
  public_subnet_cidrs  = var.public_subnet_cidrs
  azs = var.azs
}
