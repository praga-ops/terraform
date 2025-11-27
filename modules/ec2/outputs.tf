output "kube-server" {
    value = aws_instance.main.private_ip
}