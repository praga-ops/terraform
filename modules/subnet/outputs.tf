output "kube_subnet" {
    value = aws_subnet.kube.cidr_block
}

output "kube_vpc" {
    value = aws_subnet.kube.vpc_id
}