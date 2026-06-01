terraform {
  backend "s3" {
    bucket = "backup-vault"
    region = "ap-south-1"
    key = "eks/terraform.tfstate"
  }
}