# globals/providers.tf
provider "aws" {
  alias   = "dev"
  region  = var.aws_region
}
