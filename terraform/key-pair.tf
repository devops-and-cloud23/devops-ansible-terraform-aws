resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = var.key_value
}