// vpc 
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_variables.cidr_block
  enable_dns_hostnames = var.vpc_variables.enable_dns_hostnames
  tags = {
    Name = var.vpc_variables.TagName
  }
}


// public subnet 
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet.cidr_block
  map_public_ip_on_launch = var.public_subnet.map_public_ip_on_launch
  availability_zone       = var.public_subnet.availability_zone
  depends_on              = [aws_vpc.vpc]
  tags = {
    Name = var.public_subnet.TagName
  }
}

// internet gateway

resource "aws_internet_gateway" "internet_gateway" {
  depends_on = [aws_vpc.vpc]
  vpc_id     = aws_vpc.vpc.id
  tags = {
    Name = "internet-gateway-for-jenkins-server"
  }
}

// route table 

resource "aws_route_table" "route_table" {
  vpc_id     = aws_vpc.vpc.id
  depends_on = [aws_vpc.vpc]
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
  tags = {
    Name = "route_table_for_jenkins_server"
  }
}

// aws route association 

resource "aws_route_table_association" "association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.route_table.id
}