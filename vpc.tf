/*
# Optional: Define a VPC if you need one
resource "aws_vpc" "app_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
}

*/
#=======
#vineet code
#=============

module "vpc" {
  source         = "terraform-aws-modules/vpc/aws"
  version        = "3"
  name           = "DR_Proj"
  cidr           = "10.0.0.0/16"
  azs            = ["ap-south-1", "ap-south-2"]
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  tags = {
    "env" = "dev"
  }
}

data "aws_vpc" "main" {
  id = module.vpc.vpc_id
}