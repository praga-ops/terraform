provider "aws" {
        region = "ap-south-1"
}

module "iam" {
    source = "../../modules/iam"
    admin_user = var.admin_user
    project_tag = var.project_tag
}

output "admin_user" {
    value = module.iam.admin_user
}