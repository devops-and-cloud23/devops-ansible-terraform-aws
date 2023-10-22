# Creatre internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.prod_vpc.id
  tags = {
    Name = "Internet gateway"
  }
}