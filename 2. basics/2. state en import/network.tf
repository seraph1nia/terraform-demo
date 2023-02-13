data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc" "demo2" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "demo2" {
  vpc_id            = aws_vpc.demo2.id
  cidr_block        = "10.0.10.0/24"
  availability_zone = data.aws_availability_zones.available.names[0]
}