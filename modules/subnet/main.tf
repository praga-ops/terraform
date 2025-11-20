resource "aws_subnet" "kube" {
  vpc_id = var.kube_vpc
  cidr_block = var.kube_subnet

  tags = {
    project = var.project_tag
  }
}