# Create route tables associations to subnets

resource "aws_route_table_association" "to_public_subnet1" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public_rt.id
}
resource "aws_route_table_association" "to_public_subnet2" {
    subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.public_rt.id
}


resource "aws_route_table_association" "to_private_subnet" {
    subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_rt.id
}