data "aws_internet_gateway" "default" {
    tags = {
        project = var.project_tag
    }
}