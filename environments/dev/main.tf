provider "aws" {
        region = "ap-south-1"
}

module "iam" {
    source = "../../modules/iam"
    admin_user = var.admin_user
    project_tag = var.project_tag
}

module "vpc" {
    source = "../../modules/vpc"
    main_cidr = var.main_cidr
    project_tag = var.project_tag
}

output "List-of-changes" {
    value = <<EOT
    1. This will create a IAM user "${var.admin_user}"
    2. This will create a VPC "${var.main_cidr}"
    EOT
}

output "admin_user" {
    value = module.iam.admin_user
}

output "main_cidr" {
    value = module.vpc.main_cidr
}