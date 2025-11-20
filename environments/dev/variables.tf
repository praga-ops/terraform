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