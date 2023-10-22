output "jenkins_public_ip" {
    description = "Public IP of Jenkins instance"
    value = aws_instance.jenkins-server.public_ip
}

output "jenkins_public_dns" {
    description = "Public DNS of Jenkins instance"
    value = aws_instance.jenkins-server.public_dns
}