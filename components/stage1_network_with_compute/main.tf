module "networking" {
  source                = "../../modules/networking"
  vpc_name              = var.vpc_name
  vpc_cidr              = var.vpc_cidr
  private_subnet_cidrs  = var.private_subnet_cidrs
  public_subnet_cidrs   = var.public_subnet_cidrs
  azs                   = var.azs
  region                = var.region
}

module "compute" {
  source             = "../../modules/compute"
  public_subnet_ids  = module.networking.public_subnet_ids
  private_subnet_ids = module.networking.private_subnet_ids
  vpc_id             = module.networking.vpc_id
  bastion_sg_id      = module.networking.bastion_sg_id
  linux_2_ami        = var.linux_2_ami
}