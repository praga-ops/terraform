output "kube-server" {
    value = aws_instance.main.public_ip
}