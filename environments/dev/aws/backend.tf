terraform {
  backend "s3" {
    bucket = "741018200149-terraform-resources1"
    key    = "dev/aws/terraform.tfstate"
    region = "us-west-2"
  }
}
