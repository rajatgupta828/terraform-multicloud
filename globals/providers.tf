# globals/providers.tf
provider "aws" {
  alias   = "dev"
  region  = var.aws_region
  profile = "dev"  # optional if using profiles
}
