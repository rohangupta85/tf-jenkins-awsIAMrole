terraform {
  backend "s3" {
    bucket         = "rg-terraform-state"
    key            = "./terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "rg_ddb_table"
  }
}