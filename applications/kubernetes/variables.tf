variable "admin_user" {
    description = "This is to create the admin user"
    type = string
}

variable "project_tag" {
    description = "This is to create the project tag"
    type = string
}

variable "main_cidr" {
    description = "This is the main CIDR block"
    type = string
}

variable "kube_subnet" {
    description = "This is the subnet for Kubernetes"
    type = string
}

variable "kube_vpc" {
    description = "This is the VPC for Kubernetes"
    type = string
}

variable "key_pair_name" {
    type = string
    description = "This is to create ssh keys assign to EC2 machines for remote access"
}

variable "pub_key" {
    type = string
    sensitive = true
    description = "This is to assign the public_key"
}

variable "kube_ami" {
    type = string
    description = "This is the kubernetes base ami"
}

variable "kube_ec2_type" {
    type = string
    description = "This is the Kubernetes ec2 instance type"
}

variable "kube_ec2_subnet" {
    type = string
    description = "This is the Kubernetes cluster subnet"
}

variable "kube_key_name" {
    type = string
    description = "This is the base kubernetes key to access EC2"
}