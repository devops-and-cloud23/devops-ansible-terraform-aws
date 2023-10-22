# Create the ACL
resource "aws_network_acl" "main" {
  vpc_id = aws_vpc.prod_vpc.id
  
  # Subnets on which it will be applied
 # subnet_ids = [aws_subnet.public_subnet1.id,aws_subnet.public_subnet2.id,aws_subnet.private_subnet.id]

  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.vpc_cidr # Make all instances able to talk to the outside world
    from_port  = 0 
    to_port    = 0
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.all_cidr # Incoming from any source
    from_port  = var.http_port
    to_port    = var.http_port
  }

    ingress {
    protocol   = "tcp"
    rule_no    = 101
    action     = "allow"
    cidr_block = var.all_cidr # Incoming from any source
    from_port  = var.ssh_port
    to_port    = var.ssh_port
  }

    ingress {
        protocol   = "tcp"
        rule_no    = 102
        action     = "allow"
        cidr_block = var.all_cidr # Incoming from any source
        from_port  = var.jenkins_port
        to_port    = var.jenkins_port
  }


    ingress {
        protocol   = "tcp"
        rule_no    = 103
        action     = "allow"
        cidr_block = var.all_cidr # Incoming from any source
        from_port  = var.sonarqube_port
        to_port    = var.sonarqube_port
  }

      ingress {
        protocol   = "tcp"
        rule_no    = 104
        action     = "allow"
        cidr_block = var.all_cidr # Incoming from any source
        from_port  = var.grafana_port
        to_port    = var.grafana_port
  }


  tags = {
    Name = "Main ACL"
  }
}
