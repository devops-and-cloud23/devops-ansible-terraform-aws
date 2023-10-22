# Create elastic IP to associate with NAT gateway
resource "aws_eip" "nat_eip" {
  depends_on = [aws_internet_gateway.igw]
}

# Create NAT gateway
resource "aws_nat_gateway" "nat_gw" { 
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet1.id

  tags = {
    Name = "Nat Gateway"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  # depends_on = [aws_internet_gateway.example]
}
