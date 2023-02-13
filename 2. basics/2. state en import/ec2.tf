# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami
data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*-x86_64-gp2"]
  }

  owners = ["amazon"]
  
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "demo2" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  network_interface {
    network_interface_id = aws_network_interface.demo2.id
    device_index         = 0
  }
}

resource "aws_network_interface" "demo2" {
  subnet_id = aws_subnet.demo2.id
}