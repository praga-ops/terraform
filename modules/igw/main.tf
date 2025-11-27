resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_cidr

  tags = {
    project = var.project_tag
  }
}