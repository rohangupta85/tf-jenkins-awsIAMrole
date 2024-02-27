provider "aws" {
    region = "us-east-1"
}

resource "aws_vpc" "tf_vpc" {
cidr_block = var.vpc-cidr

tags = {
    Name = "tf_vpc"
  }

}
