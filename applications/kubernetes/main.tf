provider "aws" {
        region = "ap-south-1"
}

module "iam" {
    source = "../../modules/iam"

    for_each = var.iam_user

    admin_user = each.value.name
    project_tag = each.value.project
}

module "vpc" {
    source = "../../modules/vpc"

    for_each = var.vpcs

    main_cidr = each.value.cidr_block
    project_tag = each.value.project
}

output "main_cidr_id" {
    value = { for k, v in module.vpc : k => v.main_cidr_id }
}

output "main_iam_users" {
    value = { for k, v in module.iam : k => v.admin_user}
}