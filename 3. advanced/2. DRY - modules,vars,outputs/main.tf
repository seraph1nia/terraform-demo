# Krijg creds uit env
provider "aws" {}


# https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest
# gebruik module uit registry
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs            = ["eu-central-1a"]
  public_subnets = ["10.0.101.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Workspace = terraform.workspace
    Name      = "${terraform.workspace}-module"
  }
}


# gebruik lokale module
module "ec2" {
  source = "./modules/ec2"

  subnet_id = module.vpc.public_subnets[0]
  size      = "t2.micro"
  vpc_id    = module.vpc.vpc_id

  tags = {
    Terraform = "true"
    Workspace = terraform.workspace
    Name      = "${terraform.workspace}-module"
  }
}



