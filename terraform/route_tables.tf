# Create public route table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.prod_vpc.id

  route {
    # Refers to all IPv4 address
    cidr_block = var.all_cidr
    # Refers of routing of all IPv4 address in public subnet to internet gateway
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Public-route-table"
  }
}


# Create private route table
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.prod_vpc.id

  route {
    # Refers to all IPv4 address
    cidr_block = var.all_cidr
    # Refers of routing of all IPv4 address in private subnet to nat gateway
    gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = "Private-route-table"
  }
}