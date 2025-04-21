terraform {
  backend "s3" {
    #bucket = "741018200149-terraform-resources1"
    bucket = "rajat-dev-terraform-aws"
    key    = "dev/aws/terraform.tfstate"
    region = "ap-south-1"
  }
}