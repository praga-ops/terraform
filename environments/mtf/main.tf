provider "aws" {
        region = "ap-south-1"
}

module "iam" {
    source = "../../modules/iam"
    admin_user = var.admin_user
    project_tag = var.project_tag
}

output "List-of-changes" {
    value = <<EOT
    1. This will create a IAM user "${var.admin_user}"
    EOT
}

output "admin_user" {
    value = module.iam.admin_user
}