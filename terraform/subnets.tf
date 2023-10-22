# Create public subnets
resource "aws_subnet" "public_subnet1" {
  vpc_id     = aws_vpc.prod_vpc.id
  cidr_block = var.public_subnet1_cidr
  availability_zone = var.availability_zones[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "Public subnet 1"
  }
}

resource "aws_subnet" "public_subnet2" {
  vpc_id     = aws_vpc.prod_vpc.id
  cidr_block = var.public_subnet2_cidr
  availability_zone = var.availability_zones[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "Public subnet 2"
  }
}

# Create private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.prod_vpc.id
  cidr_block = var.private_subnet_cidr
  availability_zone = var.availability_zones[1]
  

  tags = {
    Name = "Private subnet"
  }
}