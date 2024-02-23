resource "aws_vpc" "tf_vpc" {
cidr_block = var.vpcid

tags = {
    Name = "tf_vpc"
  }

}
