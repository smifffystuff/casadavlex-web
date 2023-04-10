resource "aws_vpc" "casadavlex_vpc" {
    cidr_block = "172.16.0.0/16"
}

resource "aws_subnet" "private" {
  count = var.az_count
  cidr_block = cidrsubnet(aws_vpc.casadavlex_vpc.cidr_block, 8, count.index)
  availability_zone = data.aws_availability_zones.az_available.names[count.index]
  vpc_id = aws_vpc.casadavlex_vpc.id
}

resource "aws_subnet" "public" {
  count = var.az_count
  cidr_block = cidrsubnet(aws_vpc.casadavlex_vpc.cidr_block, 8, var.az_count + count.index)
  availability_zone = data.aws_availability_zones.az_available.names[count.index]
  vpc_id = aws_vpc.casadavlex_vpc.id
}

resource "aws_internet_gateway" "casadavlex_ig" {
  vpc_id = aws_vpc.casadavlex_vpc.id
}

resource "aws_route" "internet_access" {
  route_table_id = aws_vpc.casadavlex_vpc.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.casadavlex_ig.id
}

resource "aws_eip" "casadavlex_eip" {
  count = var.az_count
  vpc = true
  depends_on = [
    aws_internet_gateway.casadavlex_ig
  ]
}

resource "aws_nat_gateway" "casadavlex_natgw" {
  count = var.az_count
  subnet_id = element(aws_subnet.public.*.id, count.index)
  allocation_id = element(aws_eip.casadavlex_eip.*.id, count.index)
}

resource "aws_route_table" "private" {
  count = var.az_count
  vpc_id = aws_vpc.casadavlex_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = element(aws_nat_gateway.casadavlex_natgw.*.id, count.index)
  }
}