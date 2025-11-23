output "kube_cluster_subnet" {
    value = aws_subnet.kube.cidr_block
}

output "kube_cluster_vpc" {
    value = aws_subnet.kube.vpc_id
}

output "kube_cluster_subnet_id" {
    value = aws_subnet.kube.id
}