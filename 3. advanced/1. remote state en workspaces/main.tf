# Krijg creds uit env
provider "aws" {}


terraform {
  backend "s3" {
    bucket         = "terraform-demo-statefiles"
    key            = "demo3"
    region         = "eu-central-1"
    dynamodb_table = "terraform-demo-statefiles-locks"
    encrypt        = true
  }
}



# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "demo3" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = terraform.workspace == "default" ? "t2.micro" : "t2.nano"


  tags = {
    Name = "demo3-${terraform.workspace}"
  }

}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami
data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*-x86_64-gp2"]
  }

  owners = ["amazon"]
}