# Create security groups

# For jenkins
resource "aws_security_group" "jenkins_sg" {
  name        = "Jenkins SG"
  description = "Allow port 8080 and 22"
  vpc_id      = aws_vpc.prod_vpc.id

  # Inbound rule
  ingress {
    description      = "Jenkins http proxy access"
    from_port        = var.jenkins_port
    to_port          = var.jenkins_port
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  # Inbound rule
  ingress {
    description      = "SSH access"
    from_port        = var.ssh_port
    to_port          = var.ssh_port
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0 # All ports are allowed
    to_port          = 0 # All ports are allowed
    protocol         = -1 # Any protocol
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Jenkins SG"
  }
}


# For sonarqube
resource "aws_security_group" "sonarqube_sg" {
  name        = "Sonarqube SG"
  description = "Allow port 9000 and 22"
  vpc_id      = aws_vpc.prod_vpc.id

  # Inbound rule
  ingress {
    description      = "Sonarqube"
    from_port        = var.sonarqube_port
    to_port          = var.sonarqube_port
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  # Inbound rule
  ingress {
    description      = "SSH"
    from_port        = var.ssh_port
    to_port          = var.ssh_port
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0 # All ports are allowed
    to_port          = 0 # All ports are allowed
    protocol         = -1 # Any protocol
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Sonarqube SG"
  }
}

# For ansible
resource "aws_security_group" "ansible_sg" {
  name        = "Ansible SG"
  description = "Allow port  22"
  vpc_id      = aws_vpc.prod_vpc.id


  # Inbound rule
  ingress {
    description      = "SSH"
    from_port        = var.ssh_port
    to_port          = var.ssh_port
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0 # All ports are allowed
    to_port          = 0 # All ports are allowed
    protocol         = -1 # Any protocol
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Ansible SG"
  }
}


# For application
resource "aws_security_group" "app_sg" {
  name        = "Application SG"
  description = "Allow ports 80 and 22"
  vpc_id      = aws_vpc.prod_vpc.id


 # Inbound rule
  ingress {
    description      = "Http"
    from_port        = var.http_port
    to_port          = var.grafana_port
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  # Inbound rule
  ingress {
    description      = "SSH"
    from_port        = var.ssh_port
    to_port          = var.ssh_port
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0 # All ports are allowed
    to_port          = 0 # All ports are allowed
    protocol         = "-1" # Any protocol
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Application SG"
  }
}


# For grafana
resource "aws_security_group" "grafana_sg" {
  name        = "Grafana SG"
  description = "Allow ports 3000 and  22"
  vpc_id      = aws_vpc.prod_vpc.id


 # Inbound rule
  ingress {
    description      = "Grafana"
    from_port        = var.grafana_port
    to_port          = var.grafana_port
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  # Inbound rule
  ingress {
    description      = "SSH"
    from_port        = var.ssh_port
    to_port          = var.ssh_port
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0 # All ports are allowed
    to_port          = 0 # All ports are allowed
    protocol         = "-1" # Any protocol
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Grafana SG"
  }
}


# For load balancer
resource "aws_security_group" "lb_sg" {
  name        = "LoadBalancer SG"
  description = "Allow ports 80"
  vpc_id      = aws_vpc.prod_vpc.id


  # Inbound rule
  ingress {
    description      = "LoadBalancer"
    from_port        = var.http_port
    to_port          = var.http_port
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

# Outbound rule
  egress {
    from_port        = 0 # All ports are allowed
    to_port          = 0 # All ports are allowed
    protocol         = "-1" # Any protocol
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "LoadBalancer SG"
  }
}