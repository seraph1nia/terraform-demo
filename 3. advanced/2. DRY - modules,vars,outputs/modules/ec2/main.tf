resource "aws_instance" "nginx" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t2.micro"
  associate_public_ip_address = true

  subnet_id       = var.subnet_id
  security_groups = [aws_security_group.http.id]

  user_data = <<EOF
#!/bin/bash
sudo yum install httpd -y
sudo echo "<h1>terraform demo in workspace: ${terraform.workspace}</h1>" > /var/www/html/index.html
sudo chmod a+r /var/www/html/index.html
sudo systemctl enable httpd
sudo systemctl start httpd
EOF

  tags = var.tags

}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami
data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  owners = ["amazon"]
}

resource "aws_security_group" "http" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags

}