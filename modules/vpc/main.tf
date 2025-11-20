resource "aws_vpc" "main" {
  cidr_block = var.main_cidr

  tags = {
    project = var.project_tag
  }
}