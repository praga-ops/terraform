resource "aws_iam_user" "admin" {
  name = var.admin_user
  path = "/"

  tags = {
    project = var.project_tag
  }
}