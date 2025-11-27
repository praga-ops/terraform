provider "aws" {
        region = "ap-south-1"
}

locals {
    subnet_map = {
        for sub, s in var.subs:
        sub => (
            [for k, v in var.vpcs:
                k if split("/", v.cidr_block)[0] == split("/", s.cidr_block)[0]
            ][0]
        )
    }
}

module "iam" {
    source = "../../modules/iam"

    for_each = var.iam_user

    admin_user = each.value.name
    project_tag = each.value.project
}

module "igw" {
    source = "../../modules/igw"

    for_each = var.igws

    vpc_cidr = module.vpc[each.value.vpc_id].main_cidr_id
    project_tag = each.value.project
}

module "vpc" {
    source = "../../modules/vpc"

    for_each = var.vpcs

    main_cidr = each.value.cidr_block
    project_tag = each.value.project
}

module "subnet" {
    source = "../../modules/subnet"

    for_each = var.subs

    kube_vpc = module.vpc[local.subnet_map[each.key]].main_cidr_id
    kube_subnet = each.value.cidr_block
    project_tag = each.value.project
}

module "key_pair" {
    source = "../../modules/key_pair"

    for_each = var.keys

    key_pair_name = each.value.key_name
    pub_key = each.value.public_key
}

module "ec2" {
    source = "../../modules/ec2"

    for_each = var.instances

    kube_ami      = each.value.ami
    kube_ec2_type = each.value.instance_type
    kube_ec2_subnet    = module.subnet[each.value.kube_subnet_for_ec2].kube_cluster_subnet_id
    kube_key_name = module.key_pair[each.value.kube_key_pair_for_ec2].SSH_key_name
    project_tag = each.value.project
}

output "main_cidr_id" {
    value = { for k, v in module.vpc : k => v.main_cidr_id }
}

output "main_iam_users" {
    value = { for k, v in module.iam : k => v.admin_user}
}

output "main_subnet_id" {
    value = { for k, v in module.subnet : k => v.kube_cluster_subnet_id }
}

output "ssh_key_name" {
    value = { for k, v in module.key_pair : k => v.SSH_key_name}
}

output "ec2_instances_ip" {
    value = { for k, v in module.ec2 : k => v.kube-server}
}

output "igw_ids" {
  value = data.aws_internet_gateway.default
}