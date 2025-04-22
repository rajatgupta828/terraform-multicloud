terraform {
  backend "s3" {
    bucket = "rajat-dev-terraform-aws"
    key    = "dev/aws/terraform.tfstate"
    region = "ap-south-1"
  }
}