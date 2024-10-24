resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_variables.cidr_block
  enable_dns_hostnames = var.vpc_variables.enable_dns_hostnames
  tags = {
    Name = var.vpc_variables.TagName
  }
}

resource "aws_subnet" "public_subnets" {
  for_each                = { for idx, indx in var.pub_subnets : idx => indx }
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = each.value.cidr_block
  map_public_ip_on_launch = each.value.map_public_ip_on_launch
  availability_zone       = each.value.availability_zone
  tags                    = each.value.TagName
}

resource "aws_subnet" "private_subnets" {
  for_each                = { for idx, indx in var.pri_subnets : idx => indx }
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = each.value.cidr_block
  map_public_ip_on_launch = each.value.map_public_ip_on_launch
  availability_zone       = each.value.availability_zone
  tags                    = each.value.TagName
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags   = var.igw_variables
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = var.public_route_tables_tag
}

resource "aws_route_table_association" "public_route_table_association" {
  count          = length(aws_subnet.public_subnets)
  route_table_id = aws_route_table.public_route_table.id
  subnet_id      = aws_subnet.public_subnets[count.index].id
}

// eip for private subnets

resource "aws_eip" "eip" {
  domain = aws_vpc.vpc.id
  tags   = var.eip_variables
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_subnets[0].id
  tags          = var.nat_gateway_tags
}

resource "aws_route_table" "private_route_table" {
  vpc_id     = aws_vpc.vpc.id
  depends_on = [aws_nat_gateway.nat_gateway]
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }
  tags = var.private_route_tables_tag
}

resource "aws_route_table_association" "private_route_table_association" {
  count          = length(aws_subnet.private_subnets)
  route_table_id = aws_route_table.private_route_table.id
  subnet_id      = aws_subnet.private_subnets[count.index].id
}