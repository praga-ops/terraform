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

module "subnet" {
    source = "../../modules/subnet"

    kube_subnet = var.kube_subnet
    kube_vpc = module.vpc.main_cidr_id
    project_tag = var.project_tag
}

module "key_pair" {
    source = "../../modules/key_pair"

    key_pair_name = var.key_pair_name
    pub_key = var.pub_key
}

module "ec2" {
    source = "../../modules/ec2"

    kube_ami = var.kube_ami
    kube_ec2_type = var.kube_ec2_type
    kube_ec2_subnet = module.subnet.kube_cluster_subnet_id
    kube_key_name = module.key_pair.SSH_key_name
    project_tag = var.project_tag
}

output "List-of-changes" {
    value = <<EOT
    1. This will create a IAM user "${var.admin_user}"
    2. This will create a VPC "${var.main_cidr}"
    3. This will create a Subnet for Kubernetes "${var.kube_subnet}"
    4. This will create a Key-pair for EC2 instances"
    5. This will create a EC2 instance in kube-VPC and kube-subnet.
    EOT
}

output "admin_user" {
    value = module.iam.admin_user
}

output "main_cidr" {
    value = module.vpc.main_cidr
}

output "SSH_key_name" {
    value = module.key_pair.SSH_key_name
}

output "kube-server" {
    value = module.ec2.kube-server
}

output "kube_subnet" {
    value = module.subnet.kube_cluster_subnet
}

output "kube_vpc" {
    value = module.subnet.kube_cluster_vpc
}