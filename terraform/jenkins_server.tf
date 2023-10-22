
resource "aws_key_pair" "my_key" {
  key_name   = var.key_name # Remplacez par le nom de votre clé
  public_key = file("newKey.pub")
}
# Create the Jenkins instance
resource "aws_instance" "jenkins-server"{
  ami = var.linux2_ami
  instance_type = var.micro_instance
  availability_zone = var.availability_zones[0]
  subnet_id = aws_subnet.public_subnet1.id
  associate_public_ip_address = true
  key_name = "newKey"
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
  user_data = file("jenkins_install.sh")

  tags = {
    Name = "Jenkins"
  }
}
