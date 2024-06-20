resource "aws_vpc" "testing" {
  cidr_block = var.cidr_block
}

resource "aws_subnet" "subnet" {
  count                   = 2
  vpc_id                  = aws_vpc.testing.id
  cidr_block              = cidrsubnet(aws_vpc.testing.cidr_block, 4, count.index)
  map_public_ip_on_launch = true
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
}

data "aws_availability_zones" "available" {}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.testing.id
}

resource "aws_route_table" "r" {
  vpc_id = aws_vpc.testing.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "a" {
  count          = 2
  subnet_id      = element(aws_subnet.subnet.*.id, count.index)
  route_table_id = aws_route_table.r.id
}

resource "aws_security_group" "allow_http" {
  vpc_id = aws_vpc.testing.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
