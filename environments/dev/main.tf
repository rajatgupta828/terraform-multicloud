module "vpc" {
  source    = "../../modules/networking"
  vpc_cidr  = var.vpc_cidr
  region    = var.region
  vpc_name    = var.vpc_name
}